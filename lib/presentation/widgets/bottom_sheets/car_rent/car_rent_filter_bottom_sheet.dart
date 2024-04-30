import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/constants/extensions.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_drop_down_button.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:wafi_user/translations/locale_keys.g.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/app_theme/custom_themes.dart';
import '../../shared_widgets/gradiant_color_button.dart';

class CarRentBottomSheet extends StatefulWidget {
  const CarRentBottomSheet({super.key});

  @override
  State<CarRentBottomSheet> createState() => _CarRentBottomSheetState();
}

class _CarRentBottomSheetState extends State<CarRentBottomSheet> {
  int? selectedPriceIndex;
  int? selectedRatioIndex;

  List<String> pricesList = [
    LocaleKeys.lowToHigh,
    LocaleKeys.highToLow,
  ];
  List<String> ratioList = [
    LocaleKeys.lowToHigh,
    LocaleKeys.highToLow,
  ];
  List<String> modalYear = [
    "2020",
    "2021",
    "2022",
    "2023",
    "2024",
  ];

  String? value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              LocaleKeys.price.tr(),
              style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            const CustomSizedBox(
              height: 8,
            ),
            Row(
              children: List.generate(
                2 * 2 - 1,
                (index) {
                  if (index.isOdd) {
                    return const CustomSizedBox(
                      width: 16,
                    );
                  } else {
                    final itemIndex = index ~/ 2;
                    return InkWell(
                      onTap: () {
                        selectedPriceIndex = itemIndex;
                        setState(() {});
                      },
                      child: Container(
                        padding: EdgeInsets.all(1.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          gradient: LinearGradient(
                            colors: AppColors.gradientColorsList,
                            begin: AlignmentDirectional.topStart,
                            end: AlignmentDirectional.bottomEnd,
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 8.h,
                            horizontal: 10.w,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: selectedPriceIndex == itemIndex
                                ? null
                                : AppColors.whiteColor,
                            gradient: selectedPriceIndex == itemIndex
                                ? LinearGradient(
                                    colors: AppColors.gradientColorsList,
                                    begin: AlignmentDirectional.topStart,
                                    end: AlignmentDirectional.bottomEnd,
                                  )
                                : null,
                          ),
                          child: Text(
                            pricesList[itemIndex].tr(),
                            style: selectedPriceIndex == itemIndex
                                ? CustomThemes.whiteColoTextTheme(context)
                                    .copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  )
                                : CustomThemes.greyColor1CTextStyle(context)
                                    .copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            const CustomSizedBox(
              height: 24,
            ),
            Text(
              LocaleKeys.insuranceType.tr(),
              style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            const CustomSizedBox(
              height: 8,
            ),
            Row(
              children: List.generate(
                2 * 2 - 1,
                (index) {
                  if (index.isOdd) {
                    return const CustomSizedBox(
                      width: 16,
                    );
                  } else {
                    final itemIndex = index ~/ 2;
                    return InkWell(
                      onTap: () {
                        selectedRatioIndex = itemIndex;
                        setState(() {});
                      },
                      child: Container(
                        padding: EdgeInsets.all(1.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          gradient: LinearGradient(
                            colors: AppColors.gradientColorsList,
                            begin: AlignmentDirectional.topStart,
                            end: AlignmentDirectional.bottomEnd,
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 8.h,
                            horizontal: 10.w,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: selectedRatioIndex == itemIndex
                                ? null
                                : AppColors.whiteColor,
                            gradient: selectedRatioIndex == itemIndex
                                ? LinearGradient(
                                    colors: AppColors.gradientColorsList,
                                    begin: AlignmentDirectional.topStart,
                                    end: AlignmentDirectional.bottomEnd,
                                  )
                                : null,
                          ),
                          child: Text(
                            ratioList[itemIndex].tr(),
                            style: selectedRatioIndex == itemIndex
                                ? CustomThemes.whiteColoTextTheme(context)
                                    .copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  )
                                : CustomThemes.greyColor1CTextStyle(context)
                                    .copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            const CustomSizedBox(
              height: 24,
            ),
            Text(
              LocaleKeys.modelYear.tr(),
              style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            const CustomSizedBox(
              height: 8,
            ),
            CustomDropDownButton(
              items: modalYear
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              value: value,
              onChanged: (value) {
                this.value = value;
              },
              hintText: LocaleKeys.selectModelYear.tr(),
            ),
            const CustomSizedBox(
              height: 24,
            ),
            CustomGradientButton(
              borderRadius: 6,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              child: Text(
                LocaleKeys.sort.tr(),
                style:
                CustomThemes.whiteColoTextTheme(context).copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onPressed: () {},
            ).symmetricPadding(horizontal: 72)
          ],
        ).symmetricPadding(horizontal: 16),
      ),
    );
  }
}
