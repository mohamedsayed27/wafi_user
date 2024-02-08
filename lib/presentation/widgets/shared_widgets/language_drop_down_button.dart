import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';
import 'package:wafi_user/core/app_theme/custom_themes.dart';

class LanguageDropDownButton extends StatefulWidget {
  const LanguageDropDownButton({super.key});

  @override
  State<LanguageDropDownButton> createState() => _LanguageDropDownButtonState();
}

class _LanguageDropDownButtonState extends State<LanguageDropDownButton> {
  List<String> languagesList = [
    "English",
    "Arabic",
  ];
  late String value;

  @override
  void initState() {
    value = languagesList.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    InputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r),
      borderSide: const BorderSide(color: Colors.transparent),
    );
    return Ink(
      height: 48.h,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(4.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4.h),
            blurRadius: 12.r,
            color: AppColors.shadowColor(),
          ),
        ],
      ),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 22.w),
          border: border,
          focusedBorder: border,
          enabledBorder: border,
          disabledBorder: border,
          focusedErrorBorder: border,
        ),
        style: CustomThemes.colorE02TextStyle(context).copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
        ),
        icon: Icon(Icons.keyboard_arrow_down,color: AppColors.colorE02,),
        dropdownColor: AppColors.whiteColor,
        items: languagesList
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(
                  e,
                ),
              ),
            )
            .toList(),
        onChanged: (value) {
          this.value = value!;
          setState(() {});
        },
        value: value,
      ),
    );
  }
}
