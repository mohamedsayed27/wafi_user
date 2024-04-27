import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wafi_user/core/app_router/screens_name.dart';
import 'package:wafi_user/core/assets_path/svg_path.dart';
import 'package:wafi_user/core/constants/extensions.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_divider.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradient_svg.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/constants/constants.dart';
import '../../widgets/reservations_widgets/location_details_container.dart';
import '../../widgets/shared_widgets/bill_details_item.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';
import '../../widgets/shared_widgets/gradiant_color_button.dart';
import '../../widgets/shared_widgets/gradient widgets.dart';

class ServicesCartScreen extends StatelessWidget {
  final String servicesType;
  const ServicesCartScreen({super.key, required this.servicesType,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: const CustomAppBar(
          title: "Cart",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Drop off Address",
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
            const CustomSizedBox(height: 8,),
            DetailsContainer(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "503 Ida Ports, Abu Dhabi Emirate, Al Ain, Al Qou'",
                      style:
                          CustomThemes.greyColor1CTextStyle(context).copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: CustomThemes.greyColor1CTextStyle(context)
                            .color!
                            .withOpacity(0.8),
                      ),
                    ),
                  ),
                  const CustomSizedBox(
                    width: 16,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: GradientWidget(
                      gradientList: AppColors.gradientColorsList,
                      isGradient: true,
                      child: Text(
                        "Change",
                        style:
                            CustomThemes.whiteColoTextTheme(context).copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ).symmetricPadding(horizontal: 16),
            const CustomSizedBox(height: 16,),
            const CustomDivider(),
            const CustomSizedBox(height: 16,),
            Text(
              "Services added",
              style: CustomThemes.greyColor16TextStyle(context).copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ).onlyDirectionalPadding(start: 16),

            const CustomSizedBox(height: 8,),
            Row(
              children: [
                GradientSvg(
                  svgPath: SvgPath.carRepair,
                  height: 40.h,
                  width: 40.w,
                ),
                const CustomSizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        servicesType,
                        style:
                            CustomThemes.greyColor1CTextStyle(context).copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Mechanical Check-Up",
                        style:
                            CustomThemes.greyColor99TextStyle(context).copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  SvgPath.delete,
                  height: 20.h,
                  width: 18.w,
                ),
              ],
            ).symmetricPadding(horizontal: 16),
            const CustomSizedBox(height: 16,),
            const CustomDivider(),
            const CustomSizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Select Preferred Date",
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
                    onPressed: (){
                      showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime.now().add(const Duration(days: 365,),),);
                    },
                    style: IconButton.styleFrom(padding: EdgeInsets.zero,),
                    icon: GradientSvg(
                      svgPath: SvgPath.calendar
                      ,
                      height: 18.h,
                      width: 15.w,
                    ),
                  ),
                ),
              ],
            ).symmetricPadding(horizontal: 16),
            const CustomSizedBox(height: 8,),
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
                    Text(
                      "Today",
                      style:
                          CustomThemes.greyColor1CTextStyle(context).copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "26 Nov",
                      style:
                          CustomThemes.greyColor1CTextStyle(context).copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ).onlyDirectionalPadding(start: 16),
            const CustomSizedBox(height: 16,),
            Text(
              "Select Preferred Time",
              style: CustomThemes.greyColor16TextStyle(context).copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ).onlyDirectionalPadding(start: 16),
            const CustomSizedBox(height: 8,),
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
                onTap: (){
                  showTimePicker(context: context, initialTime: TimeOfDay.now());
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
                        "26 Nov",
                        style:
                        CustomThemes.greyColor1CTextStyle(context).copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down,size: 18.r,),
                    ],
                  ),
                ),
              ),
            ).symmetricPadding(horizontal: 16),
            const CustomSizedBox(height: 16,),
            const CustomDivider(),
            const CustomSizedBox(height: 16,),
            Text(
              "Bill Details",
              style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ).onlyDirectionalPadding(start: 16),
            const CustomSizedBox(height: 8,),
            const BillDetailsItem(title: "Battery Service", balance: "100",),
            const CustomSizedBox(height: 2,),
            const BillDetailsItem(title: "Service Taxes", balance: "90",),
            const CustomSizedBox(height: 2,),
            const CustomSizedBox(height: 16,),
            const CustomDivider(),
            const CustomSizedBox(height: 24,),
            CustomGradientButton(
              borderRadius: 4,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "150 SAR",
                    style:
                    CustomThemes.whiteColoTextTheme(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Buy Now",
                        style:
                        CustomThemes.whiteColoTextTheme(context).copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios,size: 18.r,color: AppColors.whiteColor,),
                    ],
                  ),
                ],
              ),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, ScreenName.mainLayoutScreen, (route) => false,);
              },
            ).symmetricPadding(horizontal:16)
          ],
        ),
      ),
    );
  }
}
