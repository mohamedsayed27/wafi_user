import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';
import 'package:wafi_user/core/app_router/screens_name.dart';
import 'package:wafi_user/core/assets_path/svg_path.dart';
import 'package:wafi_user/core/constants/constants.dart';
import 'package:wafi_user/core/constants/extensions.dart';
import 'package:wafi_user/core/parameters/car_service_parameters.dart';
import 'package:wafi_user/presentation/business_logic/car_service_cubit/car_service_cubit.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/cached_network_image_widget.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_divider.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradient_svg.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../translations/locale_keys.g.dart';
import '../../widgets/reservations_widgets/location_details_container.dart';
import '../../widgets/shared_widgets/bill_details_item.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';
import '../../widgets/shared_widgets/gradiant_color_button.dart';
import '../../widgets/shared_widgets/gradient_widgets.dart';

class ServicesCartScreen extends StatelessWidget {
  final String servicesType;

  const ServicesCartScreen({
    super.key,
    required this.servicesType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.cart.tr(),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<CarServiceCubit, CarServiceState>(
          listener: (context, state) {
            CarServiceCubit cubit = CarServiceCubit.get(context);
            if (state is AddOrderServiceLoading) {
              showProgressIndicator(context);
            } else if (state is AddOrderServiceError) {
              Navigator.pop(context);
              showToast(errorType: 1, message: state.message);
            } else if (state is AddOrderServiceSuccess) {
              cubit.serviceDateSelected = null;
              cubit.serviceTimeSelected = null;
              cubit.selectedSubServiceList = null;
              showToast(errorType: 0, message: state.response.message ?? "");
              Navigator.pushNamedAndRemoveUntil(
                context,
                ScreenName.mainLayoutScreen,
                (route) => false,
              );
            }
          },
          builder: (context, state) {
            CarServiceCubit cubit = CarServiceCubit.get(context);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomSizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.dropOffAddress.tr(),
                      style: CustomThemes.greyColor16TextStyle(context).copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    GradientSvg(
                      svgPath: SvgPath.mapsLocation,
                      height: 18.h,
                      width: 15.w,
                    ),
                  ],
                ).symmetricPadding(horizontal: 16),
                const CustomSizedBox(
                  height: 8,
                ),
                DetailsContainer(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          cubit.controller.query.isEmpty
                              ? cubit.googleMapsSearchBarHint
                              : cubit.controller.query,
                          style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color:
                                CustomThemes.greyColor1CTextStyle(context).color!.withOpacity(0.8),
                          ),
                        ),
                      ),
                      const CustomSizedBox(
                        width: 16,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: GradientWidget(
                          gradientList: AppColors.gradientColorsList,
                          isGradient: true,
                          child: Text(
                            LocaleKeys.change.tr(),
                            style: CustomThemes.whiteColoTextTheme(context).copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ).symmetricPadding(horizontal: 16),
                const CustomSizedBox(
                  height: 16,
                ),
                const CustomDivider(),
                const CustomSizedBox(
                  height: 16,
                ),
                Text(
                  LocaleKeys.servicesAdded.tr(),
                  style: CustomThemes.greyColor16TextStyle(context).copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                ).onlyDirectionalPadding(start: 16),
                const CustomSizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    CachedNetworkImageWidget(
                      imageUrl: cubit.carServiceModel?.imageUrl ?? "",
                      height: 24.w,
                      width: 24.w,
                    ),
                    const CustomSizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cubit.carServiceModel?.title ?? "",
                            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            cubit.selectedSubServiceList?.title ?? "",
                            style: CustomThemes.greyColor99TextStyle(context).copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ).symmetricPadding(horizontal: 16),
                const CustomSizedBox(
                  height: 16,
                ),
                const CustomDivider(),
                const CustomSizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.selectPreferredDate.tr(),
                      style: CustomThemes.greyColor16TextStyle(context).copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    CustomSizedBox(
                      height: 18,
                      width: 15,
                      child: IconButton(
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            currentDate: cubit.serviceDateSelected,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(
                              const Duration(
                                days: 365,
                              ),
                            ),
                          ).then((value) {
                            cubit.selectDate(value);
                          });
                        },
                        style: IconButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        icon: GradientSvg(
                          svgPath: SvgPath.calendar,
                          height: 18.h,
                          width: 15.w,
                        ),
                      ),
                    ),
                  ],
                ).symmetricPadding(horizontal: 16),
                const CustomSizedBox(
                  height: 8,
                ),
                Container(
                  clipBehavior: Clip.antiAlias,
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.5.w,
                    vertical: 0.5.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    gradient: LinearGradient(
                      colors: AppColors.gradientColorsList,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: AppColors.locationDetailsContainer,
                    ),
                    child: Column(
                      children: [
                        if (cubit.serviceDateSelected != null &&
                            cubit.serviceDateSelected!.isAtSameMomentAs(DateTime.now()))
                          Text(
                            cubit.serviceDateSelected != null &&
                                    cubit.serviceDateSelected!.isAtSameMomentAs(DateTime.now())
                                ? LocaleKeys.today.tr()
                                : Jiffy.parse("${cubit.serviceDateSelected}").Md,
                            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        Text(
                          cubit.serviceDateSelected != null
                              ? Jiffy.parse("${cubit.serviceDateSelected}").MMMEd
                              : "Select Date",
                          style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ).onlyDirectionalPadding(start: 16),
                const CustomSizedBox(
                  height: 16,
                ),
                Text(
                  LocaleKeys.selectPreferredTime.tr(),
                  style: CustomThemes.greyColor16TextStyle(context).copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                ).onlyDirectionalPadding(start: 16),
                const CustomSizedBox(
                  height: 8,
                ),
                Container(
                  clipBehavior: Clip.antiAlias,
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.5.w,
                    vertical: 0.5.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    gradient: LinearGradient(
                      colors: AppColors.gradientColorsList,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      showTimePicker(
                        context: context,
                        initialTime: cubit.serviceTimeSelected ?? TimeOfDay.now(),
                      ).then((value) {
                        cubit.selectTime(value);
                      });
                      ;
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: AppColors.locationDetailsContainer,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            cubit.serviceTimeSelected?.format(context) ?? "Select Time",
                            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 18.r,
                          ),
                        ],
                      ),
                    ),
                  ),
                ).symmetricPadding(horizontal: 16),
                const CustomSizedBox(
                  height: 16,
                ),
                const CustomDivider(),
                const CustomSizedBox(
                  height: 16,
                ),
                Text(
                  LocaleKeys.billDetails.tr(),
                  style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ).onlyDirectionalPadding(start: 16),
                const CustomSizedBox(
                  height: 8,
                ),
                BillDetailsItem(
                  title: cubit.selectedSubServiceList?.title ?? "",
                  balance: "${cubit.selectedSubServiceList?.price}",
                ),
                // const CustomSizedBox(
                //   height: 2,
                // ),
                // BillDetailsItem(
                //   title: LocaleKeys.serviceTaxes.tr(),
                //   balance: "90",
                // ),
                const CustomSizedBox(
                  height: 2,
                ),
                const CustomSizedBox(
                  height: 16,
                ),
                const CustomDivider(),
                const CustomSizedBox(
                  height: 24,
                ),
                CustomGradientButton(
                  borderRadius: 4,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  onPressed: cubit.serviceDateSelected != null && cubit.serviceTimeSelected != null
                      ? () {
                          cubit.addOrderService(
                            parameters: CarServicesParameters(
                              addressText: cubit.controller.query,
                              latitude: cubit.cameraPosition.target.latitude.toString(),
                              longitude: cubit.cameraPosition.target.longitude.toString(),
                              orderDate: cubit.serviceDateSelected?.toIso8601String(),
                              orderTime: cubit.serviceTimeSelected?.toString(),
                              sectionId: cubit.selectedSubServiceList?.sectionId,
                              serviceId: cubit.selectedSubServiceList?.id,
                            ),
                          );
                        }
                      : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${cubit.selectedSubServiceList?.price} SAR",
                        style: CustomThemes.whiteColoTextTheme(context).copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            LocaleKeys.buyNow.tr(),
                            style: CustomThemes.whiteColoTextTheme(context).copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 18.r,
                            color: AppColors.whiteColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ).symmetricPadding(horizontal: 16)
              ],
            );
          },
        ),
      ),
    );
  }
}
