// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "profile": "الملف الشخصي",
  "submit": "تقديم",
  "login": "تسجيل الدخول",
  "phoneNumber": "رقم الهاتف",
  "otpMessage": "سيتم إرسال رمز التحقق إلى الرقم المدخل",
  "proceed": "المتابعة",
  "verification": "التحقق",
  "enterOtp": "ادخل رمز التحقق",
  "register": "تسجيل",
  "name": "الاسم",
  "contactNumber": "رقم الاتصال",
  "quotations": "الاقتباسات",
  "orders": "الطلبيات",
  "past": "السابقة",
  "upcoming": "القادمة"
};
static const Map<String,dynamic> en = {
  "profile": "Profile",
  "submit": "Submit",
  "login": "Login",
  "phoneNumber": "Phone Number",
  "otpMessage": "An OTP will be sent to the entered number for verification",
  "proceed": "Proceed",
  "verification": "Verification",
  "enterOtp": "Enter OTP",
  "register": "Register",
  "name": "Name",
  "contactNumber": "Contact Number",
  "quotations": "Quotations",
  "orders": "Orders",
  "past": "Past",
  "upcoming": "Upcoming"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
