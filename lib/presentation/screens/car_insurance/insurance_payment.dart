import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wafi_user/core/constants/extensions.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/svg_path.dart';
import '../../../translations/locale_keys.g.dart';
import '../../widgets/car_insurance_widgets/submit_insurance_payment_dialog.dart';
import '../../widgets/shared_widgets/bill_details_item.dart';
import '../../widgets/shared_widgets/custom_app_bar.dart';
import '../../widgets/shared_widgets/custom_divider.dart';
import '../../widgets/shared_widgets/custom_outlined_button.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';
import '../../widgets/shared_widgets/gradiant_color_button.dart';

class InsurancePaymentScreen extends StatelessWidget {
  const InsurancePaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.cart.tr(),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 32.h),
        children: [
          TitleBodyTextColumn(
              title: LocaleKeys.insuranceCompany.tr(), body: "Qatar Insurance Company"),
          const CustomSizedBox(
            height: 16,
          ),
          TitleBodyTextColumn(
              title: LocaleKeys.insuranceType.tr(), body: "Comprehensive Insurance"),
          const CustomSizedBox(
            height: 16,
          ),
          TitleBodyTextColumn(title: LocaleKeys.policyEffectiveDate.tr(), body: "#1254588465"),
          const CustomSizedBox(
            height: 16,
          ),
          const CustomDivider(),
          ListTile(
            leading: SvgPicture.asset(
              SvgPath.badge,
              width: 20.w,
              height: 20.h,
            ),
            title: Text(
              LocaleKeys.applyPromocode.tr(),
              style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 18.sp,
            ),
          ),
          const CustomDivider(),
          const CustomSizedBox(
            height: 16,
          ),
          Text(
            LocaleKeys.paymentMethod.tr(),
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ).onlyDirectionalPadding(start: 16),
          const CustomSizedBox(
            height: 8,
          ),
          CustomOutlinedButton(
            borderColor: AppColors.blackColor.withOpacity(0.2),
            borderRadius: 4.r,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            foregroundColor: AppColors.blackColor,
            onPressed: () {},
            child: Row(
              children: [
                SvgPicture.asset(
                  SvgPath.applePay,
                  width: 35.w,
                  height: 35.h,
                  colorFilter: const ColorFilter.mode(AppColors.greyColor9, BlendMode.srcIn),
                ),
                const CustomSizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    LocaleKeys.paymentMethod.tr(),
                    style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ).symmetricPadding(horizontal: 16),
          const CustomSizedBox(
            height: 16,
          ),
          const CustomDivider(height: 3),
          const CustomSizedBox(
            height: 16,
          ),
          Text(
            LocaleKeys.billDetails.tr(),
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ).onlyDirectionalPadding(start: 16),
          const CustomSizedBox(
            height: 8,
          ),
          BillDetailsItem(
            title: LocaleKeys.carInsurance.tr(),
            balance: "100",
          ),
          const CustomSizedBox(
            height: 2,
          ),
          BillDetailsItem(
            title: LocaleKeys.personalAccidentCover.tr(),
            balance: "90",
          ),
          const CustomSizedBox(
            height: 2,
          ),
          BillDetailsItem(
            title: LocaleKeys.totalPayableAmount.tr(),
            balance: "90",
          ),
          const CustomSizedBox(
            height: 16,
          ),
          const CustomDivider(),
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
                      LocaleKeys.continueText.tr(),
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
            onPressed: () {
              showDialog(context: context, builder: (_) => const SpareSubmitDialog());
            },
          ).symmetricPadding(horizontal: 16)
        ],
      ),
    );
  }
}

class TitleBodyTextColumn extends StatelessWidget {
  final String title;
  final String body;

  const TitleBodyTextColumn({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: CustomThemes.greyColor1CTextStyle(context).copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        const CustomSizedBox(
          height: 12,
        ),
        Text(
          body,
          style: CustomThemes.greyColor75TextStyle(context).copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ).symmetricPadding(horizontal: 16);
  }
}
