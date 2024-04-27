import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_theme/custom_themes.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';

import '../../../core/constants/constants.dart';
import '../../widgets/shared_widgets/custom_app_bar.dart';
import '../../widgets/shared_widgets/form_item_widget.dart';
import '../../widgets/shared_widgets/gradiant_color_button.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: const CustomAppBar(
          title: "Edit Password",
          elevation: 0,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 32.h),
        children: [
          PasswordVisibilityWidget(title: "Old Password", hintText: "Password",),
          CustomSizedBox(height: 16,),
          PasswordVisibilityWidget(title: "New Password", hintText: "Password",),
          CustomSizedBox(height: 16,),
          PasswordVisibilityWidget(title: "Retype New Password", hintText: "Password",),
          const CustomSizedBox(
            height: 32,
          ),
          CustomGradientButton(
            onPressed: () {},
            child: Text(
              "Update",
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
  const PasswordVisibilityWidget({super.key, required this.title, required this.hintText});

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
          isNotVisible?"SHOW":"Hide",
          style: CustomThemes.greyColor1CTextStyle(context).copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
