import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/constants/extensions.dart';
import '../../../presentation/business_logic/cart_cubit/cart_cubit.dart';
import '../../../presentation/widgets/shared_widgets/custom_sized_box.dart';
import '../../../core/assets_path/svg_path.dart';
import '../../../core/services/services_locator.dart';
import '../../../translations/locale_keys.g.dart';
import 'bottom_nav_bar_icon.dart';

class BottomNavBarWidget extends StatelessWidget {
  final void Function(int index) changeCurrentIndex;
  final int currentIndex;

  const BottomNavBarWidget({
    super.key,
    required this.changeCurrentIndex,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            BottomNavBarIcon(
              label: LocaleKeys.home.tr(),
              iconPath: SvgPath.home,
              onTap: () {
                changeCurrentIndex(0);
              },
              isSelected: currentIndex == 0,
            ),
            const CustomSizedBox(
              width: 12,
            ),
            BottomNavBarIcon(
              label: LocaleKeys.orders.tr(),
              iconPath: SvgPath.calendarSilhouette,
              onTap: () {
                changeCurrentIndex(1);
              },
              isSelected: currentIndex == 1,
            ),
          ],
        ).onlyDirectionalPadding(start: 8),
        Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                BottomNavBarIcon(
                  label: LocaleKeys.cart.tr(),
                  iconPath: SvgPath.cart,
                  onTap: () {
                    changeCurrentIndex(2);
                  },
                  isSelected: currentIndex == 2,
                ),
                BlocProvider<CartCubit>.value(
                  value: sl<CartCubit>(),
                  child: BlocBuilder<CartCubit, CartState>(builder: (context, state) {
                    var cubit = CartCubit.get(context);
                    return Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentIndex == 2 ? null : AppColors.greyColor9,
                        gradient: currentIndex == 2
                            ? LinearGradient(
                                colors: AppColors.gradientColorsList,
                                stops: const [-0.1097, 0.3978, 0.7435, 1.1446],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              )
                            : null,
                      ),
                      child: Text(
                        cubit.cartList.length.toString(),
                        style: CustomThemes.whiteColoTextTheme(context).copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }),
                )
              ],
            ),
            const CustomSizedBox(
              width: 12,
            ),
            BottomNavBarIcon(
              label: LocaleKeys.profile.tr(),
              iconPath: SvgPath.user,
              onTap: () {
                changeCurrentIndex(3);
              },
              isSelected: currentIndex == 3,
            ),
          ],
        ).onlyDirectionalPadding(end: 8)
      ],
    );
  }
}
