import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/form_drom_down_widget.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/form_item_widget.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradiant_color_button.dart';

import '../../../core/app_theme/custom_themes.dart';
import '../../../core/constants/constants.dart';
import '../../../translations/locale_keys.g.dart';

class AddYourCar extends StatelessWidget {
  const AddYourCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child:  CustomAppBar(
          title: LocaleKeys.addYourCar.tr(),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 32.h),
        children: [
          Text(
            LocaleKeys.enterCarDetails.tr(),
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
           CustomSizedBox(
            height: 24,
          ),
           FormDropDownWidget(title: LocaleKeys.addDriver.tr()),
           CustomSizedBox(
            height: 24,
          ),
           FormDropDownWidget(title: LocaleKeys.model.tr()),
           CustomSizedBox(
            height: 24,
          ),
           FormDropDownWidget(title: LocaleKeys.yearOfManufacture.tr()),
           CustomSizedBox(
            height: 24,
          ),
           FormItemWidget(title: LocaleKeys.chassisNumber.tr(), hintText: "**********"),
          const CustomSizedBox(
            height: 160,
          ),
          CustomGradientButton(
            child: Text(
              LocaleKeys.submit.tr(),
              style: CustomThemes.whiteColoTextTheme(context).copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
