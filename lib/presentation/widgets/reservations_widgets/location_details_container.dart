import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';

class DetailsContainer extends StatelessWidget {
  final Widget child;
  const DetailsContainer({super.key,required this.child,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.locationDetailsContainer,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: child,
    );
  }
}
