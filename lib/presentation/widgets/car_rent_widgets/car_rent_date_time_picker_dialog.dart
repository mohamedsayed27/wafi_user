import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:wafi_user/core/constants/extensions.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../translations/locale_keys.g.dart';
import '../shared_widgets/gradiant_color_button.dart';

class CarRentDateTimePickerDialog extends StatefulWidget {
  const CarRentDateTimePickerDialog({super.key});

  @override
  State<CarRentDateTimePickerDialog> createState() => _CarRentDateTimePickerDialogState();
}

class _CarRentDateTimePickerDialogState extends State<CarRentDateTimePickerDialog> {
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';
  List<String> timeList = List.generate(24, (index) => '${index.toString().padLeft(2, '0')}:00 AM');

  int selectedTimeIndex1 = 0;
  int selectedTimeIndex2 = 0;

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290.h,
      child: Dialog(
        backgroundColor: AppColors.whiteColor,
        insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        surfaceTintColor: AppColors.whiteColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SfDateRangePicker(
              onSelectionChanged: _onSelectionChanged,
              selectionMode: DateRangePickerSelectionMode.range,
              rangeSelectionColor: AppColors.locationDetailsContainer,
              endRangeSelectionColor: AppColors.homeScreenGradientFirstColor,
              startRangeSelectionColor: AppColors.thirdGradientColor,
              // selectionColor: AppColors.secondGradientColor,
              initialSelectedRange: PickerDateRange(
                  DateTime.now().subtract(const Duration(days: 4)),
                  DateTime.now().add(const Duration(days: 3))),
            ),
            Text(
              LocaleKeys.setTime.tr(),
              style: CustomThemes.greyColor16TextStyle(context).copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
            const CustomSizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        LocaleKeys.pickup.tr(),
                        style: CustomThemes.greyColor16TextStyle(context).copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      const CustomSizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 100.h,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 19.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                gradient: LinearGradient(
                                  colors: AppColors.gradientColorsList,
                                  begin: AlignmentDirectional.topStart,
                                  end: AlignmentDirectional.bottomEnd,
                                ),
                              ),
                            ),
                            ListWheelScrollView.useDelegate(
                              itemExtent: 20,
                              //// Height of each item
                              physics: const FixedExtentScrollPhysics(),
                              useMagnifier: true,
                              magnification: 1.2,
                              childDelegate: ListWheelChildBuilderDelegate(
                                  builder: (context, index) {
                                    return buildTimeItem(
                                        timeList[index], selectedTimeIndex1 == index, context);
                                  },
                                  childCount: timeList.length),
                              // timeList.map((time) {
                              //   return buildTimeItem(time,selectedTimeIndex1==time.);
                              // }).toList(),
                              onSelectedItemChanged: (index) {
                                setState(() {
                                  selectedTimeIndex1 = index;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        LocaleKeys.returnText.tr(),
                        style: CustomThemes.greyColor16TextStyle(context).copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      const CustomSizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 100.h,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 19.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                gradient: LinearGradient(
                                  colors: AppColors.gradientColorsList,
                                  begin: AlignmentDirectional.topStart,
                                  end: AlignmentDirectional.bottomEnd,
                                ),
                              ),
                            ),
                            ListWheelScrollView.useDelegate(
                              itemExtent: 20,
                              //// Height of each item
                              physics: const FixedExtentScrollPhysics(),
                              useMagnifier: true,
                              magnification: 1.2,
                              childDelegate: ListWheelChildBuilderDelegate(
                                  builder: (context, index) {
                                    return buildTimeItem(
                                        timeList[index], selectedTimeIndex2 == index, context);
                                  },
                                  childCount: timeList.length),
                              // timeList.map((time) {
                              //   return buildTimeItem(time,selectedTimeIndex2==time.);
                              // }).toList(),
                              onSelectedItemChanged: (index) {
                                setState(() {
                                  selectedTimeIndex2 = index;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const CustomSizedBox(
              height: 16,
            ),
            CustomGradientButton(
              borderRadius: 6,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              child: Text(
                LocaleKeys.submit.tr(),
                style: CustomThemes.whiteColoTextTheme(context).copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onPressed: () {},
            ).symmetricPadding(
              horizontal: 72,
            )
          ],
        ).symmetricPadding(
          horizontal: 16,
          vertical: 24,
        ),
      ),
    );
  }

  Widget buildTimeItem(String time, bool isSelected, BuildContext context) {
    return Center(
      child: Text(
        time,
        style: CustomThemes.whiteColoTextTheme(context).copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            color: isSelected ? null : AppColors.color16),
      ),
    );
  }
}
