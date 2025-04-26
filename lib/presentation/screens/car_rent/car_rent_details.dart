import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:wafi_user/core/app_router/screens_name.dart';
import 'package:wafi_user/core/assets_path/svg_path.dart';
import 'package:wafi_user/core/constants/extensions.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_divider.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradient_svg.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/images_path.dart';
import '../../../translations/locale_keys.g.dart';
import '../../widgets/bottom_sheets/car_rent/car_rent_filter_bottom_sheet.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';
import '../../widgets/shared_widgets/gradiant_color_button.dart';

class CarRentDetails extends StatefulWidget {
  const CarRentDetails({super.key});

  @override
  State<CarRentDetails> createState() => _CarRentDetailsState();
}

class _CarRentDetailsState extends State<CarRentDetails> {
  List<String> items = [
    LocaleKeys.openKm.tr(),
    LocaleKeys.gccBoardsFees.tr(),
    LocaleKeys.extraDriver.tr(),
  ];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.rentACar.tr(),
      ),
      body: Column(
        children: [
          const CustomSizedBox(
            height: 24,
          ),
          const IntroCarDetails(),
          const CustomSizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.chooseFromAllies.tr(),
                style: CustomThemes.greyColor16TextStyle(context).copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const CustomSizedBox(
                width: 2,
              ),
              TextButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context, builder: (_) => const CarRentBottomSheet());
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      SvgPath.racing,
                      height: 18.h,
                      width: 11.w,
                    ),
                    const CustomSizedBox(
                      width: 4,
                    ),
                    Text(
                      "SOR",
                      style: CustomThemes.greyColor16TextStyle(context).copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const CustomSizedBox(
            height: 16,
          ),
          CustomSizedBox(
            height: 38,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return InkWell(
                  onTap: () {
                    if (selectedIndex == index) {
                      selectedIndex = null;
                      setState(() {});
                    } else {
                      setState(() {
                        selectedIndex = index;
                      });
                    }
                    if (index == 2) {
                      Navigator.pushNamed(context, ScreenName.chooseDriverTypeScreen);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.h,
                      horizontal: 10.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      gradient: LinearGradient(
                        colors: selectedIndex == index
                            ? AppColors.gradientColorsList
                            : AppColors.gradientColorsList.map((e) => e.withOpacity(0.1)).toList(),
                        begin: AlignmentDirectional.topStart,
                        end: AlignmentDirectional.bottomEnd,
                      ),
                    ),
                    child: Text(
                      items[index],
                      style: selectedIndex == index
                          ? CustomThemes.whiteColoTextTheme(context).copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            )
                          : CustomThemes.greyColor1CTextStyle(context).copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                    ),
                  ),
                );
              },
              separatorBuilder: (_, index) {
                return const CustomSizedBox(
                  width: 16,
                );
              },
              itemCount: items.length,
            ),
          ),
          const CustomSizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (_, index) {
                  return const AgentNameDetails();
                },
                separatorBuilder: (_, index) {
                  return const CustomSizedBox(
                    height: 16,
                  );
                },
                itemCount: 4),
          ),
        ],
      ).symmetricPadding(horizontal: 16),
    );
  }
}

class IntroCarDetails extends StatelessWidget {
  const IntroCarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 94.h,
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
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hyundai Accent 2020",
                  style: CustomThemes.greyColor16TextStyle(context).copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                const CustomSizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "5 seater",
                      style: CustomThemes.greyColor16TextStyle(context).copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    const CustomSizedBox(
                      width: 6,
                    ),
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
    );
  }
}

class AgentNameDetails extends StatelessWidget {
  const AgentNameDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 24.h,
                    width: 24.w,
                    decoration: BoxDecoration(
                      color: AppColors.greyColor9,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                  const CustomSizedBox(
                    width: 4,
                  ),
                  Text(
                    "Agent Name",
                    style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    LocaleKeys.openNow.tr(),
                    style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff0F9E0E),
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  const CustomSizedBox(
                    width: 4,
                  ),
                  Container(
                    height: 21.h,
                    width: 1.w,
                    color: AppColors.greyColor9,
                  ),
                  const CustomSizedBox(
                    width: 4,
                  ),
                  Text(
                    "4.5",
                    style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GradientSvg(
                    svgPath: SvgPath.mapsLocation,
                    height: 16.h,
                    width: 16.w,
                  ),
                  const CustomSizedBox(
                    width: 4,
                  ),
                  Text(
                    "Riyadh, Ar-Riyad",
                    style: CustomThemes.greyColor99TextStyle(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  GradientSvg(
                    svgPath: SvgPath.send,
                    height: 16.h,
                    width: 16.w,
                  ),
                  const CustomSizedBox(
                    width: 4,
                  ),
                  Text(
                    "3.25 km away",
                    style: CustomThemes.greyColor99TextStyle(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const CustomDivider(
            height: 2,
          ),
          AgentDetails(
              path: SvgPath.speedoMeter,
              title: LocaleKeys.allowedKilometerPerDay.tr(),
              description: "300 km/day"),
          AgentDetails(
              path: SvgPath.coins,
              title: LocaleKeys.extraKilometerCost.tr(),
              description: "0.4 SR/km"),
          AgentDetails(
              path: SvgPath.check,
              title: LocaleKeys.standardInsuranceDeductible.tr(),
              description: "2875 SR"),
          AgentDetails(
              path: SvgPath.insuranceUmbrella,
              title: LocaleKeys.fullInsurancePerDay.tr(),
              description: "15 SR"),
          const CustomDivider(
            height: 2,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hyundai Accent 2020",
                      style: CustomThemes.greyColor99TextStyle(context).copyWith(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Text(
                      "5 seater",
                      style: CustomThemes.greyColor1CTextStyle(context).copyWith(
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
                  LocaleKeys.rentNow.tr(),
                  style: CustomThemes.whiteColoTextTheme(context).copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, ScreenName.confirmRentCarScreen);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AgentDetails extends StatelessWidget {
  final String path;
  final String title;
  final String description;

  const AgentDetails({
    super.key,
    required this.path,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          path,
          width: 18.w,
          height: 18.h,
        ),
        const CustomSizedBox(
          width: 12,
        ),
        Expanded(
            child: Text(
          title,
          textAlign: TextAlign.start,
          style: CustomThemes.greyColor1CTextStyle(context).copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
          ),
        )),
        Text(
          description,
          style: CustomThemes.greyColor16TextStyle(context).copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}
