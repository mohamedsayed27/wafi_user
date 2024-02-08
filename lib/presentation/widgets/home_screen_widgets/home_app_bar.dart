import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wafi_user/core/constants/extensions.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/svg_path.dart';
import '../../screens/main_layout/main_layout.dart';
import '../shared_widgets/custom_sized_box.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.r),
          bottomRight: Radius.circular(8.r),
        ),
        gradient:  const LinearGradient(
          colors: [
            AppColors.homeScreenGradientFirstColor,
            AppColors.fourthGradientColor,

          ],
          begin: Alignment(-0.9, -0.9),
          end: Alignment(1.0, 1.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    advancedDrawerController.showDrawer();
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.zero,

                    shape: const CircleBorder(),
                  ),
                  icon: SvgPicture.asset(
                    SvgPath.burgerMenu,
                    height: 17.h,
                    width: 24.w,
                    colorFilter: const ColorFilter.mode(
                      AppColors.whiteColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.location_on_rounded,color: AppColors.whiteColor,size: 15.r,),
                      const CustomSizedBox(width: 2,),
                      Text("2201, Tabuk St , Dubai",style: CustomThemes.whiteColoTextTheme(context).copyWith(fontSize: 12.sp,fontWeight: FontWeight.w700,),),
                    ],
                  ),
                  const CustomSizedBox(height: 2,),
                  Container(
                    height: 0.9.h,
                    width: 140.w,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ).onlyDirectionalPadding(end: 16),
        ],
      ),
    );
  }
}
