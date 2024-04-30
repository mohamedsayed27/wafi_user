import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:wafi_user/core/app_router/screens_name.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';
import 'package:wafi_user/core/assets_path/images_path.dart';
import 'package:wafi_user/core/assets_path/svg_path.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_drop_down_button.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradient_svg.dart';
import 'package:wafi_user/translations/locale_keys.g.dart';

import '../../../core/app_theme/custom_themes.dart';
import '../../../core/constants/constants.dart';
import '../../widgets/car_rent_widgets/car_rent_date_time_picker_dialog.dart';
import '../../widgets/shared_widgets/gradiant_color_button.dart';

class SearchToRentCarScreen extends StatefulWidget {
  const SearchToRentCarScreen({super.key});

  @override
  State<SearchToRentCarScreen> createState() => _SearchToRentCarScreenState();
}

class _SearchToRentCarScreenState extends State<SearchToRentCarScreen> {
  String? value;
  List<String> items = [
    "Cairo",
    "Giza",
    "Alexandria",
  ];

  bool isPickUpChecked = false;
  bool isDeliverChecked = false;

  List<Map<String, dynamic>> carsList = [
    {"image": ImagesPath.all, "title": "All Types"},
    {"image": ImagesPath.car1, "title": "Economy"},
    {"image": ImagesPath.car2, "title": "Economy"},
  ];
  int? selectedIndex;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child: CustomAppBar(title: LocaleKeys.rentACar.tr())),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 24.h),
        children: [
          Text(
            LocaleKeys.servicesAdded.tr(),
            style: CustomThemes.greyColor16TextStyle(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
          CustomSizedBox(height: 8,),
          CustomDropDownButton(
            hintText: LocaleKeys.selectCity.tr(),
            onChanged: (value) {
              setState(() {
                this.value = value;
              });
            },
            items: items.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e),
              );
            }).toList(),
            value: value,
          ),
          CustomSizedBox(height: 8,),
          Row(
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.r),
                  gradient: LinearGradient(
                    colors: AppColors.gradientColorsList,
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                  ),
                ),
                alignment: Alignment.center,
                child: Checkbox(
                  value: isPickUpChecked,
                  onChanged: (value) {
                    setState(() {
                      isPickUpChecked = value!;
                    });
                  },
                  visualDensity: const VisualDensity(
                      horizontal: VisualDensity.maximumDensity,
                      vertical: VisualDensity.maximumDensity),
                  focusColor: AppColors.whiteColor,
                  fillColor: MaterialStateProperty.all(
                    isPickUpChecked ? Colors.transparent : AppColors.whiteColor,
                  ),
                  checkColor: AppColors.whiteColor,
                  side: const BorderSide(color: AppColors.whiteColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.r),
                    side: const BorderSide(color: AppColors.whiteColor),
                  ),
                ),
              ),
              const CustomSizedBox(
                width: 8,
              ),
              Text(
                LocaleKeys.pickUpAtAirport.tr(),
                style: CustomThemes.greyColor16TextStyle(context).copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
          CustomSizedBox(height: 16,),
          Text(
            LocaleKeys.selectDateTime.tr(),
            style: CustomThemes.greyColor16TextStyle(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
          CustomSizedBox(height: 8,),
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (_) => CarRentDateTimePickerDialog(),);
            },
            child: Ink(
              height: 48.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.greyColor9,
                ),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.selectDateAndTime.tr(),
                    style: CustomThemes.greyColor99TextStyle(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  GradientSvg(
                    svgPath: SvgPath.dummySvgImage,
                    height: 20.h,
                    width: 20.w,
                  ),
                ],
              ),
            ),
          ),
          CustomSizedBox(height: 16,),
          Text(
            LocaleKeys.selectVehicleType.tr(),
            style: CustomThemes.greyColor16TextStyle(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
          CustomSizedBox(height: 8,),
          SizedBox(
            height: 100.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(vertical: 2.h),
              itemCount: carsList.length,
              itemBuilder: (_, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    padding: EdgeInsets.symmetric(
                      horizontal: 1.w,
                      vertical: 1.h,
                    ),
                    decoration: BoxDecoration(
                      color:
                          selectedIndex == index ? null : AppColors.greyColor9,
                      borderRadius: BorderRadius.circular(4.r),
                      gradient: selectedIndex == index
                          ? LinearGradient(
                              colors: AppColors.gradientColorsList,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )
                          : null,
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffF5F5F5).withOpacity(.99),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            carsList[index]["image"],
                            height: 40.h,
                            width: index == 0 ? 150.w : 78.w,
                            fit: BoxFit.scaleDown,
                          ),
                          Text(
                            carsList[index]["title"],
                            style: CustomThemes.greyColor16TextStyle(context)
                                .copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ],
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
            ),
          ),
          CustomSizedBox(height: 8,),
          Row(
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.r),
                  gradient: LinearGradient(
                    colors: AppColors.gradientColorsList,
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                  ),
                ),
                alignment: Alignment.center,
                child: Checkbox(
                  value: isDeliverChecked,
                  onChanged: (value) {
                    setState(() {
                      isDeliverChecked = value!;
                    });
                  },
                  visualDensity: const VisualDensity(
                      horizontal: VisualDensity.maximumDensity,
                      vertical: VisualDensity.maximumDensity),
                  focusColor: AppColors.whiteColor,
                  fillColor: MaterialStateProperty.all(
                    isDeliverChecked
                        ? Colors.transparent
                        : AppColors.whiteColor,
                  ),
                  checkColor: AppColors.whiteColor,
                  side: const BorderSide(color: AppColors.whiteColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.r),
                    side: const BorderSide(color: AppColors.whiteColor),
                  ),
                ),
              ),
              const CustomSizedBox(
                width: 8,
              ),
              Text(
                LocaleKeys.deliverCarToYou.tr(),
                style: CustomThemes.greyColor16TextStyle(context).copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
          CustomSizedBox(height: 48,),
          CustomGradientButton(
            borderRadius: 6,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.search.tr(),
                  style:
                  CustomThemes.whiteColoTextTheme(context).copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Icon(Icons.arrow_forward_ios,size: 18.r,color: AppColors.whiteColor,),
              ],
            ),
            onPressed: () {
              Navigator.pushNamed(context, ScreenName.filteredRentCarScreen);
            },
          ),
        ],
      ),
    );
  }

}
