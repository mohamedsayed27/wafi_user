import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_router/screens_name.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/constants/constants.dart';
import '../../widgets/auth_widgets/opt_field_builder.dart';
import '../../widgets/auth_widgets/screen_title_widget.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';
import '../../widgets/shared_widgets/gradiant_color_button.dart';
import '../../widgets/shared_widgets/logo_app_bar.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: const LogoAppBar(),
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            children: [
              const ScreenTitleWidget(
                title: 'Verification',
              ),
              const CustomSizedBox(
                height: 24,
              ),
              Text(
                "Enter OTP",
                style: CustomThemes.greyColor16TextStyle(context).copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ),
              const CustomSizedBox(
                height: 16,
              ),
              const PinFieldBuilder(),
              const CustomSizedBox(
                height: 40,
              ),
            ],
          ),
          Positioned(
            bottom: 80.h,
            left: 16.w,
            right: 16.w,
            child: CustomGradientButton(
              child: Text(
                "Submit",
                style: CustomThemes.whiteColoTextTheme(context).copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, ScreenName.mainLayoutScreen, (route) => false);
              },
            ),
          )
        ],
      ),
    );
  }
}