import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';
import 'package:wafi_user/core/app_theme/custom_themes.dart';
import 'package:wafi_user/core/assets_path/svg_path.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradient_svg.dart';
import 'package:wafi_user/translations/locale_keys.g.dart';

class UploadFileContainer extends StatelessWidget {
  const UploadFileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: AppColors.dashedBorderColor,
      borderType: BorderType.RRect,
      dashPattern: const [8, 4],
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
      radius: const Radius.circular(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          children: [
            GradientSvg(
              svgPath: SvgPath.license,
              width: 70.w,
              height: 70.h,
            ),
            CustomSizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.add_circle_outline_sharp,
                  color: AppColors.color1C,
                ),
                const CustomSizedBox(width: 8,),
                Text(
                  LocaleKeys.uploadDriversLicense.tr(),
                  style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
