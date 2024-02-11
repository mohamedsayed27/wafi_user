import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/presentation/widgets/car_insurance_widgets/policy_details_item_widget.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/constants/constants.dart';

class PolicesDetailsScreen extends StatelessWidget {
  const PolicesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: const CustomAppBar(
          title: "Policy Details",
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 32.h,),
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
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PolicesDetailsItemWidget(
                  title: "Policyholder ID",
                  body: "6556465165",
                ),
                CustomSizedBox(
                  height: 16,
                ),
                PolicesDetailsItemWidget(
                  title: "Name",
                  body: "Nick Kroll",
                ),
                CustomSizedBox(
                  height: 16,
                ),
                PolicesDetailsItemWidget(
                  title: "National Address",
                  body: "Nick Kroll",
                ),
              ],
            ),
          ),
          const CustomSizedBox(
            height: 24,
          ),
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
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PolicesDetailsItemWidget(
                  title: "VehicleMake / Model",
                  body: "6556465165",
                ),
                CustomSizedBox(
                  height: 16,
                ),
                PolicesDetailsItemWidget(
                  title: "Plate Number",
                  body: "Nick Kroll",
                ),
                CustomSizedBox(
                  height: 16,
                ),
                PolicesDetailsItemWidget(
                  title: "Manufacture Year",
                  body: "Nick Kroll",
                ),
                CustomSizedBox(
                  height: 16,
                ),
                PolicesDetailsItemWidget(
                  title: "Color",
                  body: "6556465165",
                ),
                CustomSizedBox(
                  height: 16,
                ),
                PolicesDetailsItemWidget(
                  title: "Vehicle Estimated Value",
                  body: "Nick Kroll",
                ),
                CustomSizedBox(
                  height: 16,
                ),
                PolicesDetailsItemWidget(
                  title: "Repair Method",
                  body: "Nick Kroll",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
