import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/svg_path.dart';
import 'custom_sized_box.dart';
import 'gradient_svg.dart';

class FormDateWidget extends StatelessWidget{
  final String title;
  final bool isRequired;

  const FormDateWidget({
    super.key,
    required this.title,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: title.tr(),
            style: CustomThemes.greyColor16TextStyle(context).copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal
            ),
            children: [
              if (isRequired)
                TextSpan(
                  text: " *",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.red,
                  ),
                )
            ],
          ),
        ),
        const CustomSizedBox(
          height: 8,
        ),
        InkWell(
          onTap: (){
            showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime.now().add(const Duration(days: 60)));
          },
          child: Ink(
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 14.h),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: AppColors.borderColor,
                width: 1.w,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "22 10 Dec",
                    textAlign: TextAlign.start,
                    style: CustomThemes.greyColor16TextStyle(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                const GradientSvg(svgPath: SvgPath.calendar,height: 20,width: 20,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
