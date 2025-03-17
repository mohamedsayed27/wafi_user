import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wafi_user/core/app_router/screens_name.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_divider.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradient_svg.dart';
import 'package:wafi_user/translations/locale_keys.g.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/svg_path.dart';
import '../../../core/constants/constants.dart';
import '../../widgets/shared_widgets/custom_outlined_button.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Payment Methods",
        elevation: 10,
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24),
          children: [
            const CustomSizedBox(
              height: 16,
            ),
            Text(
              LocaleKeys.paymentMethod.tr(),
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
                      LocaleKeys.payWithApplePay.tr(),
                      style:
                          CustomThemes.greyColor1CTextStyle(context).copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const CustomSizedBox(
              height: 16,
            ),
            const CustomDivider(height: 3),
            const CustomSizedBox(
              height: 16,
            ),
            Text(
              LocaleKeys.savedCards.tr(),
              style: CustomThemes.greyColor99TextStyle(context).copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            const CustomSizedBox(
              height: 8,
            ),
            ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (_, index) {
                return const CustomSizedBox(
                  height: 16,
                );
              },
              itemBuilder: (_, index) {
                return Row(
                  children: [
                    Container(
                      height: 40.h,
                      width: 56.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.greyColorD8,
                      ),
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        SvgPath.masterCard,
                        width: 30.w,
                        height: 18.h,
                      ),
                    ),
                    const CustomSizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "1234",
                          style: CustomThemes.greyColor1CTextStyle(context)
                              .copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Master Card",
                          style: CustomThemes.greyColor99TextStyle(context)
                              .copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
              itemCount: 2,
            ),
            const CustomSizedBox(
              height: 16,
            ),
            const CustomDivider(height: 3),
            const CustomSizedBox(
              height: 16,
            ),
            Text(
              LocaleKeys.addNewPaymentMethod.tr(),
              style: CustomThemes.greyColor75TextStyle(context).copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            const CustomSizedBox(
              height: 8,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: () {
                Navigator.pushNamed(
                    context, ScreenName.addPaymentMethodsScreen);
              },
              visualDensity: const VisualDensity(
                  vertical: VisualDensity.minimumDensity,
                  horizontal: VisualDensity.minimumDensity),
              leading: GradientSvg(
                svgPath: SvgPath.creditCard,
                width: 30.w,
                height: 18.h,
              ),
              title: Text(
                LocaleKeys.addDebitCard.tr(),
                style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: () {
                Navigator.pushNamed(
                    context, ScreenName.addPaymentMethodsScreen);
              },
              visualDensity: const VisualDensity(
                  vertical: VisualDensity.minimumDensity,
                  horizontal: VisualDensity.minimumDensity),
              leading: GradientSvg(
                svgPath: SvgPath.creditCard,
                width: 30.w,
                height: 18.h,
              ),
              title: Text(
                LocaleKeys.addDebitCard.tr(),
                style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const CustomSizedBox(
              height: 16,
            ),
          ]),
    );
  }
}
