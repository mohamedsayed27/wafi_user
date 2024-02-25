import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/custom_themes.dart';
import 'custom_sized_box.dart';
import 'custom_switch_button.dart';

class SwitchButtonTitleWidget extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final bool isOn;
  const SwitchButtonTitleWidget({super.key, required this.title, this.onTap, required this.isOn});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomSwitchButton(
          isOn: isOn,
          onTap: onTap,
        ),
        const CustomSizedBox(
          width: 12,
        ),
        Expanded(
          child: Text(
            title,
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
