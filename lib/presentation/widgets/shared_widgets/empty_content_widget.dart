import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:wafi_user/core/app_theme/custom_themes.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';

import '../../../core/assets_path/lottie_path.dart';

class EmptyContentWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final String? title;

  const EmptyContentWidget({super.key, this.height, this.width, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DotLottieLoader.fromAsset(
          LottiePath.empty,
          frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
            if (dotlottie != null) {
              return Lottie.memory(
                dotlottie.animations.values.single,
                  width: width,
                  height: height,
                fit: BoxFit.cover
              );
            } else {
              return Container();
            }
          },
        ),
        Text(
          title ?? "",
          style: CustomThemes.greyColor1CTextStyle(context).copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}
