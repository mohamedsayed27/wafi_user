import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';
import 'package:wafi_user/core/app_theme/custom_themes.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/cached_network_image_widget.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_divider.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradiant_color_button.dart';

import '../../../data/models/car_spare_parts_model/car_spare_part_model.dart';
import '../../../translations/locale_keys.g.dart';

class SparePartsItemWidget extends StatelessWidget {
  final CarSparePartModel carSparePartModel;

  const SparePartsItemWidget({
    super.key,
    required this.carSparePartModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(offset: const Offset(4, 4), color: AppColors.shadowColor(), blurRadius: 8.r),
            BoxShadow(offset: const Offset(-4, -4), color: AppColors.shadowColor(), blurRadius: 8.r)
          ]),
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
                    width: 84,
                    height: 84,
                  ),
                  const CustomSizedBox(
                    height: 8,
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
                  if (carSparePartModel.warranty != null)
                    const CustomSizedBox(
                      height: 8,
                    ),
                  if (carSparePartModel.warranty != null)
                    Text(
                      "${carSparePartModel.warranty} Year Warranty*",
                      style: CustomThemes.darkGrayColorTheme(context).copyWith(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${carSparePartModel.price} SAR",
                style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomGradientButton(
                width: 108,
                height: 40,
                onPressed: () {},
                child: Text(
                  LocaleKeys.addToCart.tr(),
                  style: CustomThemes.whiteColoTextTheme(context).copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
