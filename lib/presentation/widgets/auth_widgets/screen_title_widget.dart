import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';

class ScreenTitleWidget extends StatelessWidget {
  final String title;

  const ScreenTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: CustomThemes.greyColor1CTextStyle(context).copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 24.sp,
          ),
        ),
        Container(
          height: 0.5,
          width: 20.w,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.colorE02,
              width: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
