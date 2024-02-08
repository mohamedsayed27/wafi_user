import 'package:flutter/material.dart';
import 'package:wafi_user/core/constants/extensions.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';

import '../../../core/assets_path/svg_path.dart';
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
              label: "Home",
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
              label: "Orders",
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
            BottomNavBarIcon(
              label: "Cart",
              iconPath: SvgPath.cart,
              onTap: () {
                changeCurrentIndex(2);
              },
              isSelected: currentIndex == 2,
            ),
            const CustomSizedBox(
              width: 12,
            ),
            BottomNavBarIcon(
              label: "Profile",
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
