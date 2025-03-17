import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/presentation/widgets/car_insurance_widgets/policy_details_item_widget.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../translations/locale_keys.g.dart';

class PolicesDetailsScreen extends StatelessWidget {
  const PolicesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.policyDetails.tr(),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PolicesDetailsItemWidget(
                  title: LocaleKeys.policyholderId.tr(),
                  body: "6556465165",
                ),
                const CustomSizedBox(
                  height: 16,
                ),
                PolicesDetailsItemWidget(
                  title: LocaleKeys.name.tr(),
                  body: "Nick Kroll",
                ),
                const CustomSizedBox(
                  height: 16,
                ),
                PolicesDetailsItemWidget(
                  title: LocaleKeys.nationalAddress.tr(),
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

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PolicesDetailsItemWidget(
                  title: LocaleKeys.vehicleMakeModel.tr(),
                  body: "6556465165",
                ),
                const CustomSizedBox(
                  height: 16,
                ),
                PolicesDetailsItemWidget(
                  title: LocaleKeys.plateNumber.tr(),
                  body: "Nick Kroll",
                ),
                const CustomSizedBox(
                  height: 16,
                ),
                PolicesDetailsItemWidget(
                  title: LocaleKeys.manufactureYear.tr(),
                  body: "Nick Kroll",
                ),
                const CustomSizedBox(
                  height: 16,
                ),
                PolicesDetailsItemWidget(
                  title: LocaleKeys.color.tr(),
                  body: "6556465165",
                ),
                const CustomSizedBox(
                  height: 16,
                ),
                PolicesDetailsItemWidget(
                  title: LocaleKeys.vehicleEstimatedValue.tr(),
                  body: "Nick Kroll",
                ),
                const CustomSizedBox(
                  height: 16,
                ),
                PolicesDetailsItemWidget(
                  title: LocaleKeys.repairMethod.tr(),
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
