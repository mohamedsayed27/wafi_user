import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';
import 'package:wafi_user/core/assets_path/fonts_path.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_elevated_button.dart';

import 'gradient widgets.dart';

class CustomGradientButton extends StatelessWidget {
  final void Function()? onPressed;
  final double borderRadius;
  final double height;
  final double width;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  const CustomGradientButton({
    super.key,
    this.onPressed,
    this.borderRadius = 6,
    this.height = 48,
    this.width = double.infinity, required this.child, this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(borderRadius.r),
      overlayColor: MaterialStateProperty.all(
        AppColors.whiteColor.withOpacity(0.3),
      ),
      onTap: onPressed,
      child: Container(
        height: height.h,
        width: width.w,
        padding: padding,
        decoration: BoxDecoration(
          color: onPressed == null ? AppColors.greyColor9 : null,
          borderRadius: BorderRadius.circular(borderRadius.r),
          gradient: onPressed != null
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: AppColors.gradientColorsList,
                  transform: const GradientRotation(134 / 180),
                  stops: const [-0.1097, 0.3978, 0.7435, 1.1446],
                )
              : null,
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
