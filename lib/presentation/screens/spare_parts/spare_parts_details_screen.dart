import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/fonts_path.dart';
import '../../../core/assets_path/images_path.dart';
import '../../../core/assets_path/svg_path.dart';
import '../../../data/models/car_spare_parts_model/car_spare_part_model.dart';
import '../../../presentation/widgets/shared_widgets/cached_network_image_widget.dart';
import '../../../presentation/widgets/shared_widgets/custom_app_bar.dart';
import '../../../presentation/widgets/shared_widgets/custom_divider.dart';
import '../../../presentation/widgets/shared_widgets/custom_sized_box.dart';
import '../../../presentation/widgets/shared_widgets/empty_content_widget.dart';
import '../../../presentation/widgets/shared_widgets/gradient_svg.dart';
import '../../../core/services/services_locator.dart';
import '../../../translations/locale_keys.g.dart';
import '../../business_logic/cart_cubit/cart_cubit.dart';
import '../../widgets/shared_widgets/gradiant_color_button.dart';

class SparePartsDetailsScreen extends StatelessWidget {
  final CarSparePartModel carSparePartModel;

  const SparePartsDetailsScreen({
    super.key,
    required this.carSparePartModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.search.tr(),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
        children: [
          Align(
            alignment: Alignment.center,
            child: CachedNetworkImageWidget(
              imageUrl: carSparePartModel.imageUrl ?? "",
              height: 180.h,
              width: 180.w,
              fit: BoxFit.scaleDown,
            ),
          ),
          const CustomSizedBox(
            height: 38,
          ),
          Wrap(
            children: [
              GradientText(
                carSparePartModel.title ?? "",
                colors: AppColors.gradientColorsList,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 21.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontsPath.almarai,
                  height: 1,
                ),
              ),
              const CustomSizedBox(
                width: 8,
              ),
              GradientText(
                carSparePartModel.pieceNum ?? "",
                colors: AppColors.gradientColorsList,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontsPath.almarai,
                  height: 1,
                ),
              ),
            ],
          ),
          // Align(
          //   alignment: AlignmentDirectional.centerEnd,
          //   child: BlocProvider<CartCubit>.value(
          //     value: sl<CartCubit>(),
          //     child: BlocBuilder<CartCubit, CartState>(builder: (context, state) {
          //       var cubit = CartCubit.get(context);
          //       return Container(
          //         constraints: const BoxConstraints(
          //           minWidth: 150,
          //           maxWidth: 400,
          //         ),
          //         decoration: BoxDecoration(
          //           color: AppColors.whiteColor,
          //           borderRadius: BorderRadius.circular(8.r),
          //           border: Border.all(
          //             color: AppColors.borderColor,
          //             width: 1.w,
          //           ),
          //         ),
          //         child: Row(
          //           mainAxisSize: MainAxisSize.min,
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             IconButton(
          //               onPressed: () {
          //                 if (cubit.cartList
          //                         .firstWhere((element) => element.id == carSparePartModel.id)
          //                         .counter >
          //                     1) {
          //                   cubit.decreaseItemCount(carSparePartModel);
          //                 } else {
          //                   cubit.removeItemFromCart(carSparePartModel);
          //                 }
          //               },
          //               icon: const Icon(Icons.remove),
          //               style: IconButton.styleFrom(padding: EdgeInsets.zero),
          //             ),
          //             Text(
          //               "${cubit.cartList.firstWhere((element) => element.id == carSparePartModel.id).counter}",
          //               textAlign: TextAlign.center,
          //               style: CustomThemes.greyColor16TextStyle(context).copyWith(
          //                 fontSize: 14.sp,
          //                 fontWeight: FontWeight.w700,
          //                 fontStyle: FontStyle.normal,
          //               ),
          //             ),
          //             IconButton(
          //               padding: EdgeInsets.zero,
          //               onPressed: () {
          //                 cubit.increaseItemCount(carSparePartModel);
          //               },
          //               icon: const Icon(Icons.add),
          //               style: IconButton.styleFrom(padding: EdgeInsets.zero),
          //             ),
          //           ],
          //         ),
          //       );
          //     }),
          //   ),
          // ),
          const CustomSizedBox(
            height: 16,
          ),
          Text(
            "Details",
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          const CustomSizedBox(
            height: 12,
          ),
          carSparePartModel.details != null
              ? ListView.builder(
                  itemBuilder: (_, index) {
                    return DetailsWithSvgItem(
                      isGradient: false,
                      title: carSparePartModel.details![index].title!,
                      imagePath: carSparePartModel.details![index].icon!,
                    );
                  },
                  itemCount: carSparePartModel.details!.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                )
              : const EmptyContentWidget(
                  height: 60,
                  width: 80,
                  // title: "No details added",
                ),
          const CustomSizedBox(
            height: 16,
          ),
          const CustomDivider(
            height: 8,
          ),
          const CustomSizedBox(
            height: 16,
          ),
          Text(
            "Inclusions",
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          const CustomSizedBox(
            height: 12,
          ),
          carSparePartModel.inclusion != null
              ? ListView.builder(
                  itemBuilder: (_, index) {
                    return DetailsWithSvgItem(
                      title: carSparePartModel.inclusion![index],
                    );
                  },
                  itemCount: carSparePartModel.inclusion!.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                )
              : const EmptyContentWidget(
                  height: 60,
                  width: 80,
                  // title: "No details added",
                ),
          const CustomSizedBox(
            height: 16,
          ),
          const CustomDivider(
            height: 8,
          ),
          const CustomSizedBox(
            height: 16,
          ),
          Text(
            "Reviews",
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          const CustomSizedBox(
            height: 12,
          ),
          CustomSizedBox(
            height: 165,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(
                vertical: 5.h,
              ),
              itemBuilder: (_, index) => const ReviewsItemWidget(),
              separatorBuilder: (_, index) => const CustomSizedBox(
                width: 16,
              ),
              itemCount: 5,
            ),
          ),
          const CustomSizedBox(
            height: 24,
          ),
          BlocProvider<CartCubit>.value(
            value: sl<CartCubit>(),
            child: BlocBuilder<CartCubit, CartState>(builder: (context, state) {
              var cubit = CartCubit.get(context);
              return !cubit.cartList.any((element) => element.id == carSparePartModel.id)
                  ? CustomGradientButton(
                      borderRadius: 4,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${carSparePartModel.price! * carSparePartModel.counter} SAR",
                            style: CustomThemes.whiteColoTextTheme(context).copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Add to cart",
                                style: CustomThemes.whiteColoTextTheme(context).copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 18.r,
                                color: AppColors.whiteColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                      onPressed: () {
                        cubit.addItemToCart(carSparePartModel);
                      },
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cubit.cartList.any((element) => element.id == carSparePartModel.id)
                              ? "${cubit.cartList.firstWhere((element) => element.id == carSparePartModel.id).counter * cubit.cartList.firstWhere((element) => element.id == carSparePartModel.id).price!}"
                              : "${carSparePartModel.price} SAR",
                          style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(
                            minWidth: 150,
                            maxWidth: 400,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(
                              color: AppColors.borderColor,
                              width: 1.w,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (cubit.cartList
                                          .firstWhere(
                                              (element) => element.id == carSparePartModel.id)
                                          .counter >
                                      1) {
                                    cubit.decreaseItemCount(carSparePartModel);
                                  } else {
                                    cubit.removeItemFromCart(carSparePartModel);
                                  }
                                },
                                icon: const Icon(Icons.remove),
                                style: IconButton.styleFrom(padding: EdgeInsets.zero),
                              ),
                              Text(
                                "${cubit.cartList.firstWhere((element) => element.id == carSparePartModel.id).counter}",
                                textAlign: TextAlign.center,
                                style: CustomThemes.greyColor16TextStyle(context).copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  cubit.increaseItemCount(carSparePartModel);
                                },
                                icon: const Icon(Icons.add),
                                style: IconButton.styleFrom(padding: EdgeInsets.zero),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
            }),
          ),
        ],
      ),
    );
  }
}

class DetailsWithSvgItem extends StatelessWidget {
  final bool isGradient;
  final String imagePath;
  final String title;

