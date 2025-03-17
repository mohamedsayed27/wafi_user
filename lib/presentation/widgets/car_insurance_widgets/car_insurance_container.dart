import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:wafi_user/core/app_router/screens_name.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';
import 'package:wafi_user/core/app_theme/custom_themes.dart';
import 'package:wafi_user/core/assets_path/fonts_path.dart';
import 'package:wafi_user/core/assets_path/images_path.dart';
import 'package:wafi_user/core/assets_path/svg_path.dart';
import 'package:wafi_user/presentation/widgets/orders_container/ordrs_container.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_divider.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_outlined_button.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradiant_color_button.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradient_svg.dart';
import 'package:wafi_user/translations/locale_keys.g.dart';

class CarInsuranceContainer extends StatefulWidget {
  const CarInsuranceContainer({super.key});

  @override
  State<CarInsuranceContainer> createState() => _CarInsuranceContainerState();
}



class _CarInsuranceContainerState extends State<CarInsuranceContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 400,
      ),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    );
    // animationController.forward();
    super.initState();
  }

  bool isViewMore = false;
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return OrdersContainer(
      outContainerColor: AppColors.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                ImagesPath.malathImage,
                height: 34.h,
                width: 42.w,
              ),
              const CustomSizedBox(
                width: 16,
              ),
              GradientText(
                "Malath",
                colors: AppColors.gradientColorsList,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: FontsPath.almarai,
                  fontSize: 16.sp,
                ),
              ),
              const Spacer(),
              GradientSvg(
                svgPath: SvgPath.photo,
                height: 24.h,
                width: 24.w,
              ),
              const CustomSizedBox(
                width: 16,
              ),
              GradientSvg(
                svgPath: SvgPath.snail,
                height: 24.h,
                width: 24.w,
              ),
            ],
          ),
          const CustomSizedBox(
            height: 24,
          ),
          Text(
            LocaleKeys.insuranceCoversFree.tr(),
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          const CustomSizedBox(
            height: 8,
          ),
          const CustomDivider(
            height: 1.2,
          ),
          const CustomSizedBox(
            height: 8,
          ),
          const InsuranceCoversWidget(),
          const CustomSizedBox(
            height: 8,
          ),
          const InsuranceCoversWidget(),
          const CustomSizedBox(
            height: 8,
          ),
          const InsuranceCoversWidget(),
          const CustomSizedBox(
            height: 8,
          ),
          SizeTransition(
            axisAlignment: 1.0,
            sizeFactor: animation,
            child: const Column(
              children: [
                InsuranceCoversWidget(),
                CustomSizedBox(
                  height: 8,
                ),
                InsuranceCoversWidget(),
                CustomSizedBox(
                  height: 8,
                ),
                InsuranceCoversWidget(),
                CustomSizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          const CustomSizedBox(
            height: 24,
          ),
          Text(
            LocaleKeys.additionalCovers.tr(),
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          const CustomSizedBox(
            height: 8,
          ),
          const CustomDivider(
            height: 1.2,
          ),
          const CustomSizedBox(
            height: 8,
          ),
          const AdditionalCoversWidget(),
          const AdditionalCoversWidget(),
          const AdditionalCoversWidget(),
          const AdditionalCoversWidget(),
          SizeTransition(
            axisAlignment: 1.0,
            sizeFactor: animation,
            child: const Column(
              children: [
                AdditionalCoversWidget(),
                AdditionalCoversWidget(),
                AdditionalCoversWidget(),
                AdditionalCoversWidget(),
              ],
            ),
          ),
          const CustomSizedBox(
            height: 8,
          ),
          const CustomDivider(
            height: 1.2,
          ),
          const CustomSizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                LocaleKeys.deductibleSar.tr(),
                style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const CustomSizedBox(
                width: 24,
              ),
              SvgPicture.asset(
                SvgPath.info,
                width: 18.w,
                height: 18.h,
                colorFilter: const ColorFilter.mode(
                  AppColors.greyColor75,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
          const CustomSizedBox(
            height: 8,
          ),
          SizedBox(
            height: 24.h,
            child: ListView.separated(
              itemBuilder: (_, index) => Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: AppColors.borderColor,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  "${0 + index * 100}",
                  style: CustomThemes.greyColor16TextStyle(context).copyWith(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              separatorBuilder: (_, index) => const CustomSizedBox(
                width: 16,
              ),
              itemCount: 6,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const CustomSizedBox(
            height: 24,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "520 AED",
                    style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: AppColors.color1C,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GradientText(
                        "4,678.66 ",
                        colors: AppColors.gradientColorsList,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: FontsPath.almarai,
                        ),
                      ),
                      const CustomSizedBox(
                        width: 2,
                      ),
                      Text(
                        "SAR",
                        style:
                            CustomThemes.greyColor1CTextStyle(context).copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              CustomOutlinedButton(
                height: 32,
                width: 32,
                borderRadius: 4,
                padding: EdgeInsets.zero,
                backgroundColor: AppColors.borderColor,
                borderColor: AppColors.greyColor75,
                onPressed: () {
                  if (isViewMore) {
                    animationController.reverse();
                    isViewMore = false;
                    setState(() {});
                  } else {
                    animationController.forward();
                    isViewMore = true;
                    setState(() {});
                  }
                },
                child: AnimatedRotation(
                  turns: isViewMore ? 0.5 : 0,
                  duration: const Duration(milliseconds: 500),
                  child: Icon(
                    Icons.keyboard_double_arrow_down,
                    color: AppColors.greyColor75,
                    size: 32.r,
                  ),
                ),
              ),
              CustomGradientButton(
                onPressed: () {
                  Navigator.pushNamed(context, ScreenName.insurancePaymentScreen);
                },
                padding: EdgeInsets.zero,
                height: 48,
                width: 100,
                child: Text(
                  LocaleKeys.select.tr(),
                  style: CustomThemes.whiteColoTextTheme(context)
                      .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class InsuranceCoversWidget extends StatelessWidget {
  const InsuranceCoversWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GradientSvg(
          svgPath: SvgPath.check1,
          width: 18.w,
          height: 18.h,
        ),
        const CustomSizedBox(
          width: 16,
        ),
        Expanded(
          child: Text(
            LocaleKeys.energyMedicalExpenses.tr(),
            style: CustomThemes.greyColor16TextStyle(context).copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SvgPicture.asset(
          SvgPath.info,
          width: 18.w,
          height: 18.h,
          colorFilter: const ColorFilter.mode(
            AppColors.greyColor75,
            BlendMode.srcIn,
          ),
        ),
      ],
    );
  }
}

class AdditionalCoversWidget extends StatefulWidget {
  const AdditionalCoversWidget({super.key});

  @override
  State<AdditionalCoversWidget> createState() => _AdditionalCoversWidgetState();
}

class _AdditionalCoversWidgetState extends State<AdditionalCoversWidget> {
  bool? check = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: check,
          activeColor: AppColors.primaryColor,
          visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity),
          side: const BorderSide(color: AppColors.primaryColor),
          onChanged: (value) {
            check = value;
            setState(() {});
          },
        ),
        const CustomSizedBox(
          width: 16,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: LocaleKeys.energyMedicalExpenses.tr(),
              style: CustomThemes.greyColor16TextStyle(context).copyWith(
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
              ),
              children: [
                TextSpan(
                  text: " @ 250 SAR",
                  style: CustomThemes.greyColor16TextStyle(context).copyWith(
                    fontSize: 12.sp,
                    color: AppColors.greenColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
        SvgPicture.asset(
          SvgPath.info,
          width: 18.w,
          height: 18.h,
          colorFilter: const ColorFilter.mode(
            AppColors.greyColor75,
            BlendMode.srcIn,
          ),
        ),
      ],
    );
  }
}
