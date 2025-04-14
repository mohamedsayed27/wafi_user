import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:wafi_user/translations/locale_keys.g.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../widgets/car_rent_widgets/citizen_resident_component.dart';
import '../../widgets/car_rent_widgets/visitor_component.dart';
import '../../widgets/shared_widgets/custom_app_bar.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';

class ChooseDriverTypeScreen extends StatefulWidget {
  const ChooseDriverTypeScreen({super.key});

  @override
  State<ChooseDriverTypeScreen> createState() => _ChooseDriverTypeScreenState();
}

class _ChooseDriverTypeScreenState extends State<ChooseDriverTypeScreen> {
  int currentIndex = 0;

  List<String?> titlesList = [
    LocaleKeys.citizenResident.tr(),
    null,
    LocaleKeys.visitor.tr(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.rentACar.tr(),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
        children: [
          Text(
            LocaleKeys.typeOfDriver.tr(),
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          const CustomSizedBox(
            height: 16,
          ),
          Row(
            children: List.generate(
              3,
              (index) => index.isOdd
                  ? const CustomSizedBox(
                      width: 16,
                    )
                  : Expanded(
                      child: CarDriverTypeButton(
                      isSelected: index == currentIndex,
                      text: titlesList[index] ?? "ef",
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    )),
            ),
          ),
          const CustomSizedBox(
            height: 24,
          ),
          if (currentIndex == 0) const CitizenResidentComponent(),
          if (currentIndex == 2) const VisitorComponent(),
        ],
      ),
    );
  }
}

class CarDriverTypeButton extends StatelessWidget {
  final void Function()? onTap;
  final bool isSelected;
  final String text;

  const CarDriverTypeButton({
    super.key,
    this.onTap,
    required this.isSelected,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4.r),
      child: Container(
        padding: EdgeInsets.all(1.2.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          border: isSelected ? null : Border.all(color: AppColors.greyColorDC),
          gradient: isSelected
              ? LinearGradient(
                  colors: AppColors.gradientColorsList,
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                )
              : null,
        ),
        child: Container(
          decoration:
              BoxDecoration(color: AppColors.whiteColor, borderRadius: BorderRadius.circular(4.r)),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 8.h,
              horizontal: 8.w,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: isSelected ? null : AppColors.whiteColor,
              gradient: isSelected
                  ? LinearGradient(
                      colors: AppColors.gradientColorsList.map((e) => e.withOpacity(0.1)).toList(),
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd,
                    )
                  : null,
            ),
            alignment: Alignment.center,
            child: isSelected
                ? GradientText(
                    text,
                    colors: AppColors.gradientColorsList,
                    style: CustomThemes.whiteColoTextTheme(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                : Text(
                    text,
                    style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
