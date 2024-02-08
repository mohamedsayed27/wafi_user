import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import 'custom_sized_box.dart';
import 'custom_text_form_field.dart';

class FormItemWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String title;
  final String hintText;
  final bool isRequired;
  final bool enabled;
  final Widget? suffixIcon;
  final bool isNotVisible;
  final int? maxlines;
  const FormItemWidget({
    super.key,
    this.controller,
    this.maxlines,
    required this.title,
    required this.hintText,
    this.isRequired = false,
    this.enabled = true, this.suffixIcon, this.isNotVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: title.tr(),
            style: CustomThemes.greyColor16TextStyle(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal
            ),
            children: [
              if (isRequired)
                TextSpan(
                  text: " *",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.red,
                  ),
                )
            ],
          ),
        ),
        const CustomSizedBox(
          height: 8,
        ),
        CustomTextField(
          hintText: hintText,
          enabled: enabled,
          maxlines: maxlines,
          filled: null,
          isNotVisible: isNotVisible,
          suffixIcon: suffixIcon,
          fillColor: null,
          controller: controller,
        ),
      ],
    );
  }
}
