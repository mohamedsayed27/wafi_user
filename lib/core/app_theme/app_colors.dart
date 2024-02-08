import 'package:flutter/material.dart';

class AppColors {
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  static const primaryColor = Color(0xffFB154B);
  static const whiteColor = Color(0xffFFFFFF);
  static const colorE02 = Color(0xffE02020);
  static const dashedBorderColor = Color(0xff0D346F);
  static const successCompletedOrderColor = Color(0xff37BA6E);
  static const greyColorF3 = Color(0xffF3F3F3);
  static const greyColor9 = Color(0xff999999);
  static const greyColor97 = Color(0xff979797);
  static const greyColorDC = Color(0xffDCDCDC);
  static const greyColorD8 = Color(0xffD8D8D8);
  static const locationDetailsContainer = Color(0xffFEF6F3);
  static const greyColor75 = Color(0xff757575);
  static const greyColorF7 = Color(0xffF7F7F7);
  static const color1C = Color(0xff1C1C1C);
  static const color16 = Color(0xff161616);
  static const blackColor = Color(0xff000000);
  static const blueColor = Color(0xff0091FF);
  static const greenColor = Color(0xff278638);
  static Color borderColor = const Color(0xff000000).withOpacity(0.11);
  static Color shadowColor({value = 0.05}) => const Color(0xff000000).withOpacity(value);

  /// Categories Items Color
  static const firstGradientColor = Color(0xffE86950);
  static const secondGradientColor = Color(0xffFB154B);
  static const thirdGradientColor = Color(0xff920E92);
  static const fourthGradientColor = Color(0xff910E93);
  static const homeScreenGradientFirstColor = Color(0xFFF85348);

  static List<Color> gradientColorsList =[
   firstGradientColor ,
   secondGradientColor ,
   thirdGradientColor ,
   fourthGradientColor ,
  ];

  static List<Color> gradientTextList =[
    firstGradientColor ,
    fourthGradientColor ,
    thirdGradientColor ,
    fourthGradientColor ,
  ];
}