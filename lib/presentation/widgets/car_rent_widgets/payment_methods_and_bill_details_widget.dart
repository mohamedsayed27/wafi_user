import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_divider.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/svg_path.dart';
import '../../../translations/locale_keys.g.dart';
import '../../widgets/shared_widgets/bill_details_item.dart';
import '../../widgets/shared_widgets/custom_outlined_button.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';


class PaymentMethodsAndBillDetailsWidget extends StatelessWidget {
   const PaymentMethodsAndBillDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Payment Method",
          style: CustomThemes.greyColor1CTextStyle(context).copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
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
                colorFilter: const ColorFilter.mode(
                    AppColors.greyColor9, BlendMode.srcIn),
              ),
              const CustomSizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  "Pay with Apple Pay",
                  style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        const CustomSizedBox(
          height: 24,
        ),
        const CustomDivider(),
        const CustomSizedBox(
          height: 24,
        ),
        Text(
          LocaleKeys.billDetails.tr(),
          style: CustomThemes.greyColor1CTextStyle(context).copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        const CustomSizedBox(
          height: 8,
        ),
        const BillDetailsItem(
          title: "Hyundai Accent",
          balance: "100",
          padding: 0,
        ),
        const CustomSizedBox(
          height: 2,
        ),
         BillDetailsItem(
          title: LocaleKeys.insuranceFee.tr(),
          balance: "90",
          padding: 0,
        ),
         const CustomSizedBox(
          height: 2,
        ),
         BillDetailsItem(
          title: LocaleKeys.deliveryCharges.tr(),
          balance: "78",
          padding: 0,
        ),
         const CustomSizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              LocaleKeys.totalPayableAmount.tr(),
              style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "200 AED",
              style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        )
      ],
    );
  }
}