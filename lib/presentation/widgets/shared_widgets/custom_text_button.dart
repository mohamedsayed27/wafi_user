import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/custom_themes.dart';
import 'custom_sized_box.dart';

class CustomTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final double height;

  const CustomTextButton({
    super.key,
    this.onPressed,
    required this.title,
    this.height = 20,
  });

  @override
  Widget build(BuildContext context) {
    return CustomSizedBox(
      height: height.h,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: CustomThemes.blueColorTextTheme(context).copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
