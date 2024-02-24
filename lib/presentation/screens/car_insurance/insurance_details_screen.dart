import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

class InsuranceDetailsScreen extends StatefulWidget {
  const InsuranceDetailsScreen({super.key});

  @override
  State<InsuranceDetailsScreen> createState() => _InsuranceDetailsScreenState();
}

class _InsuranceDetailsScreenState extends State<InsuranceDetailsScreen> {
  bool isOn = false;
  List<Map<String, dynamic>?> titlesList = [
    {
      "title": "Add Driver",
      "image": SvgPath.vector,
    },
    null,
    {
      "title": "Other Details",
      "image": SvgPath.list,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: const CustomAppBar(
          title: "Car Insurance",
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 32.h,
        ),
        children: [
          const FormDropDownWidget(
            title: "Select Vehicle Identifier",
          ),
          const CustomSizedBox(
            height: 24,
          ),
          const FormItemWidget(
            title: "Sequence Number",
            hintText: "EX:-000000000",
          ),
          const CustomSizedBox(
            height: 24,
          ),
          SwitchButtonTitleWidget(
            title: "Ownership Transfer",
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
          const CustomSizedBox(
            height: 24,
          ),
          Visibility(
            visible: !isOn,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormDropDownWidget(
                  title: "Purpose of Vehicle Use",
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
                    "To be filled if driver is not the car owner",
                    style: CustomThemes.greyColor99TextStyle(context).copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Visibility(
                  visible: isOn,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormItemWidget(
                        title: "Year of manufacture",
                        hintText: "Year of manufacture",
                      ),
                      CustomSizedBox(
                        height: 8,
                      ),
                      FormItemWidget(
                        title: "Purpose of vehicle use",
                        hintText: "Purpose of vehicle use",
                      ),
                      CustomSizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
                const FormDateWidget(
                  title: "Date of Birth",
                ),
              ],
            ),
          ),
          const CustomSizedBox(
            height: 24,
          ),
          Material(
            type: MaterialType.transparency,
            child: Hero(
              tag: "addDriver",
              child: Row(
                children: List.generate(
                  titlesList.length,
                  (index) {
                    return index.isOdd
                        ? const CustomSizedBox(
                            width: 24,
                          )
                        : Expanded(
                            child: GradientSelectButtonWidget(
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
          const CustomSizedBox(
            height: 24,
          ),
          const TitledCheckBox(
            title:
                "I agree to grant insurance house the right to inquire from any related agency about my data or any other data",
          ),
          const CustomSizedBox(
            height: 24,
          ),
          CustomGradientButton(
            onPressed: () {},
            child: Text(
              "Next",
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
