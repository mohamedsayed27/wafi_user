import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';
import 'package:wafi_user/core/app_theme/custom_themes.dart';
import '../../../core/constants/constants.dart' as preferred;

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final double elevation;
  final bool centerTitle;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.elevation = 2,
    this.centerTitle = false, this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      surfaceTintColor: AppColors.whiteColor,
      elevation: elevation,
      shadowColor: AppColors.shadowColor(value: 0.2),
      title: Text(
        title,
        style: CustomThemes.greyColor1CTextStyle(context).copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: centerTitle,
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => preferred.preferredSize;
}
