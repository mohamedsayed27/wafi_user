import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';

class CustomDropDownButton<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  final T? value;
  final String? hintText;
  final Widget? hint;
  final Widget? prefixIcon;
  final Color? borderColor;
  final Color? iconColor;
  final TextStyle? style;
  const CustomDropDownButton({
    super.key,
    required this.items,
    this.onChanged,
    this.value,
    this.hintText, this.hint, this.prefixIcon, this.style, this.borderColor, this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    InputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.r),
      borderSide: BorderSide(
        color: borderColor??AppColors.greyColor9,
        width: 1.w,
      ),
    );
    InputBorder focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.r),
      borderSide: BorderSide(
        color: borderColor??AppColors.greyColor9,
        width: 1.w,
      ),
    );
    InputBorder errorBorderColor = OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.r),
      borderSide: BorderSide(
        color: AppColors.firstGradientColor,
        width: 1.w,
      ),
    );
    return DropdownButtonFormField(
      items: items,
      onChanged: onChanged,
      value: value,
      isExpanded: true,
      hint: hint,
      style: style,
      dropdownColor: AppColors.whiteColor,

      padding: EdgeInsets.zero,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        hintStyle: CustomThemes.greyColor99TextStyle(context),
        border: border,
        contentPadding: EdgeInsetsDirectional.only(
          start: 12.w,
          end: 4.w,
          bottom: 4.h,
          top: 4.h,
        ),
        focusedBorder: focusedBorder,
        enabledBorder: border,

        disabledBorder: border,
        errorBorder: errorBorderColor,
      ),
      iconSize: 40.r,
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        size: 24.r,
        color: iconColor??AppColors.color1C,
      ),
    );
  }
}
