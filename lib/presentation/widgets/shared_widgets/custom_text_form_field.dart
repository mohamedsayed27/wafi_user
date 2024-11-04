import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';

class CustomTextField extends StatelessWidget {
  final bool enabled;
  final TextEditingController? controller;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? fillColor;
  final Color? borderColor;
  final bool isNotVisible;
  final bool? filled;
  final int? maxlines;
  final TextDirection? textDirection;
  final String? Function(String?)? validator;
  final TextStyle? hintStyle;
  final FocusNode? focusNode;

  const CustomTextField({
    super.key,
    this.enabled = true,
    this.isNotVisible = false,
    this.controller,
    this.maxlines,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.focusNode,
    this.fillColor,
    this.filled,
    this.borderColor,
    this.hintStyle,
    this.validator, this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    InputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: borderColor ?? AppColors.borderColor,
        width: 1.w,
      ),
    );
    InputBorder focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: borderColor ?? AppColors.color1C,
        width: 1.w,
      ),
    );
    InputBorder errorBorderColor = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: AppColors.colorE02,
        width: 1.w,
      ),
    );
    return TextFormField(
      controller: controller,
      obscureText: isNotVisible,
      textDirection: textDirection,
      validator: validator,
      focusNode: focusNode,
      onTapOutside: (pde){
        FocusScope.of(context).unfocus();
      },
      style: CustomThemes.greyColor16TextStyle(context)
          .copyWith(fontWeight: FontWeight.w400, fontSize: 14.sp),
      maxLines: maxlines,
      decoration: InputDecoration(
        border: border,
        hintTextDirection: textDirection,
        focusedBorder: focusedBorder,
        enabledBorder: border,
        disabledBorder: border,
        suffixIconColor: MaterialStateColor.resolveWith(
          (states) => states.contains(MaterialState.focused)
              ? AppColors.primaryColor
              : AppColors.borderColor,
        ),
        errorBorder: errorBorderColor,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: fillColor,
        filled: filled,
        hintText: hintText,
        hintStyle: hintStyle ??
            CustomThemes.greyColor99TextStyle(context)
                .copyWith(fontWeight: FontWeight.w400, fontSize: 14.sp),
        enabled: enabled,
      ),
    );
  }
}
