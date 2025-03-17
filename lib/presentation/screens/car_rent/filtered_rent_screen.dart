import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:wafi_user/core/app_router/screens_name.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';
import 'package:wafi_user/core/assets_path/images_path.dart';
import 'package:wafi_user/core/constants/extensions.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_divider.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_text_form_field.dart';

import '../../../core/app_theme/custom_themes.dart';
import '../../../core/constants/constants.dart';
import '../../../translations/locale_keys.g.dart';
import '../../widgets/shared_widgets/gradiant_color_button.dart';

class FilteredRentScreen extends StatelessWidget {
  const FilteredRentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.rentACar.tr()),
      body: Column(
        children: [
          const CustomSizedBox(height: 24,),
          const FilterScreenSearch().symmetricPadding(horizontal: 16),
          const CustomSizedBox(height: 16,),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 16.h
              ),
              itemBuilder: (_, index) {
                return InkWell(onTap:(){
                  Navigator.pushNamed(context, ScreenName.carRentDetails);
                },child: const FilteredRentCarsContainer());
              },
              separatorBuilder: (_, index) {
                return const CustomSizedBox(
                  height: 16,
                );
              },
              itemCount: 5,
            ),
          )
        ],
      ),
    );
  }
}

class FilteredRentCarsContainer extends StatelessWidget {
  const FilteredRentCarsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 196.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 8,
            spreadRadius: 0,
            color: Color.fromRGBO(0, 0, 0, 0.07),
          ),
        ],
      ),
      // Your content goes here
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hyundai Accent 2020",
                      style:
                          CustomThemes.greyColor16TextStyle(context).copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    const CustomSizedBox(height: 10,),
                    Text(
                      "5 seater",
                      style:
                          CustomThemes.greyColor16TextStyle(context).copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    const CustomSizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.locationDetailsContainer,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: GradientText(
                        "Economy",
                        colors: AppColors.gradientColorsList,
                      ),
                    )
                  ],
                ),
              ),
              Image.asset(
                ImagesPath.car2,
                width: 96.w,
                height: 61.h,
              ),
            ],
          ),
          const CustomSizedBox(
            height: 16,
          ),
          const CustomDivider(
            height: 2,
          ),
          const CustomSizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hyundai Accent 2020",
                      style:
                          CustomThemes.greyColor99TextStyle(context).copyWith(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Text(
                      "5 seater",
                      style:
                          CustomThemes.greyColor1CTextStyle(context).copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
              ),
              CustomGradientButton(
                borderRadius: 6,
                height: 40.h,
                width: 108.w,
                child: Text(
                  LocaleKeys.chooseCar.tr(),
                  style: CustomThemes.whiteColoTextTheme(context).copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FilterScreenSearch extends StatelessWidget {
  const FilterScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.10),
            offset: Offset(0, 4),
            blurRadius: 12,
          ),
        ],
      ),
      child: CustomTextField(
        hintText: LocaleKeys.searchCars.tr(),
        prefixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search_outlined,
            color: AppColors.greyColor9,
          ),
        ),
      ),
    );
  }
}
