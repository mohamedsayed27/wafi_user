import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../assets_path/fonts_path.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: AppColors.createMaterialColor(
      AppColors.primaryColor,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.whiteColor,
    ),
    primaryColor: AppColors.primaryColor,
    canvasColor: AppColors.primaryColor,
    useMaterial3: true,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
    ),
    timePickerTheme: const TimePickerThemeData(
      backgroundColor: AppColors.whiteColor,

    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      menuStyle: MenuStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.whiteColor),
        surfaceTintColor: MaterialStateProperty.all(AppColors.whiteColor),

      )
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.whiteColor,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      showDragHandle: true,
    ),
    scaffoldBackgroundColor: AppColors.whiteColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        foregroundColor: AppColors.whiteColor,
        elevation: 0,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        foregroundColor: AppColors.whiteColor,
        elevation: 0,
      ),
    ),
    textTheme: const TextTheme(
        headlineMedium:TextStyle(
          fontFamily: FontsPath.almarai,
          color: AppColors.whiteColor,
        ),
        headlineLarge:TextStyle(
          fontFamily: FontsPath.almarai,
          color: AppColors.color1C,
        ),
        headlineSmall:TextStyle(
          fontFamily: FontsPath.almarai,
          color: AppColors.color16,
        ),
        titleLarge:TextStyle(
          fontFamily: FontsPath.almarai,
          color: AppColors.colorE02,
        ),
        titleMedium:TextStyle(
          fontFamily: FontsPath.almarai,
          color: AppColors.greyColor9,
        ),
        titleSmall:TextStyle(
          fontFamily: FontsPath.almarai,
          color: AppColors.blueColor,
        ),
        bodyLarge: TextStyle(
          fontFamily: FontsPath.almarai,
          color: AppColors.greyColor75,
        ),
        bodyMedium: TextStyle(
          fontFamily: FontsPath.almarai,
          color: AppColors.primaryColor,
        ),
      bodySmall: TextStyle(
        fontFamily: FontsPath.almarai,
        color: AppColors.dashedBorderColor,
      ),
    ),
  );
}
