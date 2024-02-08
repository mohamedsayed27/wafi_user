import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_theme/custom_themes.dart';
import 'package:wafi_user/presentation/widgets/orders_container/ordrs_container.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_divider.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';

import '../../../core/app_theme/app_colors.dart';
import '../shared_widgets/custom_outlined_button.dart';


class PastContainer extends StatelessWidget {
  final bool completed;
  final bool isRated;

  const PastContainer({
    super.key,
    required this.completed,
    required this.isRated,
  });

  @override
  Widget build(BuildContext context) {
    return OrdersContainer(
      outContainerColor: AppColors.primaryColor,
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
                      color: !completed
                          ? AppColors.primaryColor.withOpacity(0.2)
                          : AppColors.successCompletedOrderColor
                          .withOpacity(0.2),
                    ),
                    child: Text(
                      completed ? "Completed" : "Canceled",
                      style: !completed
                          ? CustomThemes.primaryTextStyle(context).copyWith(
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
              if (completed&&!isRated)
                CustomOutlinedButton(
                  borderColor: AppColors.color1C,
                  borderRadius: 8,
                  onPressed: () {},
                  width: 135,
                  height: 40,
                  child: Text(
                    "Rate Agent",
                    style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              if (completed&&isRated)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Text(
                      "Your agent rating",
                      style: CustomThemes.greyColor99TextStyle(context).copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    Row(
                      children: [
                        const Icon(Icons.star,color: AppColors.color1C,),
                        Text(
                          "4.5",
                          style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    )
                  ],
                )
            ],
          ),
        ],
      ),
    );
  }
}
