import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/custom_themes.dart';

class CustomTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final TextStyle? style;
  final String title;

  const CustomTextButton({
    super.key,
    this.onPressed,
    required this.title,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: style ??
            CustomThemes.blueColorTextTheme(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}
