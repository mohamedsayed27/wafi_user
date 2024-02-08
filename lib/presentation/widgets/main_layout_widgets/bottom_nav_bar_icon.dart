import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradient%20widgets.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradient_svg.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';

class BottomNavBarIcon extends StatelessWidget {
  final String label;
  final String iconPath;
  final void Function() onTap;
  final double? iconWidth;
  final bool isSelected;
  final double? iconHeight;

  const BottomNavBarIcon({
    Key? key,
    required this.label,
    required this.iconPath,
    required this.onTap,
    this.iconWidth,
    this.iconHeight,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.zero,
        side: const BorderSide(color: Colors.transparent),
        foregroundColor: AppColors.primaryColor,
        backgroundColor: Colors.transparent,
        shape: const CircleBorder(),
      ),
      onPressed: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          GradientSvg(svgPath: iconPath, isSelected: isSelected,height: 22.h,width: 22.w,),
          SizedBox(
            height: 4.h,
          ),
          GradientWidget(
            gradientList: AppColors.gradientColorsList,
            isGradient: isSelected,
            child: Text(
              label,
              style: CustomThemes.greyColor75TextStyle(context).copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
