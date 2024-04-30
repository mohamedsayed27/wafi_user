import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../translations/locale_keys.g.dart';
import '../../widgets/car_insurance_widgets/add_driver_button_widget.dart';
import '../../widgets/shared_widgets/switch_button_and_title_widget.dart';
import '../shared_widgets/custom_sized_box.dart';
import '../shared_widgets/form_drom_down_widget.dart';
import '../shared_widgets/form_item_widget.dart';
import '../spare_barts/check_box_with_title.dart';

class OtherDetailsComponent extends StatefulWidget {
  const OtherDetailsComponent({super.key});

  @override
  State<OtherDetailsComponent> createState() => _AddDriverComponentState();
}

class _AddDriverComponentState extends State<OtherDetailsComponent> {
  bool isOn1 = false;
  bool isOn2 = false;
  bool isOn3 = false;
  bool isOn4 = false;
  bool isOn5 = false;
  BoxDecoration boxDecoration = BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: BorderRadius.circular(
      8.r,
    ),
    border: Border.all(
      color: AppColors.borderColor,
    ),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowColor(
          value: 0.1,
        ),
        offset: Offset(
          0,
          4.h,
        ),
        blurRadius: 8.r,
      ),
    ],
  );
  EdgeInsetsGeometry padding = EdgeInsets.symmetric(
    horizontal: 16.w,
    vertical: 16.h,
  );
  List<String?> titlesList = [
    "Yes",
    null,
    "No"
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FormDropDownWidget(title: LocaleKeys.vehicleNightParking.tr()),
        const CustomSizedBox(height: 24,),
        FormDropDownWidget(title: LocaleKeys.accidentCounts.tr()),
        const CustomSizedBox(height: 24,),
        FormDropDownWidget(title: LocaleKeys.expectedKmPerYear.tr()),
        const CustomSizedBox(height: 24,),
        FormDropDownWidget(title: LocaleKeys.transmissionType.tr()),
        const CustomSizedBox(height: 24,),
        Text(
          LocaleKeys.anyAdditionalModification.tr(),
          style: CustomThemes.greyColor16TextStyle(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal),
        ),
        const CustomSizedBox(height: 16,),
        Row(
          children: List.generate(
            titlesList.length,
                (index) {
              return index.isOdd
                  ? const CustomSizedBox(
                width: 24,
              )
                  : Expanded(
                child: GradientSelectButtonWidget(
                  onTap: () {
                    currentIndex = index;
                    setState(() {

                    });
                  },
                  isButtonSelected: currentIndex == index,
                  title: titlesList[index]!,
                ),
              );
            },
          ),
        ),
        const CustomSizedBox(height: 24,),
        FormDropDownWidget(title: LocaleKeys.childrenBelow16Years.tr()),
        const CustomSizedBox(height: 24,),
        FormItemWidget(title: LocaleKeys.modifications.tr(), hintText: "*******"),
        const CustomSizedBox(height: 24,),
        SwitchButtonTitleWidget(
          title: LocaleKeys.doesPolicyholderHasHealthConditions.tr(),
          isOn: isOn1,
          onTap: () {
            if (isOn1) {
              isOn1 = false;
              setState(() {});
            } else {
              isOn1 = true;
              setState(() {});
            }
          },
        ),
        const CustomSizedBox(height: 16,),
        Ink(
          decoration: boxDecoration,
          padding: padding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FormDropDownWidget(title: LocaleKeys.whichCountry.tr()),
              const CustomSizedBox(height: 16,),
              FormDropDownWidget(title: LocaleKeys.howManyYears.tr()),
            ],
          ),
        ),
        const CustomSizedBox(height: 24,),
        SwitchButtonTitleWidget(
          title: LocaleKeys.doesPolicyholderHasHealthConditions.tr(),
          isOn: isOn2,
          onTap: () {
            if (isOn2) {
              isOn2 = false;
              setState(() {});
            } else {
              isOn2 = true;
              setState(() {});
            }
          },
        ),
        const CustomSizedBox(height: 24,),
        Ink(
          decoration: boxDecoration,
          padding: padding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.selectLicenseHealthConditions.tr(),
                style: CustomThemes.greyColor16TextStyle(context).copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal),
              ),
              const CustomSizedBox(height: 16,),
              TitledCheckBox(title: " ${LocaleKeys.automaticVehicles.tr()}"),
              const CustomSizedBox(height: 8,),
              TitledCheckBox(title: " ${LocaleKeys.automaticVehicles.tr()}"),
              const CustomSizedBox(height: 8,),
              TitledCheckBox(title: " ${LocaleKeys.automaticVehicles.tr()}"),
              const CustomSizedBox(height: 8,),
              TitledCheckBox(title: " ${LocaleKeys.automaticVehicles.tr()}"),
              const CustomSizedBox(height: 8,),
              TitledCheckBox(title: " ${LocaleKeys.automaticVehicles.tr()}"),
            ],
          ),
        ),
        const CustomSizedBox(height: 16,),
        SwitchButtonTitleWidget(
          title: LocaleKeys.doesPolicyholderHasTrafficViolations.tr(),
          isOn: isOn3,
          onTap: () {
            if (isOn3) {
              isOn3 = false;
              setState(() {});
            } else {
              isOn3 = true;
              setState(() {});
            }
          },
        ),
        Ink(
          decoration: boxDecoration,
          padding: padding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.selectViolations.tr(),
                style: CustomThemes.greyColor16TextStyle(context).copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal),
              ),
              const CustomSizedBox(height: 16,),
              TitledCheckBox(title: LocaleKeys.speedTicket.tr()),
              const CustomSizedBox(height: 8,),
              TitledCheckBox(title: LocaleKeys.speedTicket.tr()),
              const CustomSizedBox(height: 8,),
              TitledCheckBox(title: LocaleKeys.speedTicket.tr()),
              const CustomSizedBox(height: 8,),
              TitledCheckBox(title: LocaleKeys.speedTicket.tr()),
              const CustomSizedBox(height: 8,),
              TitledCheckBox(title: LocaleKeys.speedTicket.tr()),
            ],
          ),
        ),
      ],
    );
  }
}
