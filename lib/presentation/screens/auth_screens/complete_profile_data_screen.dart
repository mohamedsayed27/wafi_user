import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_router/screens_name.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';
import 'package:wafi_user/core/assets_path/images_path.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/logo_app_bar.dart';
import 'package:wafi_user/translations/locale_keys.g.dart';

import '../../../core/app_theme/custom_themes.dart';
import '../../widgets/auth_widgets/screen_title_widget.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';
import '../../widgets/shared_widgets/form_item_widget.dart';
import '../../widgets/shared_widgets/gradiant_color_button.dart';

class CompleteProfileDataScreen extends StatelessWidget {
  const CompleteProfileDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LogoAppBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        children: [
          ScreenTitleWidget(
            title: LocaleKeys.profile.tr(),
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
                      child: const Icon(
                        Icons.edit,
                        color: AppColors.whiteColor,
                        size: 16,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const CustomSizedBox(
            height: 24,
          ),
          FormItemWidget(
            title: LocaleKeys.name.tr(),
            hintText: 'EX :- XXXXXXXXXXX',
          ),
          const CustomSizedBox(
            height: 16,
          ),
          FormItemWidget(
            title: LocaleKeys.contactNumber.tr(),
            hintText: 'EX :- 0000000000X',
          ),
          const CustomSizedBox(
            height: 164,
          ),
          CustomGradientButton(
            child: Text(
              LocaleKeys.submit.tr(),
              style: CustomThemes.whiteColoTextTheme(context).copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, ScreenName.mainLayoutScreen);
            },
          )
        ],
      ),
    );
  }
}
