import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/constants/extensions.dart';
import 'package:wafi_user/translations/locale_keys.g.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/constants/constants.dart';
import '../../../core/constants/dummy_data.dart';
import '../shared_widgets/custom_drop_down_button.dart';
import '../shared_widgets/custom_sized_box.dart';
import '../shared_widgets/custom_text_form_field.dart';

class SparePartsIntroContainer extends StatefulWidget {
  const SparePartsIntroContainer({super.key});

  @override
  State<SparePartsIntroContainer> createState() => _SparePartsIntroContainerState();
}

class _SparePartsIntroContainerState extends State<SparePartsIntroContainer> {
  String? value;
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
        children: [
          CustomSizedBox(
            height: preferredSize.height,
          ),
          Row(
            children: [
              const BackButton(
                color: AppColors.whiteColor,
              ),
              const Spacer(),
              SizedBox(
                width: 100.w,
                height: 30.h,
                child: CustomDropDownButton(
                  hintText: "Hint",
                  onChanged: (value) {
                    this.value = value;
                    setState(() {});
                  },
                  items: DummyData.dummyTextList
                      .map(
                        (e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style:
                        CustomThemes.greyColor99TextStyle(context)
                            .copyWith(
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  )
                      .toList(),
                  style:
                  CustomThemes.whiteColoTextTheme(context).copyWith(
                    fontSize: 12.sp,
                  ),
                  borderColor: AppColors.whiteColor,
                  iconColor: AppColors.whiteColor,
                  value: value,
                ),
              ),
              const CustomSizedBox(
                width: 16,
              ),
            ],
          ),
          const CustomSizedBox(height: 22,),
          CustomTextField(
            hintText: LocaleKeys.searchByPartNameOrNumber.tr(),
            prefixIcon: IconButton(
              onPressed: () {},
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
          ).symmetricPadding(horizontal: 16)
        ],
      ),
    );
  }
}
