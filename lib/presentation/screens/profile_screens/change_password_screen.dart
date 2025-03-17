import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_theme/custom_themes.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:wafi_user/translations/locale_keys.g.dart';

import '../../../core/constants/constants.dart';
import '../../widgets/shared_widgets/custom_app_bar.dart';
import '../../widgets/shared_widgets/form_item_widget.dart';
import '../../widgets/shared_widgets/gradiant_color_button.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.editPassword.tr(),
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 32.h),
        children: [
          PasswordVisibilityWidget(title: LocaleKeys.oldPassword.tr(), hintText: LocaleKeys.password.tr(),),
          const CustomSizedBox(height: 16,),
          PasswordVisibilityWidget(title: LocaleKeys.newPassword.tr(), hintText: LocaleKeys.password.tr(),),
          const CustomSizedBox(height: 16,),
          PasswordVisibilityWidget(title: LocaleKeys.retypeNewPassword.tr(), hintText: LocaleKeys.password.tr(),),
           const CustomSizedBox(
            height: 32,
          ),
          CustomGradientButton(
            onPressed: () {},
            child: Text(
              LocaleKeys.update.tr(),
              style: CustomThemes.whiteColoTextTheme(context).copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PasswordVisibilityWidget extends StatefulWidget {
  final String title;
  final String hintText;
   PasswordVisibilityWidget({super.key, required this.title, required this.hintText});

  @override
  State<PasswordVisibilityWidget> createState() => _PasswordVisibilityWidgetState();
}

class _PasswordVisibilityWidgetState extends State<PasswordVisibilityWidget> {
  bool isNotVisible = true;
  @override
  Widget build(BuildContext context) {
    return FormItemWidget(
      title: widget.title,
      hintText: widget.hintText,
      isNotVisible: isNotVisible,
      maxLines: 1,
      suffixIcon: TextButton(
        onPressed: () {
          isNotVisible=!isNotVisible;
          setState(() {

          });
        },
        child: Text(
          isNotVisible?LocaleKeys.show.tr():LocaleKeys.hide.tr(),
          style: CustomThemes.greyColor1CTextStyle(context).copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
