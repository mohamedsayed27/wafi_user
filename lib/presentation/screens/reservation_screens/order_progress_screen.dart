import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/app_router/screens_name.dart';
import '../../../core/assets_path/images_path.dart';
import '../../../core/constants/extensions.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/svg_path.dart';
import '../../../core/constants/constants.dart';
import '../../../translations/locale_keys.g.dart';
import '../../widgets/reservation_screen_widget/order_cancelation_dialog.dart';
import '../../widgets/reservation_screen_widget/stepper_item_widget.dart';
import '../../widgets/reservations_widgets/location_details_container.dart';
import '../../widgets/shared_widgets/bill_details_item.dart';
import '../../widgets/shared_widgets/custom_app_bar.dart';
import '../../widgets/shared_widgets/custom_divider.dart';
import '../../widgets/shared_widgets/custom_outlined_button.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';
import '../../widgets/shared_widgets/dashed_separator.dart';
import '../../widgets/shared_widgets/gradient widgets.dart';
import '../../widgets/shared_widgets/gradient_svg.dart';

class OrderProgressScreen extends StatefulWidget {
  const OrderProgressScreen({super.key});

  @override
  State<OrderProgressScreen> createState() => _OrderProgressScreenState();
}

class _OrderProgressScreenState extends State<OrderProgressScreen> {
  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "${LocaleKeys.orderID.tr()} : S5D2S45E5",
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: 24.h,
        ),
        children: [
          Container(
            height: 32.h,
            width: double.infinity,
            color: AppColors.successCompletedOrderColor,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                const Icon(Icons.check_circle, color: AppColors.whiteColor, size: 20),
                const CustomSizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    "Completed successfully on Dec 05, 2020",
                    style: CustomThemes.whiteColoTextTheme(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const CustomSizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.carLocation.tr(),
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
            height: 24,
          ),
          const CustomDivider(),
          const CustomSizedBox(
            height: 16,
          ),
          Text(
            LocaleKeys.driverDetails.tr(),
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ).onlyDirectionalPadding(start: 16),
          const CustomSizedBox(
            height: 8,
          ),
          DetailsContainer(
            child: Row(
              children: [
                Container(
                  height: 40.h,
                  width: 40.w,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    ImagesPath.userNullImage,
                    fit: BoxFit.cover,
                  ),
                ),
                const CustomSizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lagon Taylor",
                        style:
                            CustomThemes.greyColor1CTextStyle(context).copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: CustomThemes.greyColor1CTextStyle(context)
                              .color!
                              .withOpacity(0.8),
                        ),
                      ),
                      const CustomSizedBox(
                        height: 5,
                      ),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 15.r,
                        itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 32.h,
                  width: 32.w,
                  child: IconButton(
                    onPressed: () {},
                    style: IconButton.styleFrom(padding: EdgeInsets.zero),
                    icon: GradientSvg(
                      svgPath: SvgPath.phone,
                      height: 32.h,
                      width: 32.w,
                    ),
                  ),
                )
              ],
            ),
          ).symmetricPadding(horizontal: 16),
          const CustomSizedBox(
            height: 24,
          ),
          Text(
            LocaleKeys.carLocation.tr(),
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ).onlyDirectionalPadding(start: 16),
          const CustomSizedBox(
            height: 8,
          ),
          DetailsContainer(
            child: Stack(
              children: [
                Positioned(
                    top: 20.h,
                    left: 0,
                    right: 0,
                    child: const MySeparator().symmetricPadding(horizontal: 50)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StepperWidget(
                      isSelected: currentIndex > 0,
                      title: LocaleKeys.roviderReceivedOrder.tr(),
                      width: 86,
                      svgIcon: SvgPath.confirmation,
                    ),
                    StepperWidget(
                      isSelected: currentIndex > 1,
                      title: LocaleKeys.providerIsOnTheWay.tr(),
                      width: 71,
                      svgIcon: SvgPath.pointer,
                    ),
                    StepperWidget(
                      isSelected: currentIndex > 2,
                      title: LocaleKeys.serviceHasBeenCompleted.tr(),
                      width: 95,
                      svgIcon: SvgPath.progressCheck,
                    ),
                  ],
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
            LocaleKeys.driverDetails.tr(),
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ).onlyDirectionalPadding(start: 16),
          const CustomSizedBox(
            height: 8,
          ),
          DetailsContainer(
            child: Row(
              children: [
                Container(
                  height: 40.h,
                  width: 40.w,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    ImagesPath.userNullImage,
                    fit: BoxFit.cover,
                  ),
                ),
                const CustomSizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lagon Taylor",
                        style:
                            CustomThemes.greyColor1CTextStyle(context).copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: CustomThemes.greyColor1CTextStyle(context)
                              .color!
                              .withOpacity(0.8),
                        ),
                      ),
                      const CustomSizedBox(
                        height: 5,
                      ),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 15.r,
                        itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      )
                    ],
                  ),
                ),
                CustomOutlinedButton(
                  borderColor: AppColors.primaryColor,
                  borderRadius: 4.r,
                  backgroundColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  foregroundColor: AppColors.primaryColor,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      ScreenName.reviewScreen,
                    );
                  },
                  child: Text(
                    LocaleKeys.rateAgent.tr(),
                    style: CustomThemes.primaryTextStyle(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
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
            LocaleKeys.paymentMethod.tr(),
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
              Navigator.pushNamed(
                context,
                ScreenName.paymentMethodsScreen,
              );
            },
            child: Row(
              children: [
                SvgPicture.asset(
                  SvgPath.applePay,
                  width: 35.w,
                  height: 35.h,
                ),
                const CustomSizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Text(
                    LocaleKeys.payWithApplePay.tr(),
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
            LocaleKeys.payWithApplePay.tr(),
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ).onlyDirectionalPadding(start: 16),
          const CustomSizedBox(
            height: 8,
          ),
          BillDetailsItem(
            title: LocaleKeys.batteryService.tr(),
            balance: "100",
          ),
          const CustomSizedBox(
            height: 2,
          ),
          BillDetailsItem(
            title: LocaleKeys.serviceTaxes.tr(),
            balance: "90",
          ),
          const CustomSizedBox(
            height: 2,
          ),
          const BillDetailsItem(
            title: "Delivery Charges",
            balance: "78",
          ),
          const CustomSizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.totalPayableAmount.tr(),
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
          CustomOutlinedButton(
            borderColor: AppColors.primaryColor,
            borderRadius: 4.r,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            foregroundColor: AppColors.primaryColor,
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => const OrderCancelDialog(),
              );
            },
            child: Text(
              LocaleKeys.cancelBooking.tr(),
              style: CustomThemes.primaryTextStyle(context).copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ).symmetricPadding(horizontal: 16),
          const CustomSizedBox(
            height: 8,
          ),
          CustomOutlinedButton(
            borderColor: AppColors.primaryColor,
            borderRadius: 4.r,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            foregroundColor: AppColors.primaryColor,
            onPressed: () {},
            child: Text(
              LocaleKeys.rateAgent.tr(),
              style: CustomThemes.primaryTextStyle(context).copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ).symmetricPadding(horizontal: 16),
          const CustomSizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
