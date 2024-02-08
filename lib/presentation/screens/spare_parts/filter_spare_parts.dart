import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/form_drom_down_widget.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/form_item_widget.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradiant_color_button.dart';

import '../../../core/app_theme/custom_themes.dart';
import '../../../core/constants/constants.dart';

class AddYourCar extends StatelessWidget {
  const AddYourCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: const CustomAppBar(
          title: "Add your car",
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 32.h),
        children: [
          Text(
            "Enter Car Details",
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          const CustomSizedBox(
            height: 24,
          ),
          const FormDropDownWidget(title: "Make"),
          const CustomSizedBox(
            height: 24,
          ),
          const FormDropDownWidget(title: "Model"),
          const CustomSizedBox(
            height: 24,
          ),
          const FormDropDownWidget(title: "Year of Manufacture"),
          const CustomSizedBox(
            height: 24,
          ),
          const FormItemWidget(title: "Chassis Number", hintText: "**********"),
          const CustomSizedBox(
            height: 160,
          ),
          CustomGradientButton(
            child: Text(
              "Submit",
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
