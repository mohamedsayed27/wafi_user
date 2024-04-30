import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../core/constants/extensions.dart';
import '../../../core/app_router/screens_name.dart';
import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/fonts_path.dart';
import '../../../core/assets_path/svg_path.dart';
import '../../../translations/locale_keys.g.dart';
import '../shared_widgets/custom_sized_box.dart';
import '../shared_widgets/gradiant_color_button.dart';
import '../shared_widgets/gradient_svg.dart';

class SpareSubmitDialog extends StatelessWidget {
  const SpareSubmitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.whiteColor,
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w,),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r,),
      ),
      surfaceTintColor: AppColors.whiteColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const GradientSvg(
            svgPath: SvgPath.progressCheck,
            width: 65,
            height: 65,
          ),
          const CustomSizedBox(
            height: 16,
          ),
          GradientText(
            LocaleKeys.paymentMethod.tr(),
            textAlign: TextAlign.center,
            colors: AppColors.gradientColorsList,
            style: TextStyle(fontFamily: FontsPath.almarai, fontSize: 16.sp,fontWeight: FontWeight.w700,),
          ),
          const CustomSizedBox(
            height: 8,
          ),
          Text(
            LocaleKeys.checkYourPolicies.tr(),
            textAlign: TextAlign.center,
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          const CustomSizedBox(
            height: 16,
          ),
          CustomGradientButton(
            height: 48,
            borderRadius: 4,
            child: Text(
              LocaleKeys.seeExistingPolicies.tr(),
              style: CustomThemes.whiteColoTextTheme(context).copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(
                context,
                ScreenName.existingPolicesScreen,
              );
            },
          ),
        ],
      ).symmetricPadding(horizontal: 20, vertical: 24),
    );
  }
}
