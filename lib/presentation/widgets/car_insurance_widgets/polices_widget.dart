import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradiant_color_button.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/images_path.dart';
import '../shared_widgets/custom_sized_box.dart';

class PolicesWidget extends StatelessWidget {
  final bool isExpired;
  final bool isDueForRenew;

  const PolicesWidget({
    super.key,
    this.isExpired = true,
    this.isDueForRenew = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(
          8.r,
        ),
        border: Border.all(
          color: AppColors.borderColor,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 40.h,
                      width: 40.w,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Image.asset(
                        ImagesPath.malathImage,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const CustomSizedBox(
                      width: 4,
                    ),
                    Text(
                      "Malath",
                      style:
                          CustomThemes.greyColor1CTextStyle(context).copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                const CustomSizedBox(
                  height: 5,
                ),
                Text(
                  "Referance Number",
                  style: CustomThemes.greyColor99TextStyle(context).copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                ),
                const CustomSizedBox(
                  height: 5,
                ),
                Text(
                  "#1254588465",
                  style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Expiry Date:",
                  style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                ),
                const CustomSizedBox(
                  height: 5,
                ),
                Text(
                  "12/4/2021",
                  style: CustomThemes.greyColor99TextStyle(context).copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                  ),
                ),
                const CustomSizedBox(
                  height: 5,
                ),
                if (!isExpired)
                  Text(
                    "Needs attention*",
                    style: CustomThemes.primaryTextStyle(context).copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                    ),
                  ),
                const CustomSizedBox(
                  height: 5,
                ),
                !isDueForRenew
                    ? GradientText(
                        "View Details",
                        colors: AppColors.gradientColorsList,
                      )
                    : CustomGradientButton(
                        onPressed: () {},
                        height: 38,
                        width: 107,
                        child: Text(
                          "Renew Now",
                          style:
                              CustomThemes.whiteColoTextTheme(context).copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
              ],
            )
          ],
        ),
      ),
    );
  }
}
