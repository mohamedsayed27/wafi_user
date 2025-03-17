
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_theme/custom_themes.dart';
import 'package:wafi_user/core/constants/extensions.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../translations/locale_keys.g.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({super.key});

  @override
  Widget build(BuildContext context) {
    InputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(
        color: AppColors.greyColor9,
        width: 0.59.w,
      ),
    );
    return Stack(
      alignment: AlignmentDirectional.centerEnd,
      children: [
        SizedBox(
          height: 40.h,
          child: TextField(
            style: CustomThemes.greyColor1CTextStyle(context)
                .copyWith(fontSize: 12.sp),
            decoration: InputDecoration(
              border: border,
              enabledBorder: border,
              focusedBorder: border,
              disabledBorder: border,
              filled: true,
              fillColor: AppColors.whiteColor,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 27.w,
                vertical: 11.h,
              ),
              hintText: LocaleKeys.send.tr(),
              hintStyle:  CustomThemes.greyColor1CTextStyle(context)
                  .copyWith(fontSize: 12.sp),
            ),
          ),
        ).onlyDirectionalPadding(end: 8.w),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: const CircleBorder(),
            minimumSize: Size(43.w, 43.h),
            elevation: 0,
            padding: EdgeInsets.zero,
            shadowColor: Colors.transparent,
            foregroundColor: AppColors.whiteColor,
          ),
          child: Icon(Icons.send,color: AppColors.whiteColor,),
        )
      ],
    );
  }
}
