import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';
import 'package:wafi_user/core/app_theme/custom_themes.dart';
import 'package:wafi_user/core/assets_path/svg_path.dart';
import 'package:wafi_user/core/constants/extensions.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_divider.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradient_svg.dart';

import '../../../core/constants/constants.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: const CustomAppBar(
          title: "Payment Options",
          elevation: 0,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 8.h,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: AppColors.gradientColorsList,
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
              ),
              borderRadius: BorderRadius.circular(
                8.r,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Wallet Balance",
                  style: CustomThemes.whiteColoTextTheme(context).copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const CustomSizedBox(
                  height: 8,
                ),
                Text(
                  "250.00 SAR",
                  style: CustomThemes.whiteColoTextTheme(context).copyWith(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ).symmetricPadding(horizontal: 16),
          const CustomSizedBox(
            height: 24,
          ),
          Ink(
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(2, 4.h),
                    blurRadius: 8.r,
                    color: AppColors.shadowColor(value: 0.07),
                  ),
                  BoxShadow(
                    offset: Offset(-2, -4.h),
                    blurRadius: 8.r,
                    color: AppColors.shadowColor(value: 0.07),
                  )
                ]),
            child: ListTile(
              onTap: () {},
              leading: Text(
                "Saved Cards",
                style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 22.r,
                color: AppColors.color1C,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ).symmetricPadding(horizontal: 16),
          const CustomSizedBox(
            height: 24,
          ),
          Text(
            "Recent Transactions",
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ).onlyDirectionalPadding(start: 16),
          const CustomSizedBox(
            height: 24,
          ),
          CustomDivider(
            height: 30.h,
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "31 July 2021",
              textAlign: TextAlign.start,
              style: CustomThemes.greyColor99TextStyle(context).copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
              ),
            ).onlyDirectionalPadding(start: 16),
          ),
          Expanded(
            child: ListView.separated(
              padding:EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
              itemBuilder: (_, index) => ItemWidget(),
              separatorBuilder: (_, index) => CustomSizedBox(
                height: 16,
              ),
              itemCount: 4,
            ),
          ),
        ],
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "20.00 SAR",
            style: TextStyle(
                color: AppColors.successCompletedOrderColor,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
                height: 1),
          ),
          const CustomSizedBox(
            height: 8,
          ),
          Text(
            "Closing Balance: AED 50",
            style: CustomThemes.greyColor99TextStyle(context).copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 10.sp,
            ),
          )
        ],
      ),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Money Refund",
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                fontWeight: FontWeight.w700, fontSize: 16.sp, height: 1),
          ),
          const CustomSizedBox(
            height: 8,
          ),
          Text(
            "Closing Balance: AED 50",
            style: CustomThemes.greyColor99TextStyle(context).copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 10.sp,
            ),
          )
        ],
      ),
      leading: GradientSvg(
        svgPath: SvgPath.wallet,
        width: 22.w,
        height: 22.h,
      ),
    );
  }
}
