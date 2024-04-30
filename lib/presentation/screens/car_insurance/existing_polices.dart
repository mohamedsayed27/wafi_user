import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';

import '../../../core/constants/constants.dart';
import '../../../translations/locale_keys.g.dart';
import '../../widgets/car_insurance_widgets/polices_widget.dart';

class ExistingPolices extends StatelessWidget {
  const ExistingPolices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: CustomAppBar(
          title: LocaleKeys.existingPolicy.tr(),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: 16.sp,
          vertical: 32.h,
        ),
        itemBuilder: (_, index) {
          return PolicesWidget(
            isExpired: false,
          );
        },
        separatorBuilder: (_, index) {
          return CustomSizedBox(
            height: 16,
          );
        },
        itemCount: 8,
      ),
    );
  }
}
