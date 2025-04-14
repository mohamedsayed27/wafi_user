import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:wafi_user/translations/locale_keys.g.dart';

import '../../widgets/orders_container/offers_container.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.quotations.tr(),
        elevation: 0,
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 32.h,
        ),
        itemBuilder: (_, index) => const PastContainer(),
        separatorBuilder: (_, index) => const CustomSizedBox(
          height: 16,
        ),
        itemCount: 5,
      ),
    );
  }
}
