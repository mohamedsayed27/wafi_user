import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:wafi_user/core/app_router/screens_name.dart';
import 'package:wafi_user/core/assets_path/lottie_path.dart';
import 'package:wafi_user/data/models/car_service_and_maintenance_models/car_service_model.dart';
import 'package:wafi_user/presentation/business_logic/car_service_cubit/car_service_cubit.dart';
import 'package:wafi_user/presentation/screens/services_on_map_screen/services_on_map_screen.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/cached_network_image_widget.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/empty_content_widget.dart';
import 'package:wafi_user/translations/locale_keys.g.dart';
import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/services/services_locator.dart';
import '../../widgets/shared_widgets/custom_app_bar.dart';

class ServiceAndMaintenanceScreen extends StatelessWidget {
  const ServiceAndMaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CarServiceCubit>()..getServiceList(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.servicesAndMaintenance.tr(),
        ),
        body: BlocBuilder<CarServiceCubit, CarServiceState>(
          builder: (context, state) {
            final cubit = CarServiceCubit.get(context);
            return state is GetServiceListLoading
                ? Center(
                    child: Lottie.asset(
                      LottiePath.loading,
                    ),
                  )
                : cubit.serviceList!.isNotEmpty
                    ? ListView.separated(
                        itemBuilder: (_, index) {
                          return ServicesAndMaintenanceWidget(
                            onTap: () {
                              cubit.selectedSubServiceList = null;
                              cubit.carServiceModel = cubit.serviceList?[index];

                              Navigator.pushNamed(
                                context,
                                ScreenName.servicesOnMapScreen,
                                arguments: ServiceOnMapScreenArgs(
                                  title: cubit.serviceList?[index].title ?? "",
                                  id: cubit.serviceList?[index].id ?? 0,
                                  cubit: cubit,
                                ),
                              );
                            },
                            carServiceModel: cubit.serviceList?[index],
                          );
                        },
                        separatorBuilder: (_, index) {
                          return const CustomSizedBox(
                            height: 0,
                          );
                        },
                        itemCount: cubit.serviceList?.length ?? 0,
                      )
                    : Center(
                        child: EmptyContentWidget(
                          title: "No Service",
                          height: 32.h,
                          width: 32.w,
                        ),
                      );
          },
        ),
      ),
    );
  }
}

class ServicesAndMaintenanceWidget extends StatelessWidget {
  final void Function()? onTap;
  final bool isBorder;
  final CarServiceModel? carServiceModel;

  const ServicesAndMaintenanceWidget({
    super.key,
    required this.carServiceModel,
    this.onTap,
    this.isBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: isBorder
          ? UnderlineInputBorder(
              borderSide: BorderSide(width: 0.5.w, color: AppColors.greyColor9.withOpacity(0.4)))
          : null,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
      title: Text(
        carServiceModel?.title ?? "",
        style: CustomThemes.greyColor1CTextStyle(context).copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: CachedNetworkImageWidget(
        imageUrl: carServiceModel?.imageUrl ?? "",
        height: 24.w,
        width: 24.w,
      ),
    );
  }
}
