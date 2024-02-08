import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_router/screens_name.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';
import 'package:wafi_user/core/assets_path/images_path.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/logo_app_bar.dart';

import '../../../core/app_theme/custom_themes.dart';
import '../../../core/constants/constants.dart';
import '../../widgets/auth_widgets/screen_title_widget.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';
import '../../widgets/shared_widgets/form_item_widget.dart';
import '../../widgets/shared_widgets/gradiant_color_button.dart';

class CompleteProfileDataScreen extends StatelessWidget {
  const CompleteProfileDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: const LogoAppBar(),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        children: [
          const ScreenTitleWidget(
            title: 'Profile',
          ),
          const CustomSizedBox(
            height: 16,
          ),
          Center(
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: const BoxDecoration(
                    color: AppColors.greyColorF3,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    ImagesPath.userNullImage,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                  width: 30.w,
                  child: IconButton(
                    onPressed: () {},
                    style: IconButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    icon: Container(
                      height: 24.h,
                      width: 24.w,
                      decoration: const BoxDecoration(
                        color: AppColors.colorE02,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: const Icon(Icons.edit,color: AppColors.whiteColor,size: 16,),
                    ),
                  ),
                )
              ],
            ),
          ),
          const CustomSizedBox(
            height: 24,
          ),
          const FormItemWidget(
            title: 'Name',
            hintText: 'EX :- XXXXXXXXXXX',
          ),
          const CustomSizedBox(
            height: 16,
          ),
          const FormItemWidget(
            title: 'Contact Number',
            hintText: 'EX :- 0000000000X',
          ),
          const CustomSizedBox(
            height: 164,
          ),
          CustomGradientButton(
            child: Text(
              "Submit",
              style: CustomThemes.whiteColoTextTheme(context).copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, ScreenName.MainLayoutScreen);
            },
          )
        ],
      ),
    );
  }
}
