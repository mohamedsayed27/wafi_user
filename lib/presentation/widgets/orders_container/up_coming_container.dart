import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:wafi_user/core/app_theme/custom_themes.dart';
import 'package:wafi_user/core/assets_path/images_path.dart';
import 'package:wafi_user/presentation/widgets/orders_container/ordrs_container.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_divider.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradiant_color_button.dart';

import '../../../core/app_theme/app_colors.dart';


class UpComingContainer extends StatelessWidget {
  final bool confirmed;
  final bool confirmedWithAgent;

  const UpComingContainer({
    super.key,
    required this.confirmed,
    required this.confirmedWithAgent,
  });

  @override
  Widget build(BuildContext context) {
    return OrdersContainer(
      outContainerColor: confirmed
          ? AppColors.primaryColor
          : AppColors.successCompletedOrderColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Spare Parts",
                    style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const CustomSizedBox(
                    height: 4,
                  ),
                  Text(
                    "Order ID: 547854",
                    style: CustomThemes.greyColor99TextStyle(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 7.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: confirmed
                          ? AppColors.dashedBorderColor.withOpacity(0.2)
                          : AppColors.successCompletedOrderColor
                          .withOpacity(0.2),
                    ),
                    child: Text(
                      confirmed ? "Confirmed" : "Quotations",
                      style: confirmed
                          ? CustomThemes.darkGrayColorTheme(context).copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      )
                          : CustomThemes.greyColor1CTextStyle(context).copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.successCompletedOrderColor,
                      ),
                    ),
                  ),
                  const CustomSizedBox(
                    height: 4,
                  ),
                  Text(
                    "Order ID: 547854",
                    style: CustomThemes.greyColor99TextStyle(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const CustomSizedBox(
            height: 12,
          ),
          const CustomDivider(
            height: 1.3,
          ),
          const CustomSizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total parts",
                    style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const CustomSizedBox(
                    height: 4,
                  ),
                  Text(
                    "4 Parts",
                    style: CustomThemes.greyColor99TextStyle(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              if (!confirmed)
                CustomGradientButton(
                  onPressed: () {},
                  width: 135,
                  height: 40,
                  child: Text(
                    "View Offers",
                    style: CustomThemes.whiteColoTextTheme(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

            ],
          ),
          const CustomSizedBox(height: 12,),
          if (confirmed && confirmedWithAgent)
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 8.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.dashedBorderColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(
                  8.r,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    height: 32.h,
                    width: 32.w,
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
                  Text(
                    "Riyad Mahrez",
                    style:
                    CustomThemes.greyColor1CTextStyle(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  GradientText(
                    "Agent Assigned",
                    colors: AppColors.gradientColorsList,
                  ),
                ],
              ),
            ),
          if (confirmed && !confirmedWithAgent)
            Text(
              "An agent will be assigned soon :)",
              style: CustomThemes.greyColor99TextStyle(context).copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
        ],
      ),
    );
  }
}
