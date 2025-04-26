import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_router/screens_name.dart';
import 'package:wafi_user/core/assets_path/svg_path.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../translations/locale_keys.g.dart';
import '../shared_widgets/gradient_widgets.dart';
import '../shared_widgets/gradient_svg.dart';

class DrawerListWidget extends StatefulWidget {
  const DrawerListWidget({super.key});

  @override
  State<DrawerListWidget> createState() => _DrawerListWidgetState();
}

class _DrawerListWidgetState extends State<DrawerListWidget> {
  int? currentIndex = 0;
  List<Map<String, dynamic>> items(context) => [
        {"title": LocaleKeys.home.tr(), "svgPath": SvgPath.home, "onTap": () {}},
        {
          "title": LocaleKeys.myCars.tr(),
          "svgPath": SvgPath.carKey,
          "onTap": () {
            // Navigator.pushNamed(context, ScreenName.savedCardsScreen);
          }
        },
        {"title": LocaleKeys.wallet.tr(), "svgPath": SvgPath.wallet, "onTap": () {}},
        {
          "title": LocaleKeys.supportContactUs.tr(),
          "svgPath": SvgPath.phone,
          "onTap": () {
            Navigator.pushNamed(context, ScreenName.supportChatScreen);
          }
        },
        {
          "title": LocaleKeys.shareApp.tr(),
          "svgPath": SvgPath.share,
        },
        {
          "title": LocaleKeys.becomeAWafiDriver.tr(),
          "svgPath": SvgPath.driver,
        },
        {
          "title": LocaleKeys.beAWafiSupplier.tr(),
          "svgPath": SvgPath.deliveryMan,
        },
        {
          "title": LocaleKeys.termsAndConditions.tr(),
          "svgPath": SvgPath.clipboard,
          "onTap": () {
            Navigator.pushNamed(context, ScreenName.termsAndConditions);
          }
        },
        {
          "title": LocaleKeys.privacyPolicy.tr(),
          "svgPath": SvgPath.insurance,
          "onTap": () {
            Navigator.pushNamed(context, ScreenName.termsAndConditions);
          }
        },
      ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () {
              if (index == 1) Navigator.pushNamed(context, ScreenName.myCarsScreen);
              if (index == 2) Navigator.pushNamed(context, ScreenName.walletScreen);
              if (index == 3) Navigator.pushNamed(context, ScreenName.supportChatScreen);
              if (index == 7)
                Navigator.pushNamed(context, ScreenName.termsAndConditions,
                    arguments: LocaleKeys.termsConditions.tr());
              if (index == 8)
                Navigator.pushNamed(context, ScreenName.termsAndConditions,
                    arguments: LocaleKeys.privacyPolicy.tr());
            },
            child: Row(
              children: [
                GradientSvg(
                  svgDisabledColor: AppColors.whiteColor,
                  svgPath: items(context)[index]["svgPath"],
                  isSelected: currentIndex == index,
                  height: 22.h,
                  width: 22.w,
                ),
                const CustomSizedBox(
                  width: 16,
                ),
                GradientWidget(
                  gradientList: AppColors.gradientTextList,
                  isGradient: currentIndex == index,
                  child: Text(
                    items(context)[index]["title"],
                    style: CustomThemes.whiteColoTextTheme(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const CustomSizedBox(
            height: 16,
          );
        },
        itemCount: items(context).length);
  }
}