  const DetailsWithSvgItem({
    super.key,
    this.isGradient = true,
    this.imagePath = SvgPath.trueIcon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!isGradient)
          CachedNetworkImageWidget(
            imageUrl: imagePath,
            width: 14.w,
            fit: BoxFit.scaleDown,
          ),
        if (isGradient)
          GradientSvg(
            svgPath: imagePath,
            height: 14.h,
            width: 14.w,
          ),
        const CustomSizedBox(
          width: 14,
        ),
        Text(
          title,
          style: CustomThemes.greyColor1CTextStyle(context).copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}

class ReviewsItemWidget extends StatelessWidget {
  const ReviewsItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 277.w,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.borderColor,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Image.asset(
                ImagesPath.userNullImage,
                height: 24.h,
                width: 24.w,
              ),
              const CustomSizedBox(
                width: 4,
              ),
              Text(
                "Eugene Dean",
                style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              RatingBar.builder(
                initialRating: 5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                itemSize: 12.r,
                itemBuilder: (context, _) => SvgPicture.asset(
                  SvgPath.star,
                  colorFilter: const ColorFilter.mode(
                    Colors.amber,
                    BlendMode.srcIn,
                  ),
                ),
                onRatingUpdate: (rating) {},
              )
            ],
          ),
          const CustomSizedBox(
            height: 8,
          ),
          Text(
            "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: CustomThemes.greyColor99TextStyle(context).copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
