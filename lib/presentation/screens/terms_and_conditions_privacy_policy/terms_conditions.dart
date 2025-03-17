import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wafi_user/core/app_theme/custom_themes.dart';
import 'package:wafi_user/core/assets_path/svg_path.dart';
import 'package:wafi_user/core/constants/extensions.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';

import '../../../core/constants/constants.dart';

class TermsConditions extends StatelessWidget {
  final String title;
  const TermsConditions({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomSizedBox(
            height: 24,
          ),
          SvgPicture.asset(
            SvgPath.wafiLogo,
            width: 164.w,
            height: 45.h,
          ),
          const CustomSizedBox(
            height: 24,
          ),
          Text(
            "WAFI",
            textAlign: TextAlign.center,
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
            ),
          ),
          const CustomSizedBox(
            height: 8,
          ),
          Text(
            "It is a long established fact that a reader will be distracted by the readable content.",
            textAlign: TextAlign.center,
            style: CustomThemes.greyColor99TextStyle(context).copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 12.sp,
            ),
          ).symmetricPadding(horizontal: 32),
          const CustomSizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 32.h),
                itemBuilder: (_, index) {
                  return  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style:
                        CustomThemes.greyColor1CTextStyle(context).copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                        ),
                      ),
                      const CustomSizedBox(
                        height: 8,
                      ),
                      Text(
                        "\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"",
                        style:
                        CustomThemes.greyColor99TextStyle(context).copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (_, index) {
                  return const CustomSizedBox(height: 16,);
                },
                itemCount: 5),
          )
        ],
      ),
    );
  }
}
