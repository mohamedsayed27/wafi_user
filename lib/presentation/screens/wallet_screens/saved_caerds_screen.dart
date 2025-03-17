import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/svg_path.dart';
import '../../../core/constants/constants.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';

class SavedCardsScreen extends StatelessWidget {
  const SavedCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Saved Cards",
        elevation: 0,
      ),
      body: ListView.separated(
        padding: EdgeInsets.zero,
        separatorBuilder: (_, index) {
          return const CustomSizedBox(
            height: 8,
          );
        },
        itemBuilder: (_, index) {
          return ListTile(
            onTap: () {},
            leading: Container(
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
            shape: UnderlineInputBorder(
                borderSide: BorderSide(
                    color:
                        index == 9 ? Colors.transparent : AppColors.greyColor9,
                    width: 0.2)),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "1234",
                  style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Master Card",
                  style: CustomThemes.greyColor99TextStyle(context).copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
