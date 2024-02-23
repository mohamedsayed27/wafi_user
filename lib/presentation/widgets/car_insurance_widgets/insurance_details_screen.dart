import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_switch_button.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/form_date_item.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/form_drom_down_widget.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/form_item_widget.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/constants/constants.dart';

class InsuranceDetailsScreen extends StatefulWidget {
  const InsuranceDetailsScreen({super.key});

  @override
  State<InsuranceDetailsScreen> createState() => _InsuranceDetailsScreenState();
}

class _InsuranceDetailsScreenState extends State<InsuranceDetailsScreen> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: CustomAppBar(
          title: "title",
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 32.h,
        ),
        children: [
          FormDropDownWidget(
            title: "Select Vehicle Identifier",
          ),
          CustomSizedBox(
            height: 24,
          ),
          FormItemWidget(
            title: "Sequence Number",
            hintText: "EX:-000000000",
          ),
          CustomSizedBox(
            height: 24,
          ),
          Row(
            children: [
              CustomSwitchButton(
                  isOn: isOn,
                  onTap: () {
                    if (isOn) {
                      isOn = false;
                      setState(() {});
                    } else {
                      isOn = true;
                      setState(() {});
                    }
                  }),
              CustomSizedBox(
                width: 12,
              ),
              Expanded(
                child: Text(
                  "Ownership Transfer",
                  style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          // if()CustomSizedBox(height: 24,),
          Visibility(
            child: FormDropDownWidget(
              title: "Purpose of Vehicle Use",
            ),
            visible: !isOn,
          ),
          CustomSizedBox(
            height: 24,
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
                CustomSizedBox(
                  height: 16,
                ),
                Visibility(
                  child: Text(
                    "To be filled if driver is not the car owner",
                    style: CustomThemes.greyColor99TextStyle(context).copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  visible: !isOn,
                ),
                CustomSizedBox(
                  height: 16,
                ),
                Visibility(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormItemWidget(
                        title: "Year of manufacture",
                        hintText: "Year of manufacture",
                      ),
                      FormItemWidget(
                        title: "Purpose of vehicle use",
                        hintText: "Purpose of vehicle use",
                      ),
                    ],
                  ),
                  visible: isOn,
                ),
                CustomSizedBox(
                  height: 16,
                ),
                FormDateWidget(
                  title: "Date of Birth",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
