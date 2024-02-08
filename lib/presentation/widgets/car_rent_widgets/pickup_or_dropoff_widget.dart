import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';


class PickUpDropOffDetailsWidget extends StatelessWidget {
  const PickUpDropOffDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Pickup",
              style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
            GradientText(
              "Rental Days: 6",
              style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
              colors: AppColors.gradientColorsList,
            ),
          ],
        ),
        const CustomSizedBox(
          height: 8,
        ),
        Container(
          height: 48.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(color: AppColors.greyColorDC)),
          child: Text(
            "18 Dec, 2022  -  12:00 PM",
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        const CustomSizedBox(
          height: 8,
        ),
        Text(
          "Dropoff",
          style: CustomThemes.greyColor1CTextStyle(context).copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        ),
        const CustomSizedBox(
          height: 8,
        ),
        Container(
          height: 48.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(color: AppColors.greyColorDC)),
          child: Text(
            "26 Dec, 2020  -  12:00 PM",
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
        )
      ],
    );
  }
}