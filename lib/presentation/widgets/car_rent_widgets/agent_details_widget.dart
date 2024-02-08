import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_divider.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/images_path.dart';
import '../../../core/assets_path/svg_path.dart';
import '../../../core/constants/constants.dart';
import '../../widgets/car_rent_widgets/car_details_widget.dart';
import '../../widgets/car_rent_widgets/choose_insurance_type_widget.dart';
import '../../widgets/shared_widgets/bill_details_item.dart';
import '../../widgets/shared_widgets/custom_outlined_button.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';
import '../../widgets/shared_widgets/gradiant_color_button.dart';
import '../../widgets/shared_widgets/gradient_svg.dart';


class AgentDetailsWidget extends StatelessWidget {
  const AgentDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Agent Details",
          style: CustomThemes.greyColor1CTextStyle(context).copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        ),
        const CustomSizedBox(
          height: 8,
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: AppColors.locationDetailsContainer,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    height: 24.h,
                    width: 24.w,
                    decoration: BoxDecoration(
                      color: AppColors.greyColor9,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                  const CustomSizedBox(
                    width: 4,
                  ),
                  Text(
                    "Agent Name",
                    style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
              const CustomSizedBox(
                height: 20,
              ),
              Container(
                height: 133.h,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.r),
                ),
                child: Image.asset(
                  ImagesPath.mapImage,
                  fit: BoxFit.cover,
                ),
              ),
              const CustomSizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GradientSvg(
                        svgPath: SvgPath.mapsLocation,
                        height: 16.h,
                        width: 16.w,
                      ),
                      const CustomSizedBox(
                        width: 4,
                      ),
                      Text(
                        "Riyadh, Ar-Riyad",
                        style:
                        CustomThemes.greyColor99TextStyle(context).copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GradientSvg(
                        svgPath: SvgPath.send,
                        height: 16.h,
                        width: 16.w,
                      ),
                      const CustomSizedBox(
                        width: 4,
                      ),
                      Text(
                        "3.25 km away",
                        style:
                        CustomThemes.greyColor99TextStyle(context).copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}