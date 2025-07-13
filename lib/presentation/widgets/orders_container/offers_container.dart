import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:wafi_user/core/assets_path/images_path.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_outlined_button.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradiant_color_button.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../widgets/orders_container/ordrs_container.dart';
import '../../widgets/shared_widgets/custom_divider.dart';

class PastContainer extends StatefulWidget {
  const PastContainer({
    super.key,
  });

  @override
  State<PastContainer> createState() => _PastContainerState();
}

class _PastContainerState extends State<PastContainer> with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> animation;

  @override
  void initState() {
    prepareAnimations();
    super.initState();
  }

  bool isExpanded = false;

  void prepareAnimations() {
    expandController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
  }

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
              Row(
                children: [
                  Container(
                    height: 41.h,
                    width: 41.w,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
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
                    "Vendor 1",
                    style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Offered Price",
                    style: CustomThemes.greyColor99TextStyle(context).copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const CustomSizedBox(
                    height: 4,
                  ),
                  Text(
                    "250 SAR",
                    style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.successCompletedOrderColor,
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
            height: 1.5,
          ),
          const CustomSizedBox(
            height: 12,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Drop off Date",
                    style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Offered Parts: 4",
                    style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const CustomSizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dec 16, 2020",
                    style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (isExpanded) {
                        expandController.reverse();
                        isExpanded = false;
                        setState(() {});
                      } else {
                        expandController.forward();
                        isExpanded = true;
                        setState(() {});
                      }
                    },
                    child: GradientText(
                      isExpanded ? "View Less" : "View Details",
                      colors: AppColors.gradientColorsList,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          const CustomSizedBox(
            height: 12,
          ),
          const CustomDivider(
            height: 1.5,
          ),
          const CustomSizedBox(
            height: 12,
          ),
          SizeTransition(
            axisAlignment: 1.0,
            sizeFactor: animation,
            child: Column(
              children: [
                const OfferCheckItem(),
                const CustomSizedBox(
                  height: 12,
                ),
                const OfferCheckItem(),
                const CustomSizedBox(
                  height: 12,
                ),
                const OfferCheckItem(),
                const CustomSizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Price:",
                      style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: CustomThemes.greyColor1CTextStyle(context).color!.withOpacity(0.8),
                      ),
                    ),
                    Text(
                      "250.00 SAR",
                      style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: CustomThemes.greyColor1CTextStyle(context).color!.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const CustomSizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                child: CustomOutlinedButton(
                  borderColor: AppColors.primaryColor,
                  height: 40,
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  borderRadius: 8,
                  child: Text(
                    "Reject Offer",
                    style: CustomThemes.primaryTextStyle(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const CustomSizedBox(
                width: 12,
              ),
              Expanded(
                child: CustomGradientButton(
                  onPressed: () {},
                  height: 40,
                  borderRadius: 8,
                  child: Text(
                    "Accept Offer",
                    style: CustomThemes.whiteColoTextTheme(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OfferCheckItem extends StatefulWidget {
  const OfferCheckItem({super.key});

  @override
  State<OfferCheckItem> createState() => _OfferCheckItemState();
}

class _OfferCheckItemState extends State<OfferCheckItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
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
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            },
            visualDensity: const VisualDensity(
                horizontal: VisualDensity.maximumDensity, vertical: VisualDensity.maximumDensity),
            focusColor: AppColors.whiteColor,
            fillColor: WidgetStateProperty.all(
              isChecked ? Colors.transparent : AppColors.whiteColor,
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
          width: 14,
        ),
        Text(
          "Tyre Rim X 2",
          style: CustomThemes.greyColor1CTextStyle(context).copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: CustomThemes.greyColor1CTextStyle(context).color!.withOpacity(0.6),
          ),
        ),
        const Spacer(),
        Text(
          "50.00 SAR",
          style: CustomThemes.greyColor1CTextStyle(context).copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: CustomThemes.greyColor1CTextStyle(context).color!.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}
