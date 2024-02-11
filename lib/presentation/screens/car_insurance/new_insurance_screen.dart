import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/form_date_item.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/form_item_widget.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradiant_color_button.dart';

import '../../../core/app_theme/custom_themes.dart';
import '../../../core/constants/constants.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';
import '../car_rent/choose_driver_type_screen.dart';

class AddNewInsuranceScreen extends StatefulWidget {
  const AddNewInsuranceScreen({super.key});

  @override
  State<AddNewInsuranceScreen> createState() => _AddNewInsuranceScreenState();
}

class _AddNewInsuranceScreenState extends State<AddNewInsuranceScreen> {
  int currentIndex = 0;

  List<String?> titlesList = [
    "Comprehensive Insurance",
    // null,
    "3rd Party Liability",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: const CustomAppBar(
          title: "New Insurance",
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
        children: [
          Text(
            "Select type of Insurance",
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          const CustomSizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              2,
              (index) => CarDriverTypeButton(
                isSelected: index == currentIndex,
                text: titlesList[index] ?? "ef",
                onTap: () {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
          ),
          const CustomSizedBox(
            height: 24,
          ),
          const FormItemWidget(
              title: "Policyholder ID", hintText: "Policyholder ID"),
          const CustomSizedBox(
            height: 24,
          ),
          const FormDateWidget(
            title: "Effective Date of Policy",
          ),
          const CustomSizedBox(
            height: 164,
          ),
          CustomGradientButton(
              onPressed: () {},
              child: Text(
                "Select type of Insurance",
                style: CustomThemes.whiteColoTextTheme(context).copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ))
        ],
      ),
    );
  }
}
