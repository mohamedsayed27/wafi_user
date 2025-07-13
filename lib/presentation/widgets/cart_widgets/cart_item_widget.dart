import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';
import 'package:wafi_user/core/app_theme/custom_themes.dart';
import 'package:wafi_user/data/models/car_spare_parts_model/car_spare_part_model.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_divider.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';

import '../../../core/app_router/screens_name.dart';
import '../../../core/services/services_locator.dart';
import '../../business_logic/cart_cubit/cart_cubit.dart';
import '../shared_widgets/cached_network_image_widget.dart';

class CartItemWidget extends StatelessWidget {
  final CarSparePartModel carSparePartModel;
  const CartItemWidget({super.key, required this.carSparePartModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ScreenName.sparePartsDetailsScreen,
          arguments: [carSparePartModel],
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              offset: const Offset(4, 4),
              color: AppColors.shadowColor(),
              blurRadius: 8.r,
            ),
            BoxShadow(
              offset: const Offset(-4, -4),
              color: AppColors.shadowColor(),
              blurRadius: 8.r,
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImageWidget(
                      imageUrl: carSparePartModel.logoUrl ?? "",
                      fit: BoxFit.scaleDown,
                      height: 12.h,
                      width: 84.w,
                    ),
                    const CustomSizedBox(
                      height: 16,
                    ),
                    Text(
                      carSparePartModel.title ?? "",
                      style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const CustomSizedBox(
                      height: 8,
                    ),
                    Text(
                      carSparePartModel.pieceNum ?? "",
                      style: CustomThemes.greyColor99TextStyle(context).copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                CachedNetworkImageWidget(
                  imageUrl: carSparePartModel.imageUrl ?? "",
                  fit: BoxFit.scaleDown,
                  width: 80,
                  height: 80,
                ),
              ],
            ),
            const CustomSizedBox(
              height: 16,
            ),
            const CustomDivider(
              height: 1.5,
            ),
            const CustomSizedBox(
              height: 16,
            ),
            BlocProvider<CartCubit>.value(
              value: sl<CartCubit>(),
              child: BlocBuilder<CartCubit, CartState>(builder: (context, state) {
                var cubit = CartCubit.get(context);
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      // cubit.cartList.any((element) => element.id == carSparePartModel.id)
                      //     ? "${cubit.cartList.firstWhere((element) => element.id == carSparePartModel.id).counter * cubit.cartList.firstWhere((element) => element.id == carSparePartModel.id).price!}"
                      //     : "${carSparePartModel.price} SAR",
                      "${carSparePartModel.price} SAR",
                      style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: AppColors.borderColor,
                          width: 1.w,
                        ),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (cubit.cartList
                                      .firstWhere((element) => element.id == carSparePartModel.id)
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
                          Expanded(
                            child: Text(
                              "${cubit.cartList.firstWhere((element) => element.id == carSparePartModel.id).counter}",
                              textAlign: TextAlign.center,
                              style: CustomThemes.greyColor16TextStyle(context).copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                          IconButton(
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
            )
          ],
        ),
      ),
    );
  }
}
