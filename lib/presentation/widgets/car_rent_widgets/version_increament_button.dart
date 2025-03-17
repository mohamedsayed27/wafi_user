import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../shared_widgets/custom_sized_box.dart';

class VersionCounter extends StatefulWidget {
  final String text;

  const VersionCounter({super.key, required this.text});

  @override
  State<VersionCounter> createState() => _VersionCounterState();
}

class _VersionCounterState extends State<VersionCounter> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: CustomThemes.greyColor16TextStyle(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal),
        ),
        const CustomSizedBox(
          height: 8,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: AppColors.borderColor,
                width: 1.w,
              ),
            ),
            child: Row(
              children: [
                CustomSizedBox(
                  height: 24,
                  width: 24,
                  child: IconButton(
                    onPressed: () {
                      if(counter>1){
                        counter--;
                        setState(() {

                        });
                      }
                    },
                    icon: const Icon(Icons.remove),
                    style: IconButton.styleFrom(padding: EdgeInsets.zero),
                  ),
                ),
                Expanded(
                  child: Text(
                    "$counter",
                    textAlign: TextAlign.center,
                    style: CustomThemes.greyColor16TextStyle(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                CustomSizedBox(
                  height: 24,
                  width: 24,
                  child: IconButton(
                    onPressed: () {
                      counter++;
                      setState(() {

                      });
                      },
                    icon: const Icon(Icons.add),
                    style: IconButton.styleFrom(padding: EdgeInsets.zero),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
