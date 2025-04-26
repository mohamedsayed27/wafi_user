import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/lottie_path.dart';
import '../../../core/assets_path/svg_path.dart';
import '../../../core/constants/constants.dart';
import '../../../translations/locale_keys.g.dart';
import '../../business_logic/car_service_cubit/car_service_cubit.dart';
import '../shared_widgets/gradient_widgets.dart';

class MapServiceSearchBarWidget extends StatelessWidget {
  const MapServiceSearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarServiceCubit, CarServiceState>(
      builder: (context, state) {
        CarServiceCubit cubit = CarServiceCubit.get(context);
        return FloatingSearchBar(
          hint: cubit.controller.query.isEmpty
              ? cubit.googleMapsSearchBarHint.isNotEmpty
                  ? cubit.googleMapsSearchBarHint
                  : '${LocaleKeys.search.tr()}...'
              : cubit.controller.query,
          scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
          transitionDuration: const Duration(milliseconds: 800),
          transitionCurve: Curves.easeInOut,
          controller: cubit.controller,
          physics: const BouncingScrollPhysics(),
          margins: EdgeInsets.only(
            top: preferredSize.height * 1.5,
            left: 16.w,
            right: 16.w,
          ),
          axisAlignment: 0.0,
          openAxisAlignment: 0.0,
          width: double.infinity - 100,
          debounceDelay: const Duration(milliseconds: 500),
          onQueryChanged: (query) {
            cubit.searchPlaces(query);
          },
          transition: CircularFloatingSearchBarTransition(),
          leadingActions: [
            FloatingSearchBarAction(
              showIfOpened: false,
              child: GradientWidget(
                gradientList: AppColors.gradientColorsList,
                child: SvgPicture.asset(
                  SvgPath.mapsLocation,
                  height: 20,
                  width: 13,
                ),
              ),
            ),
          ],
          actions: [],
          builder: (context, transition) {
            return state is GetSearchedLocationsLoading
                ? Center(
                    child: Lottie.asset(LottiePath.loading),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Material(
                      color: Colors.white,
                      elevation: 4.0,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          cubit.searchResults.length,
                          (index) => ListTile(
                            onTap: () {
                              cubit.controller.close();
                              cubit.onSearchedResultClicked(cubit.searchResults[index]);
                            },
                            shape: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: AppColors.borderColor,
                              width: 1.5.w,
                            )),
                            title: Text(
                              cubit.searchResults[index].formattedAddress ?? "",
                              style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
          },
        );
      },
    );
  }
}
