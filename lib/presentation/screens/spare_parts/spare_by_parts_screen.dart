import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_router/screens_name.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';

import '../../widgets/spare_barts/spare_parts_intro_container.dart';
import '../../widgets/spare_barts/spare_parts_item_widget.dart';

class SpareByPartsScreen extends StatefulWidget {
  const SpareByPartsScreen({super.key});

  @override
  State<SpareByPartsScreen> createState() => _SpareByPartsScreenState();
}

class _SpareByPartsScreenState extends State<SpareByPartsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const SparePartsIntroContainer(),
          Container(
            margin: EdgeInsets.only(top: 200.h),
            // padding: EdgeInsets.only(top: 12.h),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12.r)),
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
              itemBuilder: (_, index) => InkWell(onTap: (){Navigator.pushNamed(context, ScreenName.sparePartsDetailsScreen);},child: const SparePartsItemWidget()),
              separatorBuilder: (_, index) => const CustomSizedBox(height: 16),
              itemCount: 5,
            ),
          )
        ],
      ),
    );
  }
}
