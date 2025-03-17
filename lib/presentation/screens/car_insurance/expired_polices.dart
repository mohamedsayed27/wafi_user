import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';

import '../../../core/constants/constants.dart';
import '../../../translations/locale_keys.g.dart';
import '../../widgets/car_insurance_widgets/polices_widget.dart';

class ExpiredPolices extends StatelessWidget {
  const ExpiredPolices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.expiredPolicies.tr(),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: 16.sp,
          vertical: 32.h,
        ),
        itemBuilder: (_, index) {
          return const PolicesWidget();
        },
        separatorBuilder: (_, index) {
          return const CustomSizedBox(
            height: 16,
          );
        },
        itemCount: 8,
      ),
    );
  }
}
