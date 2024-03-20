import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/assets_path/svg_path.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradient_svg.dart';

import '../../../core/app_router/screens_name.dart';
import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/constants/constants.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';

class CarInsurance extends StatelessWidget {
  const CarInsurance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: const CustomAppBar(
          title: "Car Insurance",
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 32.h,
        ),
        children: [
          InsuranceDashboardWidget(
            title: "New Insurance",
            svgPath: SvgPath.insurance1,
            haveCounter: false,
            onTap: () {},
            onTap: () {
              Navigator.pushNamed(context, ScreenName.newInsuranceScreen);
            },
          ),
          const CustomSizedBox(
            height: 16,
          ),
          InsuranceDashboardWidget(
            title: "Existing Policy",
            svgPath: SvgPath.policy,
            onTap: () {
              Navigator.pushNamed(context, ScreenName.existingPolicesScreen);
            },
          ),
          const CustomSizedBox(
            height: 16,
          ),
          InsuranceDashboardWidget(
            title: "Due For Renewal",
            svgPath: SvgPath.renewable,
            onTap: () {
              Navigator.pushNamed(context, ScreenName.dueForRenewl);
            },
          ),
          const CustomSizedBox(
            height: 16,
          ),
          InsuranceDashboardWidget(
            title: "Expired Policies",
            svgPath: SvgPath.alert,
            onTap: () {
              Navigator.pushNamed(context, ScreenName.expiredPolices);
            },
          ),
          const CustomSizedBox(
            height: 16,
          ),
          InsuranceDashboardWidget(
            title: "Existing Cars",
            svgPath: SvgPath.steeringWheel,
            onTap: () {
              Navigator.pushNamed(context, ScreenName.existingPolicesScreen);
            },
          ),
        ],
      ),
    );
  }
}

class InsuranceDashboardWidget extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final String svgPath;
  final bool haveCounter;

  const InsuranceDashboardWidget({
    super.key,
    this.onTap,
    required this.title,
    required this.svgPath,
    this.haveCounter = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Ink(
        padding: EdgeInsets.all(1.2.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            gradient: LinearGradient(
              colors: AppColors.gradientColorsList,
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
            ),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 4.h),
                  blurRadius: 12.r,
                  color: AppColors.shadowColor(value: .1))
            ]),
        child: Ink(
          padding: EdgeInsets.symmetric(
            vertical: 30.h,
            horizontal: 44.w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColors.whiteColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GradientSvg(
                svgPath: svgPath,
                height: 40.h,
                width: 40.w,
              ),
              const CustomSizedBox(
                width: 8,
              ),
              Text(
                title,
                style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const CustomSizedBox(
                width: 8,
              ),
              Ink(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: AppColors.gradientColorsList,
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                  ),
                ),
                padding: EdgeInsets.all(
                  4.sp,
                ),
                child: Text(
                  "2",
                  style: CustomThemes.whiteColoTextTheme(context).copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
