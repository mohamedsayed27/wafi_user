import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';
import 'package:wafi_user/core/assets_path/svg_path.dart';

import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/images_path.dart';
import '../../../core/constants/constants.dart';
import '../../widgets/shared_widgets/custom_app_bar.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';
import '../../widgets/shared_widgets/form_item_widget.dart';
import '../../widgets/shared_widgets/gradiant_color_button.dart';
import '../../widgets/shared_widgets/gradient_svg.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: const CustomAppBar(
          title: "Edit Profile",
          elevation: 0,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
        children: [
          Center(
            child: CustomSizedBox(
              height: 140,
              width: 160,
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 120.h,
                      width: 120.w,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Image.asset(
                        ImagesPath.categoriesDummy2,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: AppColors.shadowColor(value: 0.22),
                          offset: Offset.zero,
                          blurRadius: 40.r)
                    ]),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: const CircleBorder(),
                        backgroundColor: AppColors.whiteColor,
                        foregroundColor: AppColors.primaryColor,
                      ),
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const CustomSizedBox(height: 16),
          const FormItemWidget(
            title: "Name",
            hintText: "User Name",
          ),
          const CustomSizedBox(height: 16),
          const FormItemWidget(
            title: "Email",
            hintText: "User Email",
          ),
          const CustomSizedBox(height: 16),
          RichText(
            text: TextSpan(
              text: "Phone Number",
              style: CustomThemes.greyColor16TextStyle(context).copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal),
              //   children: [
              //     if (false)
              //       TextSpan(
              //         text: " *",
              //         style: TextStyle(
              //           fontSize: 16.sp,
              //           color: Colors.red,
              //         ),
              //       )
              //   ],
            ),
          ),
          const CustomSizedBox(
            height: 8,
          ),
          IntlPhoneField(
            // dropDownPadding: EdgeInsets.symmetric(horizontal:16.w,vertical: 16.h),
            // dropdownDecoration: BoxDecoration(
            //   shape: BoxShape.rectangle,
            //   borderRadius: BorderRadius.circular(8.r),
            //   border: Border.all(
            //       color: AppColors.borderColor,
            //       width: 1.w,
            //   )
            // ),
            decoration: InputDecoration(
              // labelText: 'Phone Number',
              helperStyle: CustomThemes.greyColor99TextStyle(context)
                  .copyWith(fontWeight: FontWeight.w400, fontSize: 14.sp),
              label: null,
              hintText: "Phone Number",
              floatingLabelAlignment: FloatingLabelAlignment.start,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: AppColors.borderColor,
                  width: 1.w,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: AppColors.borderColor,
                  width: 1.w,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: AppColors.borderColor,
                  width: 1.w,
                ),
              ),
            ),

            initialCountryCode: 'US',
            onChanged: (phone) {
              print(phone
                  .completeNumber); // Prints complete number including country code
            },
          ),
          FormItemWidget(
            title: "Password",
            hintText: "Your Password",
            isNotVisible: true,
            maxlines: 1,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: GradientSvg(
                svgPath: SvgPath.pen,
                height: 16.h,
                width: 16.w,
              ),
            ),
          ),
          const CustomSizedBox(
            height: 32,
          ),
          CustomGradientButton(
            onPressed: () {},
            child: Text(
              "Update",
              style: CustomThemes.whiteColoTextTheme(context).copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
