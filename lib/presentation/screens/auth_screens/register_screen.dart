import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_router/screens_name.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';
import 'package:wafi_user/core/app_theme/custom_themes.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradiant_color_button.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/logo_app_bar.dart';

import '../../../core/constants/constants.dart';
import '../../widgets/auth_widgets/opt_field_builder.dart';
import '../../widgets/auth_widgets/screen_title_widget.dart';
import '../../widgets/shared_widgets/form_item_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: const LogoAppBar(),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        children: [
          const ScreenTitleWidget(
            title: 'Register',
          ),
          const CustomSizedBox(
            height: 24,
          ),
          const FormItemWidget(title: 'Phone Number', hintText: 'EX :- +91-0000000000',),
          const CustomSizedBox(
            height: 16,
          ),
          Text(
            "An OTP will be send to the entered number for verification",
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontWeight: FontWeight.w400,
              color: CustomThemes.greyColor1CTextStyle(context)
                  .color!
                  .withOpacity(0.5),
              fontSize: 12.sp,
            ),
          ),
          const CustomSizedBox(
            height: 164,
          ),
          CustomGradientButton(
            child: Text(
              "Submit",
              style: CustomThemes.whiteColoTextTheme(context).copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, ScreenName.otpScreen);
            },
          ),
        ],
      ),
    );
  }
}
