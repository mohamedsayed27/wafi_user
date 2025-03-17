
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/constants/extensions.dart';

import '../../../core/app_theme/custom_themes.dart';

class BillDetailsItem extends StatelessWidget {
  final String title;
  final String balance;
  final double padding;
  const BillDetailsItem({
    super.key,
    required this.title,
    required this.balance, this.padding = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: CustomThemes.greyColor1CTextStyle(context).copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "$balance SAR",
          style: CustomThemes.greyColor1CTextStyle(context).copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    ).symmetricPadding(horizontal: padding);
  }
}