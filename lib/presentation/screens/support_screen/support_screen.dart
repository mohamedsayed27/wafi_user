import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_router/screens_name.dart';
import 'package:wafi_user/core/constants/extensions.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/constants/constants.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              height: 145.h,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: AppColors.gradientColorsList,
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSizedBox(
                    height: preferredSize.height,
                  ),
                  Row(
                    children: [
                      const CustomSizedBox(
                        height: 32,
                        width: 32,
                        child: BackButton(
                          color: AppColors.whiteColor,
                          style: ButtonStyle(
                              padding:
                                  MaterialStatePropertyAll(EdgeInsets.zero)),
                        ),
                      ),
                      Text(
                        "Support",
                        style: CustomThemes.whiteColoTextTheme(context)
                            .copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                height: 1),
                      )
                    ],
                  ).onlyDirectionalPadding(
                    start: 8,
                  ),
                  // const CustomSizedBox(height: 12,),
                  TabBar(
                    indicatorColor: AppColors.whiteColor,
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    labelColor: AppColors.whiteColor,
                    unselectedLabelColor: AppColors.greyColor9,
                    labelStyle:
                        CustomThemes.whiteColoTextTheme(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedLabelStyle:
                        CustomThemes.whiteColoTextTheme(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    tabs: const [
                      Tab(
                        text: "Open ",
                      ),
                      Tab(
                        text: "Closed",
                      ),
                    ],
                    dividerColor: Colors.transparent,
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
                    itemBuilder: (_, index) => const ItemWidget(),
                    separatorBuilder: (_, index) => const CustomSizedBox(
                      height: 16,
                    ),
                    itemCount: 3,
                  ),
                  ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),

                    itemBuilder: (_, index) => const ItemWidget(),
                    separatorBuilder: (_, index) => const CustomSizedBox(
                      height: 16,
                    ),
                    itemCount: 3,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        Navigator.pushNamed(context, ScreenName.chatScreen,);
      },
      trailing: const Icon(
        Icons.arrow_forward_ios,
      ),
      shape:  OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.greyColor9, width: 0.2),borderRadius: BorderRadius.circular(8.r)),
      contentPadding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 8.w,),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Spare Parts",
            style: CustomThemes.greyColor99TextStyle(context).copyWith(
                fontSize: 14.sp, fontWeight: FontWeight.w700, height: 1,),
          ),
          const CustomSizedBox(
            height: 4,
          ),
          Text(
            "Payment stuck during ordering.",
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                fontSize: 14.sp, fontWeight: FontWeight.w700, height: 1,),
          ),
          const CustomSizedBox(
            height: 4,
          ),
          Text(
            "Dec 02, 2020  ·  03:00 pm",
            style: CustomThemes.greyColor99TextStyle(context).copyWith(
                fontSize: 12.sp, fontWeight: FontWeight.w700, height: 1),
          ),
        ],
      ),
    );
  }
}
