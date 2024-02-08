import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';

import '../../../core/app_theme/custom_themes.dart';
import 'custom_elevated_button.dart';

class WhiteElevatedButton extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  const WhiteElevatedButton({super.key, required this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor(),
            offset: Offset(0, 4.h),
            blurRadius: 12.r,
          ),
        ]
      ),
      child: CustomElevatedButton(
        onPressed: onPressed,
        backgroundColor: AppColors.whiteColor,
        foregroundColor: AppColors.colorE02,
        padding: EdgeInsets.zero,
        borderRadius: 4,
        child: child,
      ),
    );
  }
}
