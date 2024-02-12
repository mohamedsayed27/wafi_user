import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wafi_user/core/assets_path/svg_path.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradient_svg.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/constants/constants.dart';

class AddDriverScreen extends StatefulWidget {
  const AddDriverScreen({super.key});

  @override
  State<AddDriverScreen> createState() => _AddDriverScreenState();
}

class _AddDriverScreenState extends State<AddDriverScreen> {
  List<Map<String, dynamic>?> titlesList = [
    {
      "title": "Add Driver",
      "image": SvgPath.vector,
    },
    null,
    {
      "title": "Other Details",
      "image": SvgPath.list,
    }
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: const CustomAppBar(
          title: "Add Driver",
        ),
      ),
      body: ListView(
        children: [
          Material(
            type: MaterialType.transparency,
            child: Hero(
              tag: "addDriver",
              child: Row(
                children: List.generate(
                  titlesList.length,
                  (index) {
                    if (index.isOdd) {
                      return CustomSizedBox(
                        width: 24,
                      );
                    } else {
                      return Expanded(
                        child: InkWell(
                          onTap: () {
                            currentIndex = index;
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.all(1.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              color:
                                  currentIndex == index ? null : AppColors.borderColor,
                              gradient: currentIndex == index
                                  ? LinearGradient(
                                      colors: AppColors.gradientColorsList,
                                      begin: AlignmentDirectional.topStart,
                                      end: AlignmentDirectional.bottomEnd,
                                    )
                                  : null,
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 12.h,
                                // horizontal: 10.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                color: currentIndex == index
                                    ? null
                                    : AppColors.whiteColor,
                                gradient: currentIndex == index
                                    ? LinearGradient(
                                        colors: AppColors.gradientColorsList,
                                        begin: AlignmentDirectional.topStart,
                                        end: AlignmentDirectional.bottomEnd,
                                      )
                                    : null,
                              ),
                              child: Row(
                                // mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GradientSvg(
                                    height: 20,
                                    width: 20,
                                    svgPath: titlesList[index]!["image"],
                                    isSelected: currentIndex != index,
                                    svgDisabledColor: AppColors.whiteColor,
                                  ),
                                  CustomSizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    titlesList[index]!["title"],
                                    style: currentIndex == index
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
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
