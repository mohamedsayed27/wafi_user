import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app_router/screens_name.dart';
import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/images_path.dart';
import '../../../core/assets_path/svg_path.dart';
import '../../widgets/main_layout_widgets/bottom_nav_bar_widget.dart';
import '../../widgets/main_layout_widgets/drawer_list_widget.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';
import '../../widgets/shared_widgets/gradient widgets.dart';
import '../../widgets/shared_widgets/gradient_svg.dart';
import '../booking_screens/orders_screen.dart';
import '../carts_screen/cart_screen.dart';
import '../home_screen/home_screen.dart';
import '../profile_screens/profile_screens.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

final advancedDrawerController = AdvancedDrawerController();

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const OrdersScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      controller: advancedDrawerController,
      backdropColor: AppColors.blackColor,
      openRatio: 0.52,
      disabledGestures: true,
      childDecoration: BoxDecoration(borderRadius: BorderRadius.circular(32.r)),
      drawer: ListView(
        padding: EdgeInsetsDirectional.only(
          top: 61.h,start: 16.w,
        ),
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Container(
              height: 54.h,
              width: 54.w,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                color: AppColors.greyColorF3,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                ImagesPath.userNullImage,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const CustomSizedBox(height: 16,),
          Text(
            "Hello!",
            style: CustomThemes.whiteColoTextTheme(context).copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "William Wilson 👋🏻",
            style: CustomThemes.whiteColoTextTheme(context).copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),const CustomSizedBox(
            height: 16,
          ),
          const DrawerListWidget(),
          const CustomSizedBox(height: 48,),
          ListTile(
            titleAlignment: ListTileTitleAlignment.center,
            contentPadding: EdgeInsets.zero,
            onTap: () {},
            leading: GradientSvg(
              svgDisabledColor: AppColors.whiteColor,
              svgPath: SvgPath.logout,
              isSelected: false,
              height: 22.h,
              width: 22.w,
            ),
            style: ListTileStyle.drawer,
            title: GradientWidget(
              gradientList: AppColors.gradientTextList,
              isGradient: false,
              child: Text(
                "Log Out",
                style: CustomThemes.whiteColoTextTheme(context).copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          )
        ],
      ),
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        // extendBody: true,
        body: screens[currentIndex],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox(
          height: 56,
          width: 56,
          child: Container(
            width: 56.w,
            height: 56.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.05),
                  offset: Offset(0, 2),
                  blurRadius: 4,
                ),
              ],
              gradient: LinearGradient(
                colors: AppColors.gradientColorsList,
                begin: const Alignment(-1.0, -1.0),
                end: const Alignment(1.0, 1.0),
                stops: const [-0.1097, 0.3978, 0.7435, 1.1446],
              ),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(50.r),
              onTap: () {
                Navigator.pushNamed(context, ScreenName.addYorCar);
              },
              child: Center(
                child: SvgPicture.asset(
                  SvgPath.addCar,
                  height: 38.h,
                  width: 38.w,
                  colorFilter: const ColorFilter.mode(
                      AppColors.whiteColor, BlendMode.srcIn),
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 10,
          color: AppColors.greyColorDC,
          padding: EdgeInsets.only(top: 16.h),
          surfaceTintColor: Colors.transparent,
          elevation: 5,
          height: 70.h,
          shadowColor: AppColors.shadowColor(),
          shape: const CircularNotchedRectangle(),
          child: BottomNavBarWidget(
            changeCurrentIndex: (index) {
              currentIndex = index;
              setState(() {});
            },
            currentIndex: currentIndex,
          ),
        ),
      ),
    );
  }
}

class BottomNavBarIconButton extends StatelessWidget {
  const BottomNavBarIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
