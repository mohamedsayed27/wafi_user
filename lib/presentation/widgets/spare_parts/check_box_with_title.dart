import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_theme/custom_themes.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';

import '../../../core/app_theme/app_colors.dart';

class TitledCheckBox extends StatefulWidget {
  final String title;
  final CrossAxisAlignment crossAxisAlignment;
  const TitledCheckBox({
    super.key,
    required this.title,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  State<TitledCheckBox> createState() => _TitledCheckBoxState();
}

class _TitledCheckBoxState extends State<TitledCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: widget.crossAxisAlignment,
      children: [
        Container(
          height: 20.h,
          width: 20.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.r),
            gradient: LinearGradient(
              colors: AppColors.gradientColorsList,
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
            ),
          ),
          alignment: Alignment.center,
          child: Checkbox(
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            },
            visualDensity: const VisualDensity(
                horizontal: VisualDensity.maximumDensity, vertical: VisualDensity.maximumDensity),
            focusColor: AppColors.whiteColor,
            fillColor: WidgetStateProperty.all(
              isChecked ? Colors.transparent : AppColors.whiteColor,
            ),
            checkColor: AppColors.whiteColor,
            side: const BorderSide(color: AppColors.whiteColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.r),
              side: const BorderSide(color: AppColors.whiteColor),
            ),
          ),
        ),
        const CustomSizedBox(
          width: 12,
        ),
        Expanded(
          child: Text(
            widget.title,
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        )
      ],
    );
  }
}
