import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../shared_widgets/custom_sized_box.dart';
import '../shared_widgets/gradient_svg.dart';

class GradientSelectButtonWidget extends StatelessWidget {
  final bool isButtonSelected;
  final void Function()? onTap;
  final String? svgPath;
  final String title;

  const GradientSelectButtonWidget({
    super.key,
    required this.isButtonSelected,
    this.onTap,
    this.svgPath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(1.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          boxShadow: svgPath!=null?[
            BoxShadow(
              color: AppColors.shadowColor(
                value: 0.1,
              ),
              offset: Offset(
                0,
                4.h,
              ),
              blurRadius: 8.r,
            )
          ]:null,
          color: isButtonSelected ? null : AppColors.borderColor,
          gradient: isButtonSelected
              ? LinearGradient(
                  colors: AppColors.gradientColorsList,
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                )
              : null,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 12.h,
            horizontal: 10.w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            color: isButtonSelected ? null : AppColors.whiteColor,
            gradient: isButtonSelected
                ? LinearGradient(
                    colors: AppColors.gradientColorsList,
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                  )
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(svgPath!=null)GradientSvg(
                height: 20,
                width: 20,
                svgPath: svgPath!,
                isSelected: !isButtonSelected,
                svgDisabledColor: AppColors.whiteColor,
              ),
              if(svgPath!=null)const CustomSizedBox(
                width: 8,
              ),
              Text(
                title,
                style: isButtonSelected
                    ? CustomThemes.whiteColoTextTheme(context).copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      )
                    : CustomThemes.greyColor1CTextStyle(context).copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
