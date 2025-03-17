import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_theme/custom_themes.dart';
import 'package:wafi_user/core/constants/constants.dart';
import 'package:wafi_user/presentation/business_logic/car_service_cubit/car_service_cubit.dart';
import 'package:wafi_user/presentation/widgets/service_on_map_screen/service_map_widget.dart';
import '../../widgets/service_on_map_screen/map_service_search_bar_widget.dart';
import '../../widgets/service_on_map_screen/sub_service_widget.dart';

class ServiceOnMapScreenArgs {
  final String title;
  final CarServiceCubit cubit;
  final int id;

  ServiceOnMapScreenArgs({
    required this.title,
    required this.id,
    required this.cubit,
  });
}

class ServicesOnMapScreen extends StatefulWidget {
  final ServiceOnMapScreenArgs screenArgs;

  const ServicesOnMapScreen({
    super.key,
    required this.screenArgs,
  });

  @override
  State<ServicesOnMapScreen> createState() => _ServicesOnMapScreenState();
}

class _ServicesOnMapScreenState extends State<ServicesOnMapScreen> {
  @override
  void initState() {
    context.read<CarServiceCubit>()
      ..getCurrentLocation()
      ..getSubServiceList(id: widget.screenArgs.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const MapWidget(),
          const SubServiceWidget(),
          PositionedDirectional(
            top: preferredSize.height / 1.5,
            start: 0,
            child: Row(
              children: [
                const BackButton(),
                Text(
                  widget.screenArgs.title,
                  style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const MapServiceSearchBarWidget(),
        ],
      ),
    );
  }
}
