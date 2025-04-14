import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';
import 'package:wafi_user/core/app_theme/custom_themes.dart';
import 'package:wafi_user/core/assets_path/fonts_path.dart';
import 'package:wafi_user/core/assets_path/images_path.dart';
import 'package:wafi_user/core/assets_path/svg_path.dart';
import 'package:wafi_user/data/models/car_spare_parts_model/car_spare_part_model.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/cached_network_image_widget.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_divider.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/empty_content_widget.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradient_svg.dart';

import '../../../core/app_router/screens_name.dart';
import '../../../translations/locale_keys.g.dart';
import '../../widgets/shared_widgets/gradiant_color_button.dart';

class SparePartsDetailsScreen extends StatefulWidget {
  final CarSparePartModel carSparePartModel;
  const SparePartsDetailsScreen({super.key, required this.carSparePartModel});

  @override
  State<SparePartsDetailsScreen> createState() => _SparePartsDetailsScreenState();
}

class _SparePartsDetailsScreenState extends State<SparePartsDetailsScreen> {
  @override
  void dispose() {
    widget.carSparePartModel.counter = 1;
    super.dispose();
  }

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
              imageUrl: widget.carSparePartModel.imageUrl ?? "",
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
                widget.carSparePartModel.title ?? "",
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
                widget.carSparePartModel.pieceNum ?? "",
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
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Container(
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
                      if (widget.carSparePartModel.counter > 1) {
                        widget.carSparePartModel.counter--;
                        setState(() {});
                      }
                    },
                    icon: const Icon(Icons.remove),
                    style: IconButton.styleFrom(padding: EdgeInsets.zero),
                  ),
                  Text(
                    "${widget.carSparePartModel.counter}",
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
                      widget.carSparePartModel.counter++;
                      setState(() {});
                    },
                    icon: const Icon(Icons.add),
                    style: IconButton.styleFrom(padding: EdgeInsets.zero),
                  ),
                ],
              ),
            ),
          ),
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
          widget.carSparePartModel.details != null
              ? ListView.builder(
                  itemBuilder: (_, index) {
                    return DetailsWithSvgItem(
                      isGradient: false,
                      title: widget.carSparePartModel.details![index].title!,
                      imagePath: widget.carSparePartModel.details![index].icon!,
                    );
                  },
                  itemCount: widget.carSparePartModel.details!.length,
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
          widget.carSparePartModel.inclusion != null
              ? ListView.builder(
                  itemBuilder: (_, index) {
                    return DetailsWithSvgItem(
                      title: widget.carSparePartModel.inclusion![index],
                    );
                  },
                  itemCount: widget.carSparePartModel.inclusion!.length,
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
          CustomGradientButton(
            borderRadius: 4,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.carSparePartModel.price! * widget.carSparePartModel.counter} SAR",
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
              Navigator.pushNamed(context, ScreenName.servicesCartScreen,
                  arguments: "Services Titles");
            },
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
