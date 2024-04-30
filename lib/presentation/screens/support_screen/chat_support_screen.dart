import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';
import 'package:wafi_user/core/app_theme/custom_themes.dart';
import 'package:wafi_user/core/constants/constants.dart';
import 'package:wafi_user/core/constants/extensions.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';

import '../../../translations/locale_keys.g.dart';
import '../../widgets/support_widgets/chat_text_field.dart';
import '../../widgets/support_widgets/message_item_widget.dart';

class ChatSupportScreen extends StatelessWidget {
  const ChatSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 16.h),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor(value: 0.07),
                  offset: Offset(0, 4.h),
                  blurRadius: 10.r,
                )
              ],
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(32.r,),
                bottomLeft: Radius.circular(32.r,),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSizedBox(
                  height: preferredSize.height,
                ),
                Row(
                  children: [
                    BackButton(
                      color: AppColors.dashedBorderColor,
                    ),
                    Text(LocaleKeys.webOrdering.tr(),style: CustomThemes.darkGrayColorTheme(context).copyWith(fontSize: 16.sp,fontWeight: FontWeight.w700,),)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      LocaleKeys.spareParts.tr(),
                      style: CustomThemes.greyColor99TextStyle(context).copyWith(
                          fontSize: 14.sp, fontWeight: FontWeight.w700, height: 1),
                    ),
                    const CustomSizedBox(
                      height: 4,
                    ),
                    Text(
                      "Payment stuck during ordering.",
                      style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                          fontSize: 14.sp, fontWeight: FontWeight.w700, height: 1),
                    ),
                    const CustomSizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Dec 02, 2020  ·  03:00 pm",
                          style: CustomThemes.greyColor99TextStyle(context).copyWith(
                              fontSize: 12.sp, fontWeight: FontWeight.w700, height: 1),
                        ),
                        GradientText("${LocaleKeys.orderID.tr()}: 52145", colors: AppColors.gradientColorsList,),
                      ],
                    ),
                  ],
                ).symmetricPadding(horizontal: 16),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
              reverse: true,
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return MessageItemWidget(
                    isMyMessage: index % 2 == 0 ? true : false)
                    .onlyDirectionalPadding(bottom: 15);
              },
            ),
          ),
          const ChatTextField().symmetricPadding(horizontal: 24, vertical: 13),
        ],
      ),
    );
  }
}
