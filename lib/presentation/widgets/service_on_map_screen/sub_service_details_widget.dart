import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/fonts_path.dart';
import '../../../data/models/car_service_and_maintenance_models/sub_service_model.dart';
import '../../../translations/locale_keys.g.dart';
import '../shared_widgets/custom_sized_box.dart';
class SubServicesDetailsWidget extends StatelessWidget {
  final SubServiceModel? serviceModel;
  final bool isSelected;
  final void Function()? onTab;
  const SubServicesDetailsWidget({super.key, this.serviceModel,  this.isSelected = false, this.onTab});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.symmetric(
          horizontal: 0.5.w,
          vertical: 0.5.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: isSelected?null:AppColors.greyColorDC,
          gradient: isSelected?LinearGradient(
            colors: AppColors.gradientColorsList,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ):null,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            color: isSelected?AppColors.greyColorF7:AppColors.whiteColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  serviceModel?.title ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.startsFrom.tr(),
                    style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                      fontSize: 12.sp,
                      height: 1,
                      fontWeight: FontWeight.w700,
                      color: AppColors.color1C.withOpacity(0.5),
                    ),
                  ),
                  const CustomSizedBox(
                    height: 2,
                  ),
                  Text(
                    "${serviceModel?.price ?? 0} SR",
                    style: TextStyle(
                      fontSize: 12.sp,
                      height: 1,
                      fontWeight: FontWeight.w700,
                      fontFamily: FontsPath.almarai,
                      color: AppColors.greenColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
