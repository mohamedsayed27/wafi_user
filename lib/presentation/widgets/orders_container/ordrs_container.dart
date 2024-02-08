import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';

class OrdersContainer extends StatelessWidget {
  final Color outContainerColor;
  final Widget child;

  const OrdersContainer({
    super.key,
    required this.outContainerColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.only(
        top: 2.h,
      ),
      decoration: BoxDecoration(
        color: outContainerColor,
        borderRadius: BorderRadius.circular(
          8.r,
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(
            8.r,
          ),
        ),
        child: child,
      ),
    );
  }
}
