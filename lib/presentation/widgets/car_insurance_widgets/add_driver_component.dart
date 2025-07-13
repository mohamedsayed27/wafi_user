import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_elevated_button.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_outlined_button.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/form_date_item.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/form_drop_down_widget.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/form_item_widget.dart';
import 'package:wafi_user/presentation/widgets/spare_parts/check_box_with_title.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/constants/constants.dart';
import '../../../translations/locale_keys.g.dart';
import '../../screens/car_insurance/add_driver_screen.dart';
import '../../widgets/car_insurance_widgets/add_driver_button_widget.dart';
import '../../widgets/shared_widgets/switch_button_and_title_widget.dart';

class AddDriverComponent extends StatefulWidget {
  const AddDriverComponent({super.key});

  @override
  State<AddDriverComponent> createState() => _AddDriverComponentState();
}

class _AddDriverComponentState extends State<AddDriverComponent> {
  int rateIndex = 0;
  List<String?> rates = [
    "25",
    null,
    "50",
    null,
    "75",
    null,
    "100",
  ];
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(
              8.r,
            ),
            border: Border.all(
              color: AppColors.borderColor,
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TitleBodyTextRow(title: LocaleKeys.driverID.tr(), body: "20154545"),
              TitleBodyTextRow(title: LocaleKeys.dateOfBirth.tr(), body: "201-54-545"),
              TitleBodyTextRow(title: LocaleKeys.fullName.tr(), body: "Nick cccc"),
              Text(
                LocaleKeys.drivingPercentage.tr(),
                style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const CustomSizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  rates.length,
                  (index) {
                    return index.isOdd
                        ? const CustomSizedBox(
                            width: 8,
                          )
                        : Expanded(
                            child: GradientSelectButtonWidget(
                              onTap: () {
                                rateIndex = index;
                                setState(() {});
                              },
                              isButtonSelected: rateIndex == index,
                              title: "${rates[index]}  %",
                            ),
                          );
                  },
                ),
              ),
              const CustomSizedBox(
                height: 16,
              ),
              Center(
                child: CustomOutlinedButton(
                  borderColor: AppColors.primaryColor,
                  borderRadius: 4.r,
                  onPressed: () {},
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Text(
                    LocaleKeys.deleteDriver.tr(),
                    style: CustomThemes.primaryTextStyle(context).copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const CustomSizedBox(
          height: 24,
        ),
        Ink(
          decoration: boxDecoration,
          padding: padding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FormItemWidget(title: LocaleKeys.driverID.tr(), hintText: "**********"),
              FormDateWidget(
                title: LocaleKeys.dateOfBirth.tr(),
              ),
            ],
          ),
        ),
        const CustomSizedBox(
          height: 24,
        ),
        Ink(
          decoration: boxDecoration,
          padding: padding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SwitchButtonTitleWidget(
                title: LocaleKeys.hasRelationshipWithPolicyholder.tr(),
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
              const CustomSizedBox(
                height: 16,
              ),
              FormItemWidget(title: LocaleKeys.relationship.tr(), hintText: "**********"),
              const CustomSizedBox(
                height: 16,
              ),
              TitledCheckBox(
                title: LocaleKeys.confirmRelationshipValidity.tr(),
              )
            ],
          ),
        ),
        const CustomSizedBox(
          height: 24,
        ),
        Ink(
          decoration: boxDecoration,
          padding: padding,
          child: SwitchButtonTitleWidget(
            title: LocaleKeys.driverHomeAddressSame.tr(),
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
        ),
        const CustomSizedBox(
          height: 24,
        ),
        Ink(
          decoration: boxDecoration,
          padding: padding,
          child: SwitchButtonTitleWidget(
            title: LocaleKeys.healthConditionsRestrictions.tr(),
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
        ),
        const CustomSizedBox(
          height: 24,
        ),
        Ink(
          decoration: boxDecoration,
          padding: padding,
          child: SwitchButtonTitleWidget(
            title: "Does driver traffic violations?",
            isOn: isOn4,
            onTap: () {
              if (isOn4) {
                isOn4 = false;
                setState(() {});
              } else {
                isOn4 = true;
                setState(() {});
              }
            },
          ),
        ),
        const CustomSizedBox(
          height: 24,
        ),
        Ink(
          decoration: boxDecoration,
          padding: padding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SwitchButtonTitleWidget(
                title: LocaleKeys.trafficViolations.tr(),
                isOn: isOn5,
                onTap: () {
                  if (isOn5) {
                    isOn5 = false;
                    setState(() {});
                  } else {
                    isOn5 = true;
                    setState(() {});
                  }
                },
              ),
              const CustomSizedBox(
                height: 16,
              ),
              FormDropDownWidget(
                items: dummyCity
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                title: LocaleKeys.driverEducation.tr(),
              ),
              const CustomSizedBox(
                height: 16,
              ),
              FormDropDownWidget(
                items: dummyCity
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                title: LocaleKeys.accidentCounts.tr(),
              ),
              const CustomSizedBox(
                height: 16,
              ),
              FormDropDownWidget(
                items: dummyCity
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                title: LocaleKeys.childrenBelow16Years.tr(),
              ),
              const CustomSizedBox(
                height: 16,
              ),
              FormItemWidget(title: LocaleKeys.relationship.tr(), hintText: "**********"),
            ],
          ),
        ),
        const CustomSizedBox(
          height: 24,
        ),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: CustomElevatedButton(
                  backgroundColor: AppColors.greenColor,
                  text: LocaleKeys.addThisDriver.tr(),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                ),
              ),
              const CustomSizedBox(
                width: 16,
              ),
              Expanded(
                child: CustomOutlinedButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  height: 48,
                  borderColor: AppColors.borderColor,
                  borderRadius: 8,
                  child: Text(
                    LocaleKeys.cancel.tr(),
                    style: CustomThemes.greyColor75TextStyle(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
