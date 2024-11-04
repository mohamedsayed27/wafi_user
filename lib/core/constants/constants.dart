import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../app_theme/app_colors.dart';
import '../cache_helper/cache_keys.dart';
import '../cache_helper/shared_pref_methods.dart';

// import '../cache_manager/cache_keys.dart';
// import '../cache_manager/shared_preferences.dart';

// String imageToBase64(File image) {
//   List<int> bytes = image.readAsBytesSync();
//   return base64Encode(bytes);
// }

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
        child: const CircularProgressIndicator.adaptive(
          backgroundColor: AppColors.primaryColor,
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
String initialLocale =
    CacheHelper.getData(key: CacheKeys.initialLocale) ?? "en";

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
