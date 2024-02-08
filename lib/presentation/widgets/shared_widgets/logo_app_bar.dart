import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wafi_user/core/assets_path/svg_path.dart';

class LogoAppBar extends StatelessWidget {
  const LogoAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SvgPicture.asset(SvgPath.wafiLogo,height: 27.h,width: 104.w,),
      centerTitle: true,
    );
  }
}
