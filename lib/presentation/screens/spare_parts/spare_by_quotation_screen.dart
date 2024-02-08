import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/assets_path/images_path.dart';
import 'package:wafi_user/core/assets_path/svg_path.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradient_svg.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/constants/constants.dart';
import '../../widgets/shared_widgets/form_item_widget.dart';
import '../../widgets/shared_widgets/gradiant_color_button.dart';

class SpareByQuotationScreen extends StatefulWidget {
  const SpareByQuotationScreen({super.key});

  @override
  State<SpareByQuotationScreen> createState() => _SpareByQuotationScreenState();
}

class _SpareByQuotationScreenState extends State<SpareByQuotationScreen> {

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: const CustomAppBar(
          title: "Spare Parts",
          elevation: 0,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 32.h,),
        children: [
          const FormItemWidget(
            title: "Name of Part",
            hintText: "",
          ),
          const CustomSizedBox(
            height: 24,
          ),
          const FormItemWidget(title: "Part Number", hintText: "", isRequired: true),
          const CustomSizedBox(
            height: 24,
          ),
          const FormItemWidget(
            title: "Any Specifications",
            hintText: "",
          ),
          const CustomSizedBox(
            height: 24,
          ),
          Text(
            "Upload Images",
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          const CustomSizedBox(
            height: 16,
          ),
          SizedBox(
            height: 90.h,
            child: Row(
              children: [
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) => const UploadedImageWidget(),
                    separatorBuilder: (_, index) => const SizedBox(
                      width: 16,
                    ),
                    itemCount: 4,
                  ),
                ),

                const CustomSizedBox(
                  width: 16,
                ),
                DottedBorder(
                  color: AppColors.primaryColor,
                  borderType: BorderType.RRect,
                  dashPattern: const [8, 4],
                  padding:
                      EdgeInsets.symmetric(horizontal: 27.w, vertical: 27.h),
                  radius: const Radius.circular(16),
                  child: GradientSvg(
                    svgPath: SvgPath.add,
                    height: 24.h,
                    width: 24.w,
                  ),
                )
              ],
            ),
          ),
          const CustomSizedBox(
            height: 24,
          ),
          Row(
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.r),
                  gradient: LinearGradient(
                    colors: AppColors.gradientColorsList,
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                  ),
                ),
                alignment: Alignment.center,
                child: Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                  visualDensity: const VisualDensity(
                      horizontal: VisualDensity.maximumDensity,
                      vertical: VisualDensity.maximumDensity),
                  focusColor: AppColors.whiteColor,
                  fillColor: MaterialStateProperty.all(
                    isChecked
                        ? Colors.transparent
                        : AppColors.whiteColor,
                  ),
                  checkColor: AppColors.whiteColor,
                  side: const BorderSide(color: AppColors.whiteColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.r),
                    side: const BorderSide(color: AppColors.whiteColor),
                  ),
                ),
              ),
              const CustomSizedBox(
                width: 8,
              ),
              Text(
                "Also so quotations with second hand parts if available.",
                style: CustomThemes.greyColor16TextStyle(context).copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
          const CustomSizedBox(
            height: 24,
          ),
          CustomGradientButton(
            child: Text(
              "Submit Request",
              style: CustomThemes.whiteColoTextTheme(context).copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

class UploadedImageWidget extends StatelessWidget {
  const UploadedImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.h,
      width: 88.w,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Align(
            alignment: AlignmentDirectional.bottomStart,
            child: Container(
              height: 80.h,
              width: 80.w,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Image.asset(
                ImagesPath.car1,
                fit: BoxFit.cover,
              ),
            ),
          ),
          GradientSvg(
            svgPath: SvgPath.remove,
            height: 24.h,
            width: 24.w,
          ),
        ],
      ),
    );
  }
}
