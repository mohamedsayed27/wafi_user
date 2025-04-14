import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_theme/custom_themes.dart';
import 'package:wafi_user/core/constants/constants.dart';
import 'package:wafi_user/core/constants/extensions.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../translations/locale_keys.g.dart';
import '../../widgets/orders_container/pas_container.dart';
import '../../widgets/orders_container/up_coming_container.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              // height: 180.h,
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomSizedBox(
                    height: preferredSize.height,
                  ),
                  // IconButton(
                  //   onPressed: () {
                  //     advancedDrawerController.showDrawer();
                  //   },
                  //   style: OutlinedButton.styleFrom(
                  //     padding: EdgeInsets.zero,
                  //     shape: const CircleBorder(),
                  //   ),
                  //   icon: SvgPicture.asset(
                  //     SvgPath.burgerMenu,
                  //     height: 17.h,
                  //     width: 24.w,
                  //     colorFilter: const ColorFilter.mode(
                  //       AppColors.whiteColor,
                  //       BlendMode.srcIn,
                  //     ),
                  //   ),
                  // ),
                  Text(
                    LocaleKeys.orders.tr(),
                    style: CustomThemes.whiteColoTextTheme(context)
                        .copyWith(fontSize: 24.sp, fontWeight: FontWeight.bold, height: 1),
                  ).onlyDirectionalPadding(
                    start: 8,
                  ),
                  TabBar(
                    indicatorColor: AppColors.whiteColor,
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    labelColor: AppColors.whiteColor,
                    unselectedLabelColor: AppColors.whiteColor,
                    labelStyle: CustomThemes.whiteColoTextTheme(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedLabelStyle: CustomThemes.whiteColoTextTheme(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    tabs: [
                      Tab(
                        text: LocaleKeys.upcoming.tr(),
                      ),
                      Tab(
                        text: LocaleKeys.past.tr(),
                      ),
                    ],
                    dividerColor: Colors.transparent,
                  ),
                  const CustomSizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
                  itemBuilder: (_, index) => UpComingContainer(
                    confirmed: index == 0 ? false : true,
                    confirmedWithAgent: index == 1 ? true : false,
                  ),
                  separatorBuilder: (_, index) => const CustomSizedBox(
                    height: 16,
                  ),
                  itemCount: 3,
                ),
                ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
                  itemBuilder: (_, index) => PastContainer(
                    completed: index == 2 ? false : true,
                    isRated: index == 1 ? true : false,
                  ),
                  separatorBuilder: (_, index) => const CustomSizedBox(
                    height: 16,
                  ),
                  itemCount: 3,
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
