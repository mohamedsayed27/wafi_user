import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_divider.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/constants/constants.dart';
import '../../../translations/locale_keys.g.dart';
import '../../widgets/car_rent_widgets/agent_details_widget.dart';
import '../../widgets/car_rent_widgets/car_details_widget.dart';
import '../../widgets/car_rent_widgets/choose_insurance_type_widget.dart';
import '../../widgets/car_rent_widgets/payment_methods_and_bill_details_widget.dart';
import '../../widgets/car_rent_widgets/pickup_or_dropoff_widget.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';
import '../../widgets/shared_widgets/gradiant_color_button.dart';

class ConfirmRentCarScreen extends StatelessWidget {
  const ConfirmRentCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: CustomAppBar(
          title: LocaleKeys.carRental.tr(),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        children: [
          const CarDetailsWidget(),
          const CustomSizedBox(
            height: 24,
          ),
          const CustomDivider(),
          const CustomSizedBox(
            height: 24,
          ),
          const AgentDetailsWidget(),
          const CustomSizedBox(
            height: 24,
          ),
          const CustomDivider(),
          const CustomSizedBox(
            height: 24,
          ),
          const PickUpDropOffDetailsWidget(),
          const CustomSizedBox(
            height: 24,
          ),
          const CustomDivider(),
          const CustomSizedBox(
            height: 24,
          ),
          Text(
              LocaleKeys.chooseInsuranceType.tr(),
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
          const CustomSizedBox(
            height: 16,
          ),
          const InsuranceTypeRadioGroup(),
          const CustomSizedBox(
            height: 24,
          ),
          const CustomDivider(),
          const CustomSizedBox(
            height: 24,
          ),
          const PaymentMethodsAndBillDetailsWidget(),
          const CustomSizedBox(
            height: 24,
          ),
          CustomGradientButton(
            borderRadius: 4,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "150 SAR",
                  style: CustomThemes.whiteColoTextTheme(context).copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      LocaleKeys.buyNow.tr(),
                      style: CustomThemes.whiteColoTextTheme(context).copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18.r,
                      color: AppColors.whiteColor,
                    ),
                  ],
                ),
              ],
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
