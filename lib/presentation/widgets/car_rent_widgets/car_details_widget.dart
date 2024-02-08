import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/images_path.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';

class CarDetailsWidget extends StatelessWidget {
  const CarDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Car Details",
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
          width: double.infinity,
          height: 79.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: AppColors.locationDetailsContainer,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hyundai Accent",
                      style:
                      CustomThemes.greyColor16TextStyle(context).copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    const CustomSizedBox(
                      height: 4,
                    ),
                    Text(
                      "2020",
                      style:
                      CustomThemes.greyColor16TextStyle(context).copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                ImagesPath.car2,
                width: 96.w,
                height: 61.h,
              ),
            ],
          ),
        )
      ],
    );
  }
}