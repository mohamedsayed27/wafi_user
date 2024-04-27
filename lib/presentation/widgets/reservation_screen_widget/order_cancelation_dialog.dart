import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';
import 'package:wafi_user/core/constants/extensions.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_text_form_field.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradiant_color_button.dart';

import '../../../core/app_theme/custom_themes.dart';
import 'order_canceled_dialog.dart';

class OrderCancelDialog extends StatelessWidget {
  const OrderCancelDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.whiteColor,
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      surfaceTintColor: AppColors.whiteColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.cancel_outlined),
            ),
          ),
          Text(
            "Reason for cancelation",
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          CustomSizedBox(
            height: 16,
          ),
          const RadioGroup(),
          const CustomTextField(
            hintText: "Add any other Reason...",
            maxlines: 4,
          ),
          CustomSizedBox(
            height: 16,
          ),
          CustomGradientButton(
            height: 48,
            borderRadius: 4,
            child: Text(
              "Submit",
              style: CustomThemes.whiteColoTextTheme(context).copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            onPressed: () {
              showDialog(context: context, builder: (_)=>OrderCanceledDialog());
            },
          ),
          CustomSizedBox(
            height: 16,
          ),
        ],
      ).symmetricPadding(horizontal: 16),
    );
  }
}

class RadioGroup extends StatefulWidget {
  const RadioGroup({super.key});

  @override
  _RadioGroupState createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RadioListTile<String>(
          title: Text(
            "There are many variations of passages.",
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          contentPadding: EdgeInsets.zero,
          value: "passages",
          groupValue: selectedOption,
          dense: true,
          visualDensity: VisualDensity(horizontal: VisualDensity.minimumDensity),
          onChanged: (value) {
            setState(() {
              selectedOption = value;
            });
          },
        ),
        RadioListTile<String>(
          title: Text(
            "Words don't look even slightly.",
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          contentPadding: EdgeInsets.zero,
          value: "words",
          groupValue: selectedOption,
          dense: true,
          visualDensity: VisualDensity(horizontal: VisualDensity.minimumDensity),
          onChanged: (value) {
            setState(() {
              selectedOption = value;
            });
          },
        ),
        RadioListTile<String>(
          title: Text(
            "Single Ventricle Defects.",
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          contentPadding: EdgeInsets.zero,
          value: "ventricle",
          groupValue: selectedOption,
          dense: true,
          visualDensity: VisualDensity(horizontal: VisualDensity.minimumDensity),
          onChanged: (value) {
            setState(() {
              selectedOption = value;
            });
          },
        ),
        RadioListTile<String>(
          title: Text(
            "Random don't look even slightly believable.",
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          contentPadding: EdgeInsets.zero,
          dense: true,
          visualDensity: VisualDensity(horizontal: VisualDensity.minimumDensity),
          value: "random",
          groupValue: selectedOption,
          onChanged: (value) {
            setState(() {
              selectedOption = value;
            });
          },
        ),
        RadioListTile<String>(
          title: Text(
            "Sed ut perspiciatis unde.",
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          visualDensity: VisualDensity(horizontal: VisualDensity.minimumDensity),
          contentPadding: EdgeInsets.zero,
          dense: true,
          value: "sed",
          groupValue: selectedOption,
          onChanged: (value) {
            setState(() {
              selectedOption = value;
            });
          },
        ),
      ],
    );
  }
}
