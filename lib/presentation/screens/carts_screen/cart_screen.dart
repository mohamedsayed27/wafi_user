import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/constants/extensions.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:wafi_user/translations/locale_keys.g.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/svg_path.dart';
import '../../widgets/cart_widgets/cart_item_widget.dart';
import '../../widgets/reservations_widgets/location_details_container.dart';
import '../../widgets/shared_widgets/bill_details_item.dart';
import '../../widgets/shared_widgets/custom_divider.dart';
import '../../widgets/shared_widgets/gradient widgets.dart';
import '../../widgets/shared_widgets/gradient_svg.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.cart.tr(),
      ),
      body: Column(
        children: [
          const CustomSizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.dropOffAddress.tr(),
                style: CustomThemes.greyColor16TextStyle(context).copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
              GradientSvg(
                svgPath: SvgPath.mapsLocation,
                height: 18.h,
                width: 15.w,
              ),
            ],
          ).symmetricPadding(horizontal: 16),
          const CustomSizedBox(
            height: 8,
          ),
          DetailsContainer(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "503 Ida Ports, Abu Dhabi Emirate, Al Ain, Al Qou'",
                    style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: CustomThemes.greyColor1CTextStyle(context).color!.withOpacity(0.8),
                    ),
                  ),
                ),
                const CustomSizedBox(
                  width: 16,
                ),
                TextButton(
                  onPressed: () {},
                  child: GradientWidget(
                    gradientList: AppColors.gradientColorsList,
                    isGradient: true,
                    child: Text(
                      LocaleKeys.change.tr(),
                      style: CustomThemes.whiteColoTextTheme(context).copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ).symmetricPadding(horizontal: 16),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              itemBuilder: (_, index) => const CartItemWidget(),
              separatorBuilder: (_, index) => const CustomSizedBox(
                height: 16,
              ),
              itemCount: 2,
            ),
          ),
          const CustomDivider(),
          const CustomSizedBox(
            height: 16,
          ),
          Text(
            LocaleKeys.billDetails.tr(),
            style: CustomThemes.greyColor1CTextStyle(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ).onlyDirectionalPadding(start: 16),
          const CustomSizedBox(
            height: 8,
          ),
          BillDetailsItem(title: LocaleKeys.batteryService.tr(), balance: "100"),
          const CustomSizedBox(
            height: 2,
          ),
          BillDetailsItem(title: LocaleKeys.serviceTaxes.tr(), balance: "90"),
          const CustomSizedBox(
            height: 2,
          ),
          BillDetailsItem(title: LocaleKeys.cart.tr(), balance: "90"),
          const CustomSizedBox(
            height: 2,
          ),
          BillDetailsItem(title: LocaleKeys.cart.tr(), balance: "90"),
          const CustomSizedBox(
            height: 2,
          ),
          const CustomSizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
