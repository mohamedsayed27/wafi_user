import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/form_item_widget.dart';
import 'package:wafi_user/translations/locale_keys.g.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../widgets/shared_widgets/custom_outlined_button.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';

class AddPaymentMethodScreen extends StatelessWidget {
  const AddPaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.paymentMethod.tr(),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: 43.h,
          horizontal: 16.w,
        ),
        children: [
          Text(
            LocaleKeys.cardType.tr(),
            style: CustomThemes.greyColor16TextStyle(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
          const CustomSizedBox(
            height: 8,
          ),
          CustomOutlinedButton(
            borderColor: AppColors.blackColor.withOpacity(
              0.2,
            ),
            borderRadius: 4.r,
            height: 48,
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 7,
            ),
            foregroundColor: AppColors.blackColor,
            onPressed: () {},
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    LocaleKeys.creditCard.tr(),
                    style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12.r,
                  color: AppColors.color1C,
                ),
              ],
            ),
          ),
          const CustomSizedBox(
            height: 26,
          ),
          FormItemWidget(
            title: LocaleKeys.cardNumber.tr(),
            hintText: LocaleKeys.cardNumber.tr(),
          ),
          const CustomSizedBox(
            height: 26,
          ),
          Row(
            children: [
              Expanded(
                child: FormItemWidget(
                  title: LocaleKeys.expDate.tr(),
                  hintText: LocaleKeys.paymentMethod.tr(),
                ),
              ),
              const CustomSizedBox(
                width: 16,
              ),
              Expanded(
                child: FormItemWidget(
                  title: LocaleKeys.cvcCode.tr(),
                  hintText: LocaleKeys.paymentMethod.tr(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
