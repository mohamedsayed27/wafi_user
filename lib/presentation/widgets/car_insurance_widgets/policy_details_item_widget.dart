import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_theme/custom_themes.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';

class PolicesDetailsItemWidget extends StatelessWidget {
  final String title;
  final String body;
  const PolicesDetailsItemWidget({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: CustomThemes.greyColor1CTextStyle(context).copyWith(fontSize: 14.sp,fontWeight: FontWeight.bold,),),
        const CustomSizedBox(height: 8,),
        Text(body,style: CustomThemes.greyColor99TextStyle(context).copyWith(fontSize: 12.sp,fontWeight: FontWeight.bold,),)
      ],
    );
  }
}
