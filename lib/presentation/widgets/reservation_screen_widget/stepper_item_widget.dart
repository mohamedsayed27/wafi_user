import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/assets_path/fonts_path.dart';
import '../shared_widgets/custom_sized_box.dart';

class StepperWidget extends StatelessWidget {
  final bool isSelected;
  final String title;
  final double width;
  final String svgIcon;

  const StepperWidget({
    super.key,
    required this.isSelected,
    required this.title,
    required this.width,
    required this.svgIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      child: Column(
        children: [
          Container(
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: isSelected
                    ? AppColors.gradientColorsList
                    : [const Color(0xff858483), const Color(0xff858483)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              svgIcon,
              width: 20.w,
              height: 20.h,
              colorFilter: const ColorFilter.mode(AppColors.whiteColor, BlendMode.srcIn,),
            ),
          ),
          const CustomSizedBox(
            height: 8,
          ),
          GradientText(
            title,
            colors: isSelected
                ? AppColors.gradientColorsList
                : [const Color(0xff858483), const Color(0xff858483)],
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
                height: 1,
                fontSize: 12.sp,
                fontFamily: FontsPath.almarai,
                fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
