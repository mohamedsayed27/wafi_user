import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wafi_user/core/app_router/screens_name.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';
import 'package:wafi_user/core/assets_path/svg_path.dart';
import 'package:wafi_user/core/constants/extensions.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_outlined_button.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradient%20widgets.dart';

import '../../../core/app_theme/custom_themes.dart';
import '../../../core/constants/constants.dart';
import '../../widgets/reservations_widgets/location_details_container.dart';
import '../../widgets/shared_widgets/bill_details_item.dart';
import '../../widgets/shared_widgets/custom_divider.dart';
import '../../widgets/shared_widgets/gradiant_color_button.dart';

class ConfirmReservationScreen extends StatelessWidget {
  final String appBarTitle;

  const ConfirmReservationScreen({super.key, required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: CustomAppBar(
          title: appBarTitle,
          elevation: 0,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: 24.h,
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Car Location",
                style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              GradientWidget(
                gradientList: AppColors.gradientColorsList,
                child: SvgPicture.asset(
                  SvgPath.mapsLocation,
                  width: 15.w,
                  height: 18.h,
                ),
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
                    "503 Ida Ports, Abu Dhabi Emirate, Al Ain, Al Qou'",
                    style: CustomThemes.greyColor1CTextStyle(context).copyWith(
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
            height: 24,
          ),
          const CustomDivider(),
          const CustomSizedBox(
            height: 16,
          ),
          Text(
            "Payment Method",
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ).onlyDirectionalPadding(start: 16),
          const CustomSizedBox(
            height: 8,
          ),
          CustomOutlinedButton(
            borderColor: AppColors.blackColor.withOpacity(0.2),
            borderRadius: 4.r,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            foregroundColor: AppColors.blackColor,
            onPressed: () {

              Navigator.pushNamed(context, ScreenName.paymentMethodsScreen,);
            },
            child: Row(
              children: [
                SvgPicture.asset(
                  SvgPath.applePay,
                  width: 35.w,
                  height: 35.h,
                ),
                const CustomSizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    "Pay with Apple Pay",
                    style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.color1C,
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
            "Bill Details",
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ).onlyDirectionalPadding(start: 16),
          const CustomSizedBox(height: 8,),
          const BillDetailsItem(title: "Battery Service", balance: "100"),
          const CustomSizedBox(height: 2,),
          const BillDetailsItem(title: "Service Taxes", balance: "90"),
          const CustomSizedBox(height: 2,),
          const BillDetailsItem(title: "Delivery Charges", balance: "78"),
          const CustomSizedBox(height: 12,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total payable amount",
                style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "200 AED",
                style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ).symmetricPadding(horizontal: 16),
          const CustomSizedBox(
            height: 24,
          ),
          const CustomDivider(),
          const CustomSizedBox(
            height: 24,
          ),
          const CustomSizedBox(height: 171,),
          CustomGradientButton(
            borderRadius: 4,
            child: Text(
              "Confirm",
              style:
              CustomThemes.whiteColoTextTheme(context).copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, ScreenName.servicesCartScreen,arguments:"Services Titles");
            },
          ).symmetricPadding(horizontal:16)
        ],
      ),
    );
  }
}

