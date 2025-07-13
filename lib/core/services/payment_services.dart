import 'package:flutter/services.dart';

class PaymentBridge {
  static const platform = MethodChannel('com.wafi/payment');

  static Future<void> startPayment() async {
    print("test");
    try {
      await platform.invokeMethod('startPayment');
    } on PlatformException catch (e) {
      print("Payment error: ${e.message}");
    }
  }
}
