import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';

import '../../../translations/locale_keys.g.dart';
import '../../widgets/car_insurance_widgets/var_insurance_item_widget.dart';

class ExistingCarsScreen extends StatelessWidget {
  const ExistingCarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.existingCars.tr(),
      ),
      body: ListView.separated(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 32.h,
          ),
          itemBuilder: (_, index) => CarsWidget(
                isInsurance: index % 2 == 0 ? true : false,
              ),
          separatorBuilder: (_, index) => const CustomSizedBox(
                height: 16,
              ),
          itemCount: 6),
    );
  }
}
