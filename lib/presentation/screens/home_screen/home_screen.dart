import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_router/screens_name.dart';
import 'package:wafi_user/core/app_theme/app_colors.dart';
import 'package:wafi_user/core/assets_path/fonts_path.dart';
import 'package:wafi_user/core/constants/dummy_data.dart';
import 'package:wafi_user/core/constants/extensions.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradient%20widgets.dart';

import '../../widgets/home_screen_widgets/categories_widget.dart';
import '../../widgets/home_screen_widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeAppBar(),
          const CustomSizedBox(
            height: 22,
          ),
          GradientWidget(
            gradientList: AppColors.gradientColorsList,
            child: Text(
              "Our Services",
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: FontsPath.almarai,
                fontWeight: FontWeight.w700,
              ),
            ),
          ).onlyDirectionalPadding(
            start: 16,
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                return InkWell(
                  onTap: (){
                    if(index==0)Navigator.pushNamed(context, ScreenName.servicesAndMaintananceScreen);
                    if(index==1)Navigator.pushNamed(context, ScreenName.sparePartsScreen);
                    if(index==2)Navigator.pushNamed(context, ScreenName.searchToRentCarScreen);
                    if(index==3){
                      exit(0);
                    }
                  },
                  child: CategoriesWidget(
                    imagePath: DummyData.categoriesList[index]["image"],
                    title: DummyData.categoriesList[index]["title"],
                  ),
                );
              },
              separatorBuilder: (_, index) {
                return const CustomSizedBox(
                  height: 24,
                );
              },
              itemCount: DummyData.categoriesList.length,
            ),
          )
        ],
      ),
    );
  }
}
