import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';

class CustomDivider extends StatelessWidget {
  final double height;
  final Widget? child;
  final AlignmentGeometry? alignment;
  const CustomDivider({super.key, this.height = 8, this.child, this.alignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: double.infinity,
      color: AppColors.blackColor.withOpacity(0.03),
      alignment: alignment,
      child: child,
    );
  }
}
