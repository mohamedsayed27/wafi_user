import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wafi_user/core/constants/extensions.dart';

import '../../../core/app_router/screens_name.dart';
import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/svg_path.dart';
import '../../../core/constants/constants.dart';
import '../../widgets/shared_widgets/bill_details_item.dart';
import '../../widgets/shared_widgets/custom_app_bar.dart';
import '../../widgets/shared_widgets/custom_divider.dart';
import '../../widgets/shared_widgets/custom_outlined_button.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';
import '../../widgets/shared_widgets/gradiant_color_button.dart';

class InsurancePaymentScreen extends StatelessWidget {
  const InsurancePaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: const CustomAppBar(
          title: "Cart",
        ),
      ),
      body: ListView(
        children: [
          TitleBodyTextColumn(title: "Insurance Company", body: "Qatar Insurance Company"),
          CustomSizedBox(height: 16,),
          TitleBodyTextColumn(title: "Insurance Type", body: "Comprehensive Insurance"),
          CustomSizedBox(height: 16,),
          TitleBodyTextColumn(title: "Policy Effective Date", body: "#1254588465"),
          const CustomSizedBox(height: 16,),
          const CustomDivider(),
          ListTile(
            leading: SvgPicture.asset(SvgPath.badge,width: 20.w,height: 20.h,),
            title: Text(
              "Apply Promocode",
              style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios,size: 18.sp,),
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
                  SvgPath.applePay,
                  width: 35.w,
                  height: 35.h,
                  colorFilter: const ColorFilter.mode(AppColors.greyColor9, BlendMode.srcIn),
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
              ],
            ),
          ).symmetricPadding(horizontal: 16),

          const CustomSizedBox(
            height: 16,
          ),
          const CustomDivider(height: 3),
          const CustomSizedBox(height: 16,),
          Text(
            "Bill Details",
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ).onlyDirectionalPadding(start: 16),
          const CustomSizedBox(height: 8,),
          const BillDetailsItem(title: "Car Insurance", balance: "100",),
          const CustomSizedBox(height: 2,),
          const BillDetailsItem(title: "Personal Accident Cover", balance: "90",),
          const CustomSizedBox(height: 2,),
          const BillDetailsItem(title: "Total payable amount", balance: "90",),
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
                      "Continue",
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
          ).symmetricPadding(horizontal: 16)
        ],
      ),
    );
  }
}

class TitleBodyTextColumn extends StatelessWidget {
  final String title;
  final String body;

  const TitleBodyTextColumn(
      {super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: CustomThemes.greyColor1CTextStyle(context).copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        CustomSizedBox(
          height: 12,
        ),
        Text(
          body,
          style: CustomThemes.greyColor75TextStyle(context).copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ).symmetricPadding(horizontal: 16);
  }
}
