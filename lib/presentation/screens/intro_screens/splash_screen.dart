import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wafi_user/core/app_router/screens_name.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';
import 'package:wafi_user/core/assets_path/svg_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = false;

  @override
  void initState() {
    Timer(
      const Duration(seconds: 1),
      () {
        setState(() =>isLoading = true);
        _loading();
      },
    );
    super.initState();
  }

  _loading(){

    Timer(
      const Duration(seconds: 1),
          () {
            Navigator.pushReplacementNamed(context, ScreenName.selectLanguageScreen);
      },
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.gradientColorsList,
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
          ),
        ),
        alignment: Alignment.center,
        child: AnimatedOpacity(
          opacity: isLoading ? 1.0 : 0.0,
          duration: const Duration(
            seconds: 2,
          ),
          child: SvgPicture.asset(
            SvgPath.wafiLogo,
            height: 48.h,
            width: 180.w,
            colorFilter: const ColorFilter.mode(
              AppColors.whiteColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
