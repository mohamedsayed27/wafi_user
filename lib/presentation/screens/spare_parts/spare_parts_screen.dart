import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_router/screens_name.dart';
import 'package:wafi_user/core/constants/extensions.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/constants/constants.dart';
import '../../../translations/locale_keys.g.dart';
import '../../widgets/shared_widgets/custom_app_bar.dart';
import '../../widgets/shared_widgets/gradiant_color_button.dart';

class SparePartsScreen extends StatefulWidget {
  const SparePartsScreen({super.key});

  @override
  State<SparePartsScreen> createState() => _SparePartsScreenState();
}

class _SparePartsScreenState extends State<SparePartsScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.spareParts.tr(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomSizedBox(height: 90,),
          SparePartsContainer(
            isSelected: selectedIndex == 0,
            onTap: (){
              selectedIndex = 0;
              setState(() {

              });
            },
            title: LocaleKeys.searchByQuotation.tr(),
            body:
            LocaleKeys.searchByQuotationBody.tr(),
          ),
          const CustomSizedBox(height: 24,),
          SparePartsContainer(
            isSelected: selectedIndex == 1,
            onTap: (){
              selectedIndex = 1;
              setState(() {

              });
            },
            title: LocaleKeys.searchByParts.tr(),
            body:LocaleKeys.searchByQuotationBody.tr(),
          ),
          const Spacer(),
          CustomGradientButton(
            child: Text(
              LocaleKeys.searchParts.tr(),
              style: CustomThemes.whiteColoTextTheme(context).copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            onPressed: () {
              if(selectedIndex==0){

                Navigator.pushNamed(context, ScreenName.spareByQuotationScreen);
              }else{

                Navigator.pushNamed(context, ScreenName.spareByPartsScreen);
              }
            },
          )
        ],
      ).symmetricPadding(horizontal: 16,vertical: 40),
    );
  }
}

class SparePartsContainer extends StatelessWidget {
  final void Function()? onTap;
  final bool isSelected;
  final String title;
  final String body;

  const SparePartsContainer({
    super.key,
    this.onTap,
    required this.isSelected,
    required this.title,
    required this.body,
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
          padding: EdgeInsets.symmetric(
            vertical: 24.h,
            horizontal: 44.w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            color: AppColors.whiteColor,
            boxShadow: isSelected
                ? const [
                    BoxShadow(
                      offset: Offset(0, 22),
                      blurRadius: 24,
                      spreadRadius: 0,
                      color: Color.fromRGBO(0, 0, 0, 0.10),
                    ),
                  ]
                : null,
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const CustomSizedBox(
                height: 16,
              ),
              Text(
                body,
                textAlign: TextAlign.center,
                style: CustomThemes.greyColor99TextStyle(context).copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
