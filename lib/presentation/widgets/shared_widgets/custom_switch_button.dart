import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';

class CustomSwitchButton extends StatelessWidget {
  final double itemWidth;
  final double itemHeight;
  final double circleHeightAndWidth;
  final bool isOn;
  final void Function()? onTap;
   const CustomSwitchButton({
    Key? key,
    this.itemWidth = 46,
    this.itemHeight = 26,
    this.circleHeightAndWidth = 22, required this.isOn, this.onTap,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: onTap,
      child: SizedBox(
        width: itemWidth.w,
        height: itemHeight.h,
        child: Stack(
          children: [
            Container(
              width: itemWidth.w,
              height: itemHeight.h,
              decoration: BoxDecoration(
                gradient: isOn
                    ? LinearGradient(
                        colors: AppColors.gradientColorsList,
                        begin: AlignmentDirectional.topStart,
                        end: AlignmentDirectional.bottomEnd,
                      )
                    : null,
                color: isOn ? null : AppColors.greyColor9,
                borderRadius: BorderRadius.circular(
                  15.r,
                ),
              ),
            ),
            AnimatedContainer(
              alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
              duration: const Duration(milliseconds: 150),
              margin: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
              child: Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                shape: const CircleBorder(),
                child: Container(
                  width: circleHeightAndWidth.w,
                  height: circleHeightAndWidth.h,
                  decoration: const BoxDecoration(
                    color: AppColors.whiteColor,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: isOn
                      ? Icon(
                          Icons.check,
                          size: 12.r,
                          color: AppColors.primaryColor,
                        )
                      : null,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
