import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_router/screens_name.dart';
import 'package:wafi_user/core/assets_path/svg_path.dart';

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
        child: const CustomAppBar(
          title: 'Service And MaintenanceScreen',
        ),
      ),
      body: ListView(
        children: [
          ServicesAndMaintenanceWidget(
            title: 'Battery Service',
            onTap: (){
              Navigator.pushNamed(context, ScreenName.servicesOnMapScreen,arguments: "Battery Service");
            },

            svgPath: SvgPath.carBattery,
          ),
          ServicesAndMaintenanceWidget(
            title: 'Tires Service',
            onTap: (){
              Navigator.pushNamed(context, ScreenName.servicesOnMapScreen,arguments: "Tires Service");
            },

            svgPath: SvgPath.racing,
          ),
          ServicesAndMaintenanceWidget(
            title: 'Locksmith',
            onTap: (){
              Navigator.pushNamed(context, ScreenName.servicesOnMapScreen,arguments: "Locksmith");
            },

            svgPath: SvgPath.lockSmith,
          ),
          ServicesAndMaintenanceWidget(
            title: 'Fuel',
            onTap: (){
              Navigator.pushNamed(context, ScreenName.servicesOnMapScreen,arguments: "Fuel");
            },

            svgPath: SvgPath.fuel,
          ),
          ServicesAndMaintenanceWidget(
            title: 'Oil',
            onTap: (){
              Navigator.pushNamed(context, ScreenName.servicesOnMapScreen,arguments: "Oil");
            },

            svgPath: SvgPath.oil,
          ),
          ServicesAndMaintenanceWidget(
            title: 'Car Check-Up',
            onTap: (){
              Navigator.pushNamed(context, ScreenName.servicesOnMapScreen,arguments: "Car Check-Up");
            },

            svgPath: SvgPath.carRepair,
          ),
          ServicesAndMaintenanceWidget(
            title: 'Towing Service',
            onTap: (){
              Navigator.pushNamed(context, ScreenName.servicesOnMapScreen,arguments: "Towing Service");
            },

            svgPath: SvgPath.towTruck,
          ),
          ServicesAndMaintenanceWidget(
            title: 'Car Detailing',
            onTap: (){
              Navigator.pushNamed(context, ScreenName.servicesOnMapScreen,arguments: "Car Detailing");
            },

            svgPath: SvgPath.carWash,
          ),
          ServicesAndMaintenanceWidget(
            title: 'Bodywork',
            onTap: (){
              Navigator.pushNamed(context, ScreenName.servicesOnMapScreen,arguments: "Bodywork");
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
