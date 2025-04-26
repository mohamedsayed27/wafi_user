import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradient_widgets.dart';

class GradientSvg extends StatelessWidget {
  final String svgPath;
  final double? height;
  final double? width;
  final bool isSelected;
  final Color svgDisabledColor;
  const GradientSvg({
    super.key,
    required this.svgPath,
    this.height,
    this.width,
    this.isSelected = true,
    this.svgDisabledColor = AppColors.greyColor9,
  });

  @override
  Widget build(BuildContext context) {
    return GradientWidget(
      isGradient: isSelected,
      gradientList: AppColors.gradientColorsList,
      child: SvgPicture.asset(
        svgPath,
        height: height,
        width: width,
        colorFilter: ColorFilter.mode(
          svgDisabledColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
