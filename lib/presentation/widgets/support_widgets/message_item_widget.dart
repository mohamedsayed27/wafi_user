import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_theme/custom_themes.dart';
import 'package:wafi_user/core/constants/extensions.dart';

import '../../../core/app_theme/app_colors.dart';

class MessageItemWidget extends StatelessWidget {
  final bool isMyMessage;

  const MessageItemWidget({super.key, required this.isMyMessage});

  @override
  Widget build(BuildContext context) {
    return isMyMessage
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
              gradient: LinearGradient(
                colors: AppColors.gradientColorsList,
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
              ),
            ),
            child: Text(
              "There are many variations of passages of Lorem Ipsum available are many variations of passages of Lorem Ipsum available are many variations of another passages of Lorem Ipsum available.",
              style: CustomThemes.whiteColoTextTheme(context)
                  .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w700,),
            ),
          ).onlyDirectionalPadding(end: 16)
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                  bottomLeft: Radius.circular(16.r),
                ),
              color: AppColors.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor(value: 0.07),
                  offset: Offset(4.w, 4.h),
                  blurRadius: 8.r,
                ),
                BoxShadow(
                  color: AppColors.shadowColor(value: 0.07),
                  offset: Offset(-4.w, -4.h),
                  blurRadius: 8.r,
                )
              ]
            ),
            child: Text(
              "So, what can I help you with?",
              style: CustomThemes.greyColor1CTextStyle(context)
                  .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500,),
            ),
          ).onlyDirectionalPadding(start: 16);
  }
}
