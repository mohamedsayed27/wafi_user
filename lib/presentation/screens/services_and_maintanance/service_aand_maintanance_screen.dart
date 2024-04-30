import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_router/screens_name.dart';
import 'package:wafi_user/core/assets_path/svg_path.dart';
import 'package:wafi_user/translations/locale_keys.g.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/constants/constants.dart';
import '../../widgets/shared_widgets/custom_app_bar.dart';
import '../../widgets/shared_widgets/gradient_svg.dart';

class ServiceAndMaintenanceScreen extends StatelessWidget {
  const ServiceAndMaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child:  CustomAppBar(
          title: LocaleKeys.servicesAndMaintenance.tr(),
        ),
      ),
      body: ListView(
        children: [
          ServicesAndMaintenanceWidget(
            title: LocaleKeys.batteryService.tr(),
            onTap: (){
              Navigator.pushNamed(context, ScreenName.servicesOnMapScreen,arguments: LocaleKeys.batteryService.tr());
            },

            svgPath: SvgPath.carBattery,
          ),
          ServicesAndMaintenanceWidget(
            title: LocaleKeys.tiresService.tr(),
            onTap: (){
              Navigator.pushNamed(context, ScreenName.servicesOnMapScreen,arguments: LocaleKeys.tiresService.tr());
            },

            svgPath: SvgPath.racing,
          ),
          ServicesAndMaintenanceWidget(
            title: LocaleKeys.locksmith.tr(),
            onTap: (){
              Navigator.pushNamed(context, ScreenName.servicesOnMapScreen,arguments: LocaleKeys.locksmith.tr());
            },

            svgPath: SvgPath.lockSmith,
          ),
          ServicesAndMaintenanceWidget(
            title: LocaleKeys.fuel.tr(),
            onTap: (){
              Navigator.pushNamed(context, ScreenName.servicesOnMapScreen,arguments: LocaleKeys.fuel.tr());
            },

            svgPath: SvgPath.fuel,
          ),
          ServicesAndMaintenanceWidget(
            title: LocaleKeys.oil.tr(),
            onTap: (){
              Navigator.pushNamed(context, ScreenName.servicesOnMapScreen,arguments: LocaleKeys.oil.tr());
            },

            svgPath: SvgPath.oil,
          ),
          ServicesAndMaintenanceWidget(
            title: LocaleKeys.carCheckUp.tr(),
            onTap: (){
              Navigator.pushNamed(context, ScreenName.servicesOnMapScreen,arguments: LocaleKeys.carCheckUp.tr());
            },

            svgPath: SvgPath.carRepair,
          ),
          ServicesAndMaintenanceWidget(
            title: LocaleKeys.towingService.tr(),
            onTap: (){
              Navigator.pushNamed(context, ScreenName.servicesOnMapScreen,arguments: LocaleKeys.towingService.tr());
            },

            svgPath: SvgPath.towTruck,
          ),
          ServicesAndMaintenanceWidget(
            title: LocaleKeys.carDetailing.tr(),
            onTap: (){
              Navigator.pushNamed(context, ScreenName.servicesOnMapScreen,arguments: LocaleKeys.carDetailing.tr());
            },

            svgPath: SvgPath.carWash,
          ),
          ServicesAndMaintenanceWidget(
            title: LocaleKeys.bodywork.tr(),
            onTap: (){
              Navigator.pushNamed(context, ScreenName.servicesOnMapScreen,arguments: LocaleKeys.bodywork.tr());
            },

            svgPath: SvgPath.service,
            isBorder: false,
          ),
        ],
      ),
    );
  }
}

class ServicesAndMaintenanceWidget extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final String? svgPath;
  final bool isBorder;
  const ServicesAndMaintenanceWidget({
    super.key,
    required this.title,
    this.onTap,
    this.svgPath, this.isBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: isBorder?UnderlineInputBorder(
        borderSide: BorderSide(
          width: 0.5.w,
          color: AppColors.greyColor9.withOpacity(0.4)
        )
      ):null,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
      title: Text(
        title,
        style: CustomThemes.greyColor1CTextStyle(context).copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: GradientSvg(
        svgPath: svgPath!,
        isSelected: true,
        height: 22.h,
        width: 22.w,
      ),
    );
  }
}
