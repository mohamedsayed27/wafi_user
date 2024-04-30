import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_router/screens_name.dart';
import 'package:wafi_user/presentation/widgets/car_insurance_widgets/add_driver_button_widget.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_switch_button.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/form_date_item.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/form_drom_down_widget.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/form_item_widget.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradiant_color_button.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/switch_button_and_title_widget.dart';
import 'package:wafi_user/presentation/widgets/spare_barts/check_box_with_title.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/svg_path.dart';
import '../../../core/constants/constants.dart';
import '../../../translations/locale_keys.g.dart';

class InsuranceDetailsScreen extends StatefulWidget {
  const InsuranceDetailsScreen({super.key});

  @override
  State<InsuranceDetailsScreen> createState() => _InsuranceDetailsScreenState();
}

class _InsuranceDetailsScreenState extends State<InsuranceDetailsScreen> {
  bool isOn = false;
  List<Map<String, dynamic>?> titlesList = [
    {
      "title": LocaleKeys.addDriver.tr(),
      "image": SvgPath.vector,
    },
    null,
    {
      "title": LocaleKeys.otherDetails.tr(),
      "image": SvgPath.list,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: CustomAppBar(
          title: LocaleKeys.carInsurance.tr(),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 32.h,
        ),
        children: [
           FormDropDownWidget(
            title: LocaleKeys.selectVehicleIdentifier.tr(),
          ),
           CustomSizedBox(
            height: 24,
          ),
           FormItemWidget(
            title: LocaleKeys.sequenceNumber.tr(),
            hintText: "EX:-000000000",
          ),
           CustomSizedBox(
            height: 24,
          ),
          SwitchButtonTitleWidget(
            title: LocaleKeys.ownershipTransfer.tr(),
            isOn: isOn,
            onTap: () {
              if (isOn) {
                isOn = false;
                setState(() {});
              } else {
                isOn = true;
                setState(() {});
              }
            },
          ),
           CustomSizedBox(
            height: 24,
          ),
          Visibility(
            visible: !isOn,
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormDropDownWidget(
                  title: LocaleKeys.purposeOfVehicleUse.tr(),
                ),
                CustomSizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
          Ink(
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
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: !isOn,
                  child: Text(
                    LocaleKeys.fillIfDriverIsNotOwner.tr(),
                    style: CustomThemes.greyColor99TextStyle(context).copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Visibility(
                  visible: isOn,
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormItemWidget(
                        title: LocaleKeys.yearOfManufacture.tr(),
                        hintText: LocaleKeys.carInsurance.tr(),
                      ),
                      CustomSizedBox(
                        height: 8,
                      ),
                      FormItemWidget(
                        title: LocaleKeys.purposeOfVehicleUse.tr(),
                        hintText:LocaleKeys.purposeOfVehicleUse.tr(),
                      ),
                      CustomSizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
                 FormDateWidget(
                  title: LocaleKeys.dob.tr(),
                ),
              ],
            ),
          ),
           CustomSizedBox(
            height: 24,
          ),
          Hero(
            tag: "addDriver",
            child: Material(
              type: MaterialType.transparency,
              child: Row(
                children: List.generate(
                  titlesList.length,
                      (index) {
                    return index.isOdd
                        ?  CustomSizedBox(
                      width: 24,
                    )
                        : Expanded(
                      child: GradientSelectButtonWidget(
                        onTap: (){
                          Navigator.pushNamed(context, ScreenName.addDriverScreen,arguments: 0);
                        },
                        isButtonSelected: false,
                        svgPath: titlesList[index]?["image"],
                        title: titlesList[index]?["title"],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
           CustomSizedBox(
            height: 24,
          ),
           TitledCheckBox(
            title:
            LocaleKeys.agreeToInquire.tr(),
          ),
           CustomSizedBox(
            height: 24,
          ),
          CustomGradientButton(
            onPressed: () {
              Navigator.pushNamed(context, ScreenName.carInsuranceResult);
            },
            child: Text(
              LocaleKeys.next.tr(),
              style: CustomThemes.whiteColoTextTheme(context).copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
