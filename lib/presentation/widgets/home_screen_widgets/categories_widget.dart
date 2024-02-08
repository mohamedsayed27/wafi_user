import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';
import 'package:wafi_user/core/app_theme/custom_themes.dart';
import 'package:wafi_user/core/constants/extensions.dart';

class CategoriesWidget extends StatelessWidget {
  final String imagePath;
  final String title;

  const CategoriesWidget({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Image.asset(
            imagePath,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 55.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffD8D8D8),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(8.r),
                  bottomLeft: Radius.circular(8.r),
                ),gradient:  LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter, colors: [
                AppColors.whiteColor.withOpacity(0.01),
                const Color(0xFF000000).withOpacity(0.4),
                const Color(0xFF000000).withOpacity(0.8),
              ],

              ),
              ),
            ),
          ),
          Text(
            title,
            style: CustomThemes.whiteColoTextTheme(context).copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ).onlyDirectionalPadding(bottom: 16,start: 16)
        ],
      ),
    );
  }
}
