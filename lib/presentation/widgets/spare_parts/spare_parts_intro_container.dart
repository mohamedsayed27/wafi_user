import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/constants/extensions.dart';
import 'package:wafi_user/translations/locale_keys.g.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/constants/constants.dart';
import '../../business_logic/car_spare_parts_cubit/car_spare_by_parts_cubit.dart';
import '../shared_widgets/custom_sized_box.dart';
import '../shared_widgets/custom_text_form_field.dart';

class SparePartsIntroContainer extends StatelessWidget {
  final CarSparePartsCubit carSparePartsCubit;
  const SparePartsIntroContainer({super.key, required this.carSparePartsCubit});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.gradientColorsList,
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSizedBox(
            height: (preferredSize.height) / 2,
          ),
          const BackButton(
            color: AppColors.whiteColor,
          ),
          const CustomSizedBox(
            height: 22,
          ),
          BlocConsumer<CarSparePartsCubit, CarSparePartsState>(
            listener: (context, state) {},
            builder: (context, state) {
              final cubit = carSparePartsCubit;
              return CustomTextField(
                controller: carSparePartsCubit.searchSparePartController,
                hintText: LocaleKeys.searchByPartNameOrNumber.tr(),
                onChanged: (value) {
                  cubit.searchSparePart(value);
                  return null;
                },
                prefixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.search_rounded,
                    color: AppColors.whiteColor,
                    size: 24.r,
                  ),
                ),
                fillColor: AppColors.whiteColor.withOpacity(0.2),
                filled: true,
                borderColor: Colors.transparent,
                hintStyle: CustomThemes.whiteColoTextTheme(context)
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 14.sp),
              ).symmetricPadding(
                horizontal: 16,
              );
            },
          )
        ],
      ),
    );
  }
}
