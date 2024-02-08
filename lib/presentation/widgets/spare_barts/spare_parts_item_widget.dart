import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';
import 'package:wafi_user/core/app_theme/custom_themes.dart';
import 'package:wafi_user/core/assets_path/images_path.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_divider.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradiant_color_button.dart';

class SparePartsItemWidget extends StatelessWidget {
  const SparePartsItemWidget({super.key});

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
          BoxShadow(
            offset: const Offset(4, 4),
            color: AppColors.shadowColor(),
            blurRadius: 8.r
          ),
          BoxShadow(
            offset: const Offset(-4, -4),
            color: AppColors.shadowColor(),
            blurRadius: 8.r
          )
        ]
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
                  Image.asset(
                    ImagesPath.tracmax,
                    height: 12.h,
                    width: 84.w,
                  ),
                  CustomSizedBox(height: 8,),
                  Text(
                    "P Zero PZ4 L",
                    style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomSizedBox(height: 8,),
                  Text(
                    "285/40 R22 110Y",
                    style: CustomThemes.greyColor99TextStyle(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomSizedBox(height: 8,),
                  Text(
                    "1 Year Warranty*",
                    style: CustomThemes.darkGrayColorTheme(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Image.asset(
                ImagesPath.dummyTire,
                height: 80.h,
                width: 80.w,
              ),
            ],
          ),
          const CustomSizedBox(height: 16,),
          const CustomDivider(
            height: 1.5,
          ),
          const CustomSizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "139 SAR",
                style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomGradientButton(
                width: 108,
                height: 40,
                onPressed: (){},
                child: Text(
                  "Add To Cart",
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
