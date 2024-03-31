import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:wafi_user/core/app_theme/custom_themes.dart';
import 'package:wafi_user/core/assets_path/fonts_path.dart';
import 'package:wafi_user/core/assets_path/svg_path.dart';
import 'package:wafi_user/core/constants/constants.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradient%20widgets.dart';
import '../../../core/app_theme/app_colors.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';
import '../../widgets/shared_widgets/gradiant_color_button.dart';

class ServicesOnMapScreen extends StatefulWidget {
  final String title;

  const ServicesOnMapScreen({super.key, required this.title});

  @override
  State<ServicesOnMapScreen> createState() => _ServicesOnMapScreenState();
}

class _ServicesOnMapScreenState extends State<ServicesOnMapScreen> {
  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const CustomSizedBox(
            height: double.infinity,
            width: double.infinity,
            child: GoogleMap(
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  23.61108120291162,
                  45.286281856525534,
                ),
                zoom: 11.5,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, -1.h),
                  blurRadius: 16.r,
                  color: AppColors.shadowColor(value: 0.1),
                )
              ],
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16.r),
                topLeft: Radius.circular(16.r),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Select Service",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const CustomSizedBox(
                  height: 16,
                ),
                GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 168.w / 48.h,
                    crossAxisSpacing: 8.w,
                    mainAxisSpacing: 16.h,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return const ServicesDetailsWidget();
                  },
                  itemCount: 4,
                ),
                const CustomSizedBox(
                  height: 16,
                ),
                CustomGradientButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Continue",
                        style:
                            CustomThemes.whiteColoTextTheme(context).copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const CustomSizedBox(
                        width: 8,
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: AppColors.whiteColor,
                      )
                    ],
                  ),
                  onPressed: () {},
                ),
                const CustomSizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          PositionedDirectional(
            top: preferredSize.height,
            start: 0,
            child: Row(
              children: [
                BackButton(),
                Text(
                  widget.title,
                  style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          FloatingSearchBar(
            hint: 'Search...',
            scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
            transitionDuration: const Duration(milliseconds: 800),
            transitionCurve: Curves.easeInOut,
            physics: const BouncingScrollPhysics(),
            margins: EdgeInsets.only(
              top: preferredSize.height * 2,
              left: 16.w,
              right: 16.w,
            ),
            axisAlignment: isPortrait ? 0.0 : -1.0,
            openAxisAlignment: 0.0,
            width: isPortrait ? 600 : 500,
            debounceDelay: const Duration(milliseconds: 500),
            onQueryChanged: (query) {
              // Call your model, bloc, controller here.
            },
            // Specify a custom transition to be used for
            // animating between opened and closed stated.
            transition: CircularFloatingSearchBarTransition(),
            leadingActions: [
              FloatingSearchBarAction(
                showIfOpened: false,
                child: CircularButton(
                  onPressed: (){},
                  icon: GradientWidget(gradientList: AppColors.gradientColorsList, child: SvgPicture.asset(SvgPath.mapsLocation,height: 20,width: 13,)),
              ),)
            ],
            actions: [
              FloatingSearchBarAction(
                showIfOpened: false,
                child: CircularButton(
                  icon: GradientWidget(gradientList: AppColors.gradientColorsList, child: SvgPicture.asset(SvgPath.send,height: 20,width: 20,)),
                  onPressed: () {},
                ),
              ),
              FloatingSearchBarAction.searchToClear(
                showIfClosed: false,
              ),
            ],
            builder: (context, transition) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Material(
                  color: Colors.white,
                  elevation: 4.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                        10,
                        (index) => Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, -8),
                                    color: AppColors.shadowColor(),
                                    blurRadius: 8.r,
                                  ),
                                ],
                              ),
                            )),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class ServicesDetailsWidget extends StatelessWidget {
  const ServicesDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.symmetric(
        horizontal: 0.5.w,
        vertical: 0.5.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        gradient: LinearGradient(
          colors: AppColors.gradientColorsList,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: AppColors.greyColorF7,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "Body Repair",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Starts from",
                  style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                    fontSize: 12.sp,
                    height: 1,
                    fontWeight: FontWeight.w700,
                    color: AppColors.color1C.withOpacity(0.5),
                  ),
                ),
                const CustomSizedBox(
                  height: 2,
                ),
                Text(
                  "90 SR",
                  style: TextStyle(
                    fontSize: 12.sp,
                    height: 1,
                    fontWeight: FontWeight.w700,
                    fontFamily: FontsPath.almarai,
                    color: AppColors.greenColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
