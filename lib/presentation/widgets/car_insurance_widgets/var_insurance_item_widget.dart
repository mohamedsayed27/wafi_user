import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';
import 'package:wafi_user/core/app_theme/custom_themes.dart';
import 'package:wafi_user/core/assets_path/svg_path.dart';
import 'package:wafi_user/presentation/widgets/main_layout_widgets/bottom_nav_bar_icon.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_divider.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';

import '../../widgets/orders_container/ordrs_container.dart';
import '../../widgets/shared_widgets/gradiant_color_button.dart';
import 'insurance_widget.dart';


class CarsWidget extends StatefulWidget {
  final bool isInsurance;

  const CarsWidget({super.key, required this.isInsurance});

  @override
  State<CarsWidget> createState() => _CarsWidgetState();
}

class _CarsWidgetState extends State<CarsWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 400,
      ),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    );
    // animationController.forward();
    super.initState();
  }

  bool isViewMore = false;
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return OrdersContainer(
      outContainerColor: AppColors.primaryColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                height: 64.h,
                width: 64.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    8.r,
                  ),
                  color: AppColors.borderColor,
                ),
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  SvgPath.bmw,
                  width: 48.w,
                  height: 48.h,
                ),
              ),
              const CustomSizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "2015",
                      style: CustomThemes.greyColor99TextStyle(context)
                          .copyWith(
                          fontSize: 12.sp, fontWeight: FontWeight.w700),
                    ),
                    GradientText(
                      "Audi Q3",
                      colors: AppColors.gradientColorsList,
                    ),
                    Text(
                      "UAE",
                      style: CustomThemes.greyColor99TextStyle(context)
                          .copyWith(
                          fontSize: 14.sp, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              if (widget.isInsurance)
                SvgPicture.asset(
                  SvgPath.protection,
                  width: 32.w,
                  height: 32.h,
                  colorFilter: const ColorFilter.mode(
                    AppColors.successCompletedOrderColor,
                    BlendMode.srcIn,
                  ),
                ),
            ],
          ),
          const CustomSizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 6.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      8.r,
                    ),
                    color: AppColors.borderColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Plate Number",
                        style: CustomThemes.greyColor99TextStyle(context)
                            .copyWith(
                            fontSize: 12.sp, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "12345678",
                        style: CustomThemes.greyColor1CTextStyle(context)
                            .copyWith(
                            fontSize: 14.sp, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
              const CustomSizedBox(
                width: 16,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 6.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      8.r,
                    ),
                    color: AppColors.borderColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Model",
                        style: CustomThemes.greyColor99TextStyle(context)
                            .copyWith(
                            fontSize: 12.sp, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "SUV",
                        style: CustomThemes.greyColor1CTextStyle(context)
                            .copyWith(
                            fontSize: 14.sp, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const CustomSizedBox(
            height: 8,
          ),
          const CustomDivider(
            height: 1.2,
          ),
          const CustomSizedBox(
            height: 8,
          ),
          SizeTransition(
            axisAlignment: 1.0,
            sizeFactor: animation,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BottomNavBarIcon(
                      label: "Policy",
                      iconPath: SvgPath.insuranceExistingCars,
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                      isSelected: selectedIndex == 1,
                    ),
                    BottomNavBarIcon(
                        label: "Quotes",
                        iconPath: SvgPath.billExistingCars,
                        onTap: () {
                          setState(() {
                            selectedIndex = 2;
                          });
                        },
                        isSelected: selectedIndex == 2),
                    BottomNavBarIcon(
                        label: "Sadad Bills",
                        iconPath: SvgPath.invoiceExistingCars,
                        onTap: () {
                          setState(() {
                            selectedIndex = 3;
                          });
                        },
                        isSelected: selectedIndex == 3),
                    BottomNavBarIcon(
                        label: "History",
                        iconPath: SvgPath.historyExistingCars,
                        onTap: () {
                          setState(() {
                            selectedIndex = 4;
                          });
                        },
                        isSelected: selectedIndex == 4),
                  ],
                ),
                const OrdersContainer(
                  outContainerColor: AppColors.primaryColor,
                  innerContainerColor: AppColors.greyColorD8,
                  child: InsuranceTypeContainerWidget(),
                ),
              ],
            ),
          ),
          const CustomSizedBox(
            height: 16,
          ),
          widget.isInsurance?CustomGradientButton(
            onPressed: () {
              if(isViewMore){
                animationController.reverse();
                isViewMore = false;
                setState(() {

                });
              }else{
                animationController.forward();
                isViewMore = true;
                setState(() {

                });
              }
            },
            // height: 40,
            borderRadius: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "View Details",
                  style: CustomThemes.whiteColoTextTheme(context).copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const CustomSizedBox(width: 8,),
                AnimatedRotation(turns: isViewMore?0.5:0, duration: const Duration(milliseconds: 500),child: const Icon(Icons.keyboard_double_arrow_down,color: AppColors.whiteColor,),)
              ],
            ),
          ):CustomGradientButton(
            onPressed: () {},
            // height: 40,
            borderRadius: 8,
            child: Text(
              "Puchase Insurance Now",
              style: CustomThemes.whiteColoTextTheme(context).copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}