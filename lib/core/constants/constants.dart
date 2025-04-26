import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

import '../app_theme/app_colors.dart';
import '../app_theme/custom_themes.dart';
import '../assets_path/lottie_path.dart';
import '../cache_helper/cache_keys.dart';
import '../cache_helper/shared_pref_methods.dart';

// import '../cache_manager/cache_keys.dart';
// import '../cache_manager/shared_preferences.dart';

// String imageToBase64(File image) {
//   List<int> bytes = image.readAsBytesSync();
//   return base64Encode(bytes);
// }

SnackBar customSnackBar(
  BuildContext context, {
  required String text,
  TextStyle? textStyle,
  Widget? content,
  SnackBarAction? snackBarAction,
  TextAlign textAlign = TextAlign.start,
}) {
  return SnackBar(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.r),
    ),
    elevation: 0,
    action: snackBarAction,
    behavior: SnackBarBehavior.fixed,
    backgroundColor: Colors.transparent,
    duration: const Duration(seconds: 1),
    content: Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        gradient: LinearGradient(
          colors: AppColors.gradientColorsList.reversed.toList(),
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: content ??
          Text(
            text,
            textAlign: textAlign,
            style: textStyle ??
                CustomThemes.whiteColoTextTheme(context).copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
          ),
    ),
  );
}

void showProgressIndicator(BuildContext context) {
  AlertDialog alertDialog = AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Center(
      child: Container(
        padding: EdgeInsets.all(
          32.sp,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.whiteColor,
        ),
        child: Lottie.asset(
          LottiePath.loading,
        ),
      ),
    ),
  );
  showDialog(
    context: context,
    builder: (context) => WillPopScope(
      child: alertDialog,
      onWillPop: () async {
        return true;
      },
    ),
    barrierDismissible: true,
  );
}

void showToast({required int errorType, required String message}) {
  if (errorType == 0) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      gravity: ToastGravity.SNACKBAR,
    );
  } else {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        gravity: ToastGravity.SNACKBAR);
  }
}

// String? token = CacheHelper.getData(key: CacheKeys.token);
// String? onboarding = CacheHelper.getData(key: CacheKeys.onboarding);
// String? userId = CacheHelper.getData(key: CacheKeys.userId);
// String? userType = CacheHelper.getData(key: CacheKeys.userType);
String initialLocale = CacheHelper.getData(key: CacheKeys.initialLocale) ?? "en";

double calculateTextSize(BuildContext context, double baseSize) {
  double screenWidth = MediaQuery.of(context).size.width;
  double textScaleFactor = MediaQuery.of(context).textScaleFactor;
  return baseSize * screenWidth / 375 * textScaleFactor;
}

Size preferredSize = AppBar().preferredSize;

List<String> dummyCity = [
  "Test1"
      "Test2"
];
