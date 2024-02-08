import 'package:flutter/material.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';

class GradientWidget extends StatelessWidget {
  const GradientWidget({
    super.key,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
    required this.child, this.gradientList , this.isGradient = true,
  });

  final Widget child;
  final List<Color>? gradientList;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final bool isGradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      child: child,
      shaderCallback: (bounds) => isGradient?LinearGradient(
        colors: gradientList??[],
        begin: begin,
        end: end,
          stops: const [-0.1097, 0.3978, 0.7435, 1.1446]
      ).createShader(
        bounds,
      ):const LinearGradient(
        colors: [Colors.transparent, Colors.transparent],
      ).createShader(bounds),
    );
  }
}
