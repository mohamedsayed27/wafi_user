import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_divider.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';


class InsuranceTypeRadioGroup extends StatefulWidget {
  const InsuranceTypeRadioGroup({super.key});

  @override
  _InsuranceTypeRadioGroupState createState() =>
      _InsuranceTypeRadioGroupState();
}

class _InsuranceTypeRadioGroupState extends State<InsuranceTypeRadioGroup> {
  String selectedOption = "Standard Insurance Deductible";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(
          color: AppColors.greyColorDC,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RadioListTile(
            // title: Text("Standard Insurance Deductible"),
            title: RichText(
              text: TextSpan(
                  text: "Standard Insurance Deductible",
                  style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(
                      text: " @ 50.00 SR",
                      style:
                      CustomThemes.greyColor1CTextStyle(context).copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.greenColor,
                      ),
                    ),
                  ]),
            ),
            visualDensity:
            const VisualDensity(horizontal: VisualDensity.minimumDensity),
            contentPadding: EdgeInsets.zero,
            dense: true,
            value: "Standard Insurance Deductible",
            fillColor: const MaterialStatePropertyAll(AppColors.primaryColor),
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value as String;
              });
            },
          ),
          const CustomDivider(
            height: 2,
          ),
          RadioListTile(
            title: RichText(
              text: TextSpan(
                  text: "Full Insurance",
                  style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(
                      text: " @ 110.00 SR",
                      style:
                      CustomThemes.greyColor1CTextStyle(context).copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.greenColor,
                      ),
                    ),
                  ]),
            ),
            visualDensity:
            const VisualDensity(horizontal: VisualDensity.minimumDensity),
            fillColor: const MaterialStatePropertyAll(AppColors.primaryColor),
            contentPadding: EdgeInsets.zero,
            dense: true,
            value: "Full Insurance",
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value as String;
              });
            },
          ),
        ],
      ),
    );
  }
}