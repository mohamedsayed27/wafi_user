import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:wafi_user/core/assets_path/fonts_path.dart';
import 'package:wafi_user/core/assets_path/images_path.dart';
import 'package:wafi_user/core/constants/extensions.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradient_svg.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/svg_path.dart';
import '../../../core/constants/constants.dart';
import '../../widgets/reservation_screen_widget/order_cancelation_dialog.dart';
import '../../widgets/reservation_screen_widget/stepper_item_widget.dart';
import '../../widgets/reservations_widgets/location_details_container.dart';
import '../../widgets/shared_widgets/bill_details_item.dart';
import '../../widgets/shared_widgets/custom_app_bar.dart';
import '../../widgets/shared_widgets/custom_divider.dart';
import '../../widgets/shared_widgets/custom_outlined_button.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';
import '../../widgets/shared_widgets/dashed_separator.dart';
import '../../widgets/shared_widgets/gradiant_color_button.dart';
import '../../widgets/shared_widgets/gradient widgets.dart';

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
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: const CustomAppBar(
          title: "Order ID : S5D2S45E5",
          elevation: 0,
        ),
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
                const Icon(Icons.check_circle,color: AppColors.whiteColor,size: 20),
                const CustomSizedBox(width: 8,),
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
                "Car Location",
                style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              GradientWidget(
                gradientList: AppColors.gradientColorsList,
                child: SvgPicture.asset(
                  SvgPath.dummySvgImage,
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
            "Driver Details",
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
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
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
                      svgPath: SvgPath.dummySvgImage,
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
            "Car Location",
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
                    child:
                        const MySeparator().symmetricPadding(horizontal: 50)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StepperWidget(
                      isSelected: currentIndex > 0,
                      title: "Provider recieved order",
                      width: 86,
                      svgIcon: SvgPath.dummySvgImage,
                    ),
                    StepperWidget(
                      isSelected: currentIndex > 1,
                      title: "Provider is on the way",
                      width: 71,
                      svgIcon: SvgPath.dummySvgImage,
                    ),
                    StepperWidget(
                      isSelected: currentIndex > 2,
                      title: "Service has been completed",
                      width: 95,
                      svgIcon: SvgPath.dummySvgImage,
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
            "Driver Details",
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
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
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
                  onPressed: () {},
                  child: Text(
                    "Rate Agent",
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
            onPressed: () {},
            child: Row(
              children: [
                SvgPicture.asset(
                  SvgPath.dummySvgImage,
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
          const CustomSizedBox(
            height: 8,
          ),
          const BillDetailsItem(title: "Battery Service", balance: "100"),
          const CustomSizedBox(
            height: 2,
          ),
          const BillDetailsItem(title: "Service Taxes", balance: "90"),
          const CustomSizedBox(
            height: 2,
          ),
          const BillDetailsItem(title: "Delivery Charges", balance: "78"),
          const CustomSizedBox(
            height: 12,
          ),
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
          CustomOutlinedButton(
            borderColor: AppColors.primaryColor,
            borderRadius: 4.r,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            foregroundColor: AppColors.primaryColor,
            onPressed: () {
              showDialog(context: context, builder: (_)=>OrderCancelDialog());
            },
            child: Text(
              "Cancel Booking",
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
            onPressed: () {
            },
            child: Text(
              "Rate Agent",
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


