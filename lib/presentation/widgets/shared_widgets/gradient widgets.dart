import 'package:flutter/material.dart';

class GradientWidget extends StatelessWidget {
  const GradientWidget({
    super.key,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
    required this.child, this.gradientList , this.isGradient = true, this.shaderCallback,
  });

  final Widget child;
  final List<Color>? gradientList;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final bool isGradient;
  final Shader Function(Rect)? shaderCallback;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: shaderCallback??(bounds) => isGradient?LinearGradient(
        colors: gradientList??[],
        begin: begin,
        end: end,
          stops: const [-0.1097, 0.3978, 0.7435, 1.1446]
      ).createShader(bounds,):const LinearGradient(
        colors: [Colors.transparent, Colors.transparent],
      ).createShader(bounds),
      child: child,
    );
  }
}
