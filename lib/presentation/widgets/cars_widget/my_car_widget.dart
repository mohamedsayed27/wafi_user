import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:wafi_user/data/models/cars_models/car_model.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/cached_network_image_widget.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../translations/locale_keys.g.dart';
import '../../widgets/orders_container/ordrs_container.dart';
import '../shared_widgets/custom_elevated_button.dart';
import '../shared_widgets/custom_sized_box.dart';

class MyCarWidget extends StatelessWidget {
  final void Function()? onEditPressed;
  final void Function()? onRemovePressed;
  final CarModel model;
  const MyCarWidget({
    super.key,
    this.onEditPressed,
    this.onRemovePressed, required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return OrdersContainer(
      outContainerColor: AppColors.primaryColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                height: 64.h,
                width: 64.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    8.r,
                  ),
                  color: AppColors.borderColor,
                ),
                alignment: Alignment.center,
                child: CachedNetworkImageWidget(imageUrl: model.imageCarType??"",),
              ),
              const CustomSizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.year!,
                      style: CustomThemes.greyColor99TextStyle(context)
                          .copyWith(
                              fontSize: 12.sp, fontWeight: FontWeight.w700),
                    ),
                    GradientText(
                      model.carTypeName??"",
                      colors: AppColors.gradientColorsList,
                    ),

                  ],
                ),
              ),
            ],
          ),
          const CustomSizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 6.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      8.r,
                    ),
                    color: AppColors.borderColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Plate Number",
                        style: CustomThemes.greyColor99TextStyle(context)
                            .copyWith(
                                fontSize: 12.sp, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        model.structureNum??"",
                        style: CustomThemes.greyColor1CTextStyle(context)
                            .copyWith(
                                fontSize: 14.sp, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
              const CustomSizedBox(
                width: 16,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 6.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      8.r,
                    ),
                    color: AppColors.borderColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Model",
                        style: CustomThemes.greyColor99TextStyle(context)
                            .copyWith(
                                fontSize: 12.sp, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        model.carModelName??"",
                        style: CustomThemes.greyColor1CTextStyle(context)
                            .copyWith(
                                fontSize: 14.sp, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const CustomSizedBox(
            height: 8,
          ),
          const Divider(
            thickness: 1,
            color: Color(0xffD8D8D8),
          ),
          Row(
            children: [
              Expanded(
                child: CustomElevatedButton(
                  backgroundColor: AppColors.whiteColor,
                  onPressed: onEditPressed,
                  text: LocaleKeys.edit.tr(),
                  titleStyle: CustomThemes.greyColor99TextStyle(context),
                  foregroundColor: AppColors.color1C,
                ),
              ),
              Container(
                height: 28.h,
                width: 1.w,
                color: const Color(0xffD8D8D8),
              ),
              Expanded(
                child: CustomElevatedButton(
                  backgroundColor: AppColors.whiteColor,
                  onPressed: onRemovePressed,
                  text: LocaleKeys.remove.tr(),
                  titleStyle: CustomThemes.greyColor99TextStyle(context),
                  foregroundColor: AppColors.color1C,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
