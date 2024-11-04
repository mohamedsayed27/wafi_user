import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';
import 'package:wafi_user/core/app_theme/custom_themes.dart';
import 'package:wafi_user/core/cache_helper/cache_keys.dart';
import 'package:wafi_user/core/cache_helper/shared_pref_methods.dart';

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
    super.initState();
    value = CacheHelper.getData(key: CacheKeys.initialLocale) == null
        ? languagesList.first
        : CacheHelper.getData(key: CacheKeys.initialLocale) == "en"
            ? languagesList.first
            : languagesList.last;
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
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: AppColors.colorE02,
        ),
        dropdownColor: AppColors.whiteColor,
        items: languagesList
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ),
            )
            .toList(),
        onChanged: (value) async{
          this.value = value!;
          if(value=="English"){
            CacheHelper.saveData(key: CacheKeys.initialLocale, value: "en").then((value) {
              EasyLocalization.of(context)?.setLocale(const Locale("en"));
            });

          }else{
            CacheHelper.saveData(key: CacheKeys.initialLocale, value: "ar").then((value) {
              EasyLocalization.of(context)?.setLocale(const Locale("ar"));
            });

          }
          setState(() {

          });
        },
        value: value,
      ),
    );
  }
}
