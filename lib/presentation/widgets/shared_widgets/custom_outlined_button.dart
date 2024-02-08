import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomOutlinedButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? elevation;
  final double borderRadius;
  final Color borderColor;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final void Function()? onPressed;
  final Widget? child;
  final String? text;
  final TextStyle? style;

  const CustomOutlinedButton({
    super.key,
    this.width,
    this.height,
    required this.borderColor,
    this.foregroundColor,
    this.onPressed,
    this.child,
    this.text,
    required this.borderRadius,
    this.style,
    this.elevation,
    this.padding, this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height?.h,
      width: width?.w,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor??Colors.white,
          elevation: elevation,
          padding: padding,
          shadowColor: Colors.transparent,
          side: BorderSide(color: borderColor, width: 1.w),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius.r),),
        ),
        child: child
      ),
    );
  }
}
