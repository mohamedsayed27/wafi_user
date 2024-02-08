import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_drop_down_button.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import 'custom_sized_box.dart';

class FormDropDownWidget extends StatefulWidget {
  final String title;

  const FormDropDownWidget({super.key, required this.title});

  @override
  State<FormDropDownWidget> createState() => _FormDropDownWidgetState();
}

class _FormDropDownWidgetState extends State<FormDropDownWidget> {
  List<String> dummyCity = [
    "dummy City1",
    "dummy City2",
    "dummy City3",
    "dummy City4",
  ];
  String? value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: CustomThemes.greyColor16TextStyle(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal),
        ),
        const CustomSizedBox(
          height: 8,
        ),
        CustomDropDownButton(
            items: dummyCity
                .map((e) => DropdownMenuItem(
                      child: Text(e),
                      value: e,
                    ))
                .toList(),
            value: value,
            borderColor: AppColors.borderColor,
            hintText: "text",
            onChanged: (value) {
              setState(() {
                this.value = value;
              });
            }),
      ],
    );
  }
}
