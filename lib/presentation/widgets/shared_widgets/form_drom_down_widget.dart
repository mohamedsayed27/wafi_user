import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_drop_down_button.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import 'custom_sized_box.dart';

class FormDropDownWidget<T> extends StatelessWidget {
  final String? title;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  final T? value;
  final bool isLoadingData;

  const FormDropDownWidget({
    super.key,
    required this.title,
    required this.items,
    this.onChanged,
    this.value,
    this.isLoadingData = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title??"",
          style: CustomThemes.greyColor16TextStyle(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal),
        ),
        const CustomSizedBox(
          height: 8,
        ),
        isLoadingData
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : CustomDropDownButton(
                items: items,
                value: value,
                borderColor: AppColors.borderColor,
                hintText: title??"text",
                onChanged: onChanged,
              ),
      ],
    );
  }
}
