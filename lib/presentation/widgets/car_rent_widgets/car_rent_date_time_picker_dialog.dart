import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:wafi_user/core/constants/extensions.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../translations/locale_keys.g.dart';
import '../shared_widgets/gradiant_color_button.dart';

class CarRentDateArgs extends Equatable {
  final String fromDate;
  final String fromTime;
  final String toDate;
  final String toTime;

  const CarRentDateArgs({
    required this.fromDate,
    required this.fromTime,
    required this.toDate,
    required this.toTime,
  });

  @override
  List<Object?> get props => [
        fromDate,
        fromTime,
        toDate,
        toTime,
      ];
}

class CarRentDateTimePickerDialog extends StatefulWidget {
  const CarRentDateTimePickerDialog({super.key});

  @override
  State<CarRentDateTimePickerDialog> createState() => _CarRentDateTimePickerDialogState();
}

class _CarRentDateTimePickerDialogState extends State<CarRentDateTimePickerDialog> {
  DateTime? fromDate;
  DateTime? toDate;
  String fromTime = '';
  String toTime = '';

  final List<String> timeList = List.generate(24, (index) {
    final hour = index % 12 == 0 ? 12 : index % 12;
    final suffix = index < 12 ? 'AM' : 'PM';
    return '${hour.toString().padLeft(2, '0')}:00 $suffix';
  });

  int selectedTimeIndex1 = 0;
  int selectedTimeIndex2 = 0;

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        fromDate = args.value.startDate;
        toDate = args.value.endDate ?? args.value.startDate;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fromTime = timeList[selectedTimeIndex1];
    toTime = timeList[selectedTimeIndex2];
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
              minDate: DateTime.now(),
              maxDate: DateTime.now().add(const Duration(days: 365)),
              initialSelectedRange: PickerDateRange(
                DateTime.now(),
                DateTime.now().add(const Duration(days: 3)),
              ),
            ),
            Text(
              LocaleKeys.setTime.tr(),
              style: CustomThemes.greyColor16TextStyle(context).copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            const CustomSizedBox(height: 16),
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
                        ),
                      ),
                      const CustomSizedBox(height: 8),
                      buildTimeWheel(
                        context,
                        selectedTimeIndex1,
                        (index) {
                          setState(() {
                            selectedTimeIndex1 = index;
                            fromTime = timeList[index];
                          });
                        },
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
                        ),
                      ),
                      const CustomSizedBox(height: 8),
                      buildTimeWheel(
                        context,
                        selectedTimeIndex2,
                        (index) {
                          setState(() {
                            selectedTimeIndex2 = index;
                            toTime = timeList[index];
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const CustomSizedBox(height: 16),
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
              onPressed: () {
                if (fromDate != null && toDate != null) {
                  Navigator.pop<CarRentDateArgs>(
                    context,
                    CarRentDateArgs(
                      fromDate: DateFormat('yyyy-MM-dd').format(fromDate!),
                      fromTime: fromTime,
                      toDate: DateFormat('yyyy-MM-dd').format(toDate!),
                      toTime: toTime,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please select a date range')),
                  );
                }
              },
            ).symmetricPadding(horizontal: 72),
          ],
        ).symmetricPadding(horizontal: 16, vertical: 24),
      ),
    );
  }

  Widget buildTimeWheel(BuildContext context, int selectedIndex, ValueChanged<int> onSelected) {
    return SizedBox(
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
            physics: const FixedExtentScrollPhysics(),
            useMagnifier: true,
            magnification: 1.2,
            childDelegate: ListWheelChildBuilderDelegate(
              builder: (context, index) {
                return Center(
                  child: Text(
                    timeList[index],
                    style: CustomThemes.whiteColoTextTheme(context).copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: selectedIndex == index ? null : AppColors.color16,
                    ),
                  ),
                );
              },
              childCount: timeList.length,
            ),
            onSelectedItemChanged: onSelected,
          ),
        ],
      ),
    );
  }
}
