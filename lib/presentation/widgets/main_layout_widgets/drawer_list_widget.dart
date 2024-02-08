import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_router/screens_name.dart';
import 'package:wafi_user/core/assets_path/svg_path.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../shared_widgets/gradient widgets.dart';
import '../shared_widgets/gradient_svg.dart';

class DrawerListWidget extends StatefulWidget {
  const DrawerListWidget({super.key});

  @override
  State<DrawerListWidget> createState() => _DrawerListWidgetState();
}

class _DrawerListWidgetState extends State<DrawerListWidget> {
  int? currentIndex = 0;
  List<Map<String, dynamic>> items(context) => [
    {
      "title": "Home",
      "svgPath": SvgPath.home,
      "onTap":(){

      }
    },
    {
      "title": "My Cars",
      "svgPath": SvgPath.carKey,
      "onTap":(){
        // Navigator.pushNamed(context, ScreenName.savedCardsScreen);
      }
    },
    {
      "title": "Wallet",
      "svgPath": SvgPath.wallet,
      "onTap":(){

      }
    },
    {
      "title": "Support Contact Us",
      "svgPath": SvgPath.phone,
      "onTap":(){
        Navigator.pushNamed(context, ScreenName.supportChatScreen);
      }
    },
    {
      "title": "Share App",
      "svgPath": SvgPath.share,
    },
    {
      "title": "Become a Wafi driver",
      "svgPath": SvgPath.driver,
    },
    {
      "title": "Be a Wafi supplier",
      "svgPath": SvgPath.deliveryMan,
    },
    {
      "title": "Terms & Conditions",
      "svgPath": SvgPath.clipboard,
      "onTap":(){
        Navigator.pushNamed(context, ScreenName.termsAndConditions);
      }
    },
    {
      "title": "Privacy Policy",
      "svgPath": SvgPath.insurance,
      "onTap":(){
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
              if(index==2)Navigator.pushNamed(context, ScreenName.walletScreen);
              if(index==3)Navigator.pushNamed(context, ScreenName.supportChatScreen);
              if(index==7)Navigator.pushNamed(context, ScreenName.termsAndConditions,arguments: "Terms And Conditions");
              if(index==8)Navigator.pushNamed(context, ScreenName.termsAndConditions,arguments: "Privacy Policy");
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
                const CustomSizedBox(width: 16,),
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
