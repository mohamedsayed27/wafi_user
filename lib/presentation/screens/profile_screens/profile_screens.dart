import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wafi_user/core/app_router/screens_name.dart';
import 'package:wafi_user/core/assets_path/images_path.dart';
import 'package:wafi_user/core/constants/extensions.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_divider.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/svg_path.dart';
import '../../../core/constants/constants.dart';
import '../../../translations/locale_keys.g.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';
import '../main_layout/main_layout.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 360.h,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: AppColors.gradientColorsList,
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSizedBox(
                  height: preferredSize.height,
                ),
                // IconButton(
                //   onPressed: () {
                //     advancedDrawerController.showDrawer();
                //   },
                //   style: OutlinedButton.styleFrom(
                //     padding: EdgeInsets.zero,
                //     shape: const CircleBorder(),
                //   ),
                //   icon: SvgPicture.asset(
                //     SvgPath.burgerMenu,
                //     height: 17.h,
                //     width: 24.w,
                //     colorFilter: const ColorFilter.mode(
                //       AppColors.whiteColor,
                //       BlendMode.srcIn,
                //     ),
                //   ),
                // ),
                Text(
                  LocaleKeys.profile.tr(),
                  style: CustomThemes.whiteColoTextTheme(context).copyWith(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ).onlyDirectionalPadding(start: 8),
                const CustomSizedBox(
                  height: 24,
                ),
                Center(
                  child: Column(
                    children: [
                      Container(
                        height: 120.h,
                        width: 120.w,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            border: Border.all(
                              color: AppColors.whiteColor,
                              width: 2.w,
                            ),),
                        child: Image.asset(
                          ImagesPath.userNullImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const CustomSizedBox(
                        height: 16,
                      ),
                      Text(
                        "Riyad Mahrez",
                        style:
                            CustomThemes.whiteColoTextTheme(context).copyWith(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                      ),
                      const CustomSizedBox(
                        height: 8,
                      ),
                      Text(
                        "riyadmahrez@gmail.com",
                        style:
                            CustomThemes.greyColor99TextStyle(context).copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          ItemWidget(
            title: LocaleKeys.editProfile.tr(),
            svgPath: SvgPath.editProfile,
            onTap: () {
              Navigator.pushNamed(context, ScreenName.editProfileScreen);
            },
          ),
          ItemWidget(
            title: LocaleKeys.notifications.tr(),
            svgPath: SvgPath.notification,
            onTap: () {},
          ),
          ItemWidget(
            title: LocaleKeys.settings.tr(),
            svgPath: SvgPath.settings,
            onTap: () {},
            isBorder: false,
          ),
          const CustomDivider(height: 8,),
        ],
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  final String title;
  final String svgPath;
  final bool isBorder;
  final void Function()? onTap;

  const ItemWidget(
      {super.key,
      required this.title,
      required this.svgPath,
      this.isBorder = true,
      this.onTap,});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: UnderlineInputBorder(
        borderSide: BorderSide(
          color: isBorder ? AppColors.greyColor9 : Colors.transparent,
        ),
      ),
      leading: Text(
        title,
        style: CustomThemes.greyColor1CTextStyle(context).copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      trailing: SvgPicture.asset(
        svgPath,
        height: 18.h,
        width: 18.w,
      ),
    );
  }
}
