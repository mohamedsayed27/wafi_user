import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/assets_path/svg_path.dart';
import 'package:wafi_user/presentation/widgets/car_insurance_widgets/other_details_component.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_outlined_button.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/form_date_item.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/form_drom_down_widget.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/form_item_widget.dart';
import 'package:wafi_user/presentation/widgets/spare_barts/check_box_with_title.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/constants/constants.dart';
import '../../widgets/car_insurance_widgets/add_driver_button_widget.dart';
import '../../widgets/car_insurance_widgets/add_driver_component.dart';
import '../../widgets/shared_widgets/switch_button_and_title_widget.dart';

class AddDriverScreen extends StatefulWidget {
  final int currentIndex;

  const AddDriverScreen({super.key, required this.currentIndex});

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

  @override
  void initState() {
    currentIndex = widget.currentIndex;
    super.initState();
  }

  late int currentIndex;


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
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 32.h,
        ),
        children: [
          Material(
            type: MaterialType.transparency,
            child: Hero(
              tag: "addDriver",
              child: Row(
                children: List.generate(
                  titlesList.length,
                  (index) {
                    return index.isOdd
                        ? const CustomSizedBox(
                            width: 24,
                          )
                        : Expanded(
                            child: GradientSelectButtonWidget(
                              onTap: () {
                                currentIndex = index;
                                setState(() {});
                              },
                              isButtonSelected: currentIndex == index,
                              svgPath: titlesList[index]?["image"],
                              title: titlesList[index]?["title"],
                            ),
                          );
                  },
                ),
              ),
            ),
          ),
          CustomSizedBox(height: 24,),
          currentIndex==0?AddDriverComponent():OtherDetailsComponent(),
        ],
      ),
    );
  }
}

class TitleBodyTextRow extends StatelessWidget {
  final String title;
  final String body;

  const TitleBodyTextRow({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: CustomThemes.greyColor1CTextStyle(context).copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          body,
          style: CustomThemes.greyColor75TextStyle(context).copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
