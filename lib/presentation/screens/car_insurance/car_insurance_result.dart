import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';
import 'package:wafi_user/core/app_theme/custom_themes.dart';
import 'package:wafi_user/core/assets_path/svg_path.dart';
import 'package:wafi_user/core/constants/extensions.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_elevated_button.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';

import '../../../core/constants/constants.dart';
import '../../widgets/car_insurance_widgets/car_insurance_container.dart';
import '../../widgets/shared_widgets/custom_app_bar.dart';

class CarInsuranceResult extends StatelessWidget {
  const CarInsuranceResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: const CustomAppBar(
          title: "Car Insurance",
        ),
      ),
      body: Column(
        children: [
          CustomSizedBox(height: 32,),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Time Out In",
                    style: CustomThemes.greyColor75TextStyle(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  CustomSizedBox(
                    height: 4,
                  ),
                  Text(
                    "9 hr 36 min 13 sec",
                    style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8.r,
                      offset: Offset(0, 4.h),
                      color: AppColors.shadowColor(value: 0.1),
                    )
                  ],
                ),
                child: CustomElevatedButton(
                  backgroundColor: AppColors.whiteColor,
                  elevation: 5,
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  height: 28,
                  width: 24,
                  child: SvgPicture.asset(
                    SvgPath.filter,
                    height: 16,
                    width: 16,
                    colorFilter: ColorFilter.mode(
                      AppColors.color1C,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              CustomSizedBox(
                width: 8,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8.r,
                      offset: Offset(0, 4.h),
                      color: AppColors.shadowColor(value: 0.1),
                    )
                  ],
                ),
                child: CustomElevatedButton(
                  backgroundColor: AppColors.whiteColor,
                  elevation: 5,
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  height: 28,
                  width: 24,
                  child: SvgPicture.asset(
                    SvgPath.sort,
                    height: 16,
                    width: 16,
                    colorFilter: ColorFilter.mode(
                      AppColors.color1C,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              CustomSizedBox(
                width: 8,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8.r,
                      offset: Offset(0, 4.h),
                      color: AppColors.shadowColor(value: 0.1),
                    )
                  ],
                ),
                child: CustomElevatedButton(
                  backgroundColor: AppColors.whiteColor,
                  elevation: 5,
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  height: 28,
                  width: 24,
                  child: SvgPicture.asset(
                    SvgPath.insurance,
                    height: 16,
                    width: 16,
                    colorFilter: ColorFilter.mode(
                      AppColors.color1C,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ).symmetricPadding(horizontal: 16),
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, index) => CarInsuranceContainer(),
              separatorBuilder: (_, index) => CustomSizedBox(
                height: 16,
              ),
              itemCount: 3,
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 24.h,
              ),
            ),
          )
        ],
      ),
    );
  }
}
