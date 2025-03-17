import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:wafi_user/presentation/widgets/service_on_map_screen/sub_service_details_widget.dart';

import '../../../core/app_router/screens_name.dart';
import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/lottie_path.dart';
import '../../../translations/locale_keys.g.dart';
import '../../business_logic/car_service_cubit/car_service_cubit.dart';
import '../shared_widgets/custom_sized_box.dart';
import '../shared_widgets/empty_content_widget.dart';
import '../shared_widgets/gradiant_color_button.dart';

class SubServiceWidget extends StatelessWidget {
  const SubServiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -1.h),
            blurRadius: 16.r,
            color: AppColors.shadowColor(value: 0.1),
          )
        ],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16.r),
          topLeft: Radius.circular(16.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Select Service",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          const CustomSizedBox(
            height: 16,
          ),
          BlocBuilder<CarServiceCubit, CarServiceState>(
            builder: (context, state) {
              CarServiceCubit cubit = CarServiceCubit.get(context);
              return cubit.getSubServiceLoading
                  ? Center(
                      child: Lottie.asset(LottiePath.loading),
                    )
                  : cubit.subServiceList!.isNotEmpty
                      ? GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 168.w / 50.h,
                            crossAxisSpacing: 8.w,
                            mainAxisSpacing: 16.h,
                          ),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) {
                            return SubServicesDetailsWidget(
                              onTab: () {
                                cubit.selectServiceList(
                                    cubit.subServiceList![index]);
                              },
                              isSelected: cubit.selectedSubServiceList ==
                                  cubit.subServiceList?[index],
                              serviceModel: cubit.subServiceList?[index],
                            );
                          },
                          itemCount: cubit.subServiceList?.length ?? 0,
                        )
                      : const Center(
                          child: EmptyContentWidget(
                            title: "No Service",
                            height: 100,
                            width: 100,
                          ),
                        );
            },
          ),
          const CustomSizedBox(
            height: 16,
          ),
          BlocBuilder<CarServiceCubit, CarServiceState>(
            builder: (context, state) {
              CarServiceCubit cubit = CarServiceCubit.get(context);
              return cubit.getSubServiceLoading
                  ? const CustomSizedBox()
                  : CustomGradientButton(
                      onPressed: cubit.subServiceList!.isNotEmpty &&
                              cubit.selectedSubServiceList != null
                          ? () {
                              Navigator.pushNamed(
                                context,
                                ScreenName.servicesCartScreen,
                                arguments: [
                                  "${cubit.selectedSubServiceList?.title}",
                                  cubit,
                                ],
                              );
                            }
                          : null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LocaleKeys.continueText.tr(),
                            style: CustomThemes.whiteColoTextTheme(context)
                                .copyWith(
                              fontSize: 14.sp,
                              // 29.282031462834418, 31.198616065084934
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const CustomSizedBox(
                            width: 8,
                          ),
                          const Icon(
                            Icons.arrow_forward,
                            color: AppColors.whiteColor,
                          )
                        ],
                      ),
                    );
            },
          ),
          const CustomSizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
