import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/constants/extensions.dart';
import 'package:wafi_user/presentation/business_logic/cart_cubit/cart_cubit.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/gradiant_color_button.dart';
import 'package:wafi_user/translations/locale_keys.g.dart';

import '../../../core/app_router/screens_name.dart';
import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/svg_path.dart';
import '../../../core/enums/address_status_enum.dart';
import '../../../core/services/services_locator.dart';
import '../../../data/models/address_model/address_model.dart';
import '../../business_logic/address_cubit/address_cubit.dart';
import '../../widgets/cart_widgets/cart_item_widget.dart';
import '../../widgets/reservations_widgets/location_details_container.dart';
import '../../widgets/shared_widgets/bill_details_item.dart';
import '../../widgets/shared_widgets/custom_divider.dart';
import '../../widgets/shared_widgets/gradient_widgets.dart';
import '../../widgets/shared_widgets/gradient_svg.dart';
import '../../widgets/shared_widgets/text_shimmer_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.cart.tr(),
      ),
      body: BlocProvider<CartCubit>.value(
        value: sl<CartCubit>(),
        child: ListView(
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
            BlocBuilder<AddressCubit, AddressState>(
              builder: (context, state) {
                final addressCubit = context.read<AddressCubit>();
                final addressList = addressCubit.addressList;

                String addressText = "Add Address";
                if (addressList.isNotEmpty) {
                  final activeAddress = addressList.firstWhere(
                      (address) => address.status == AddressStatusEnum.active.name,
                      orElse: () => const AddressModel());
                  addressText = activeAddress.addressText ?? "Select Your Default Address";
                }

                return DetailsContainer(
                  child: Row(
                    children: [
                      Expanded(
                        child: state is GetUserAddressLoading
                            ? const TextShimmerWidget(width: 80, height: 8)
                            : Text(
                                addressText,
                                style: CustomThemes.greyColor1CTextStyle(context).copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  color: CustomThemes.greyColor1CTextStyle(context)
                                      .color!
                                      .withOpacity(0.8),
                                ),
                              ),
                      ),
                      const CustomSizedBox(
                        width: 16,
                      ),
                      TextButton(
                        onPressed: state is GetUserAddressLoading
                            ? null
                            : () {
                                Navigator.pushNamed(
                                  context,
                                  ScreenName.addressScreen,
                                  arguments: [addressCubit],
                                );
                              },
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
                );
              },
            ).symmetricPadding(horizontal: 16),
            const CustomSizedBox(
              height: 16,
            ),
            const CustomDivider(),
            _CartContentWidget(),
          ],
        ),
      ),
    );
  }
}

class _CartContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        var cubit = CartCubit.get(context);
        return cubit.cartList.isNotEmpty
            ? Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
                    ),
                    itemBuilder: (_, index) => CartItemWidget(
                      carSparePartModel: cubit.cartList[index],
                    ),
                    separatorBuilder: (_, index) => const CustomSizedBox(
                      height: 16,
                    ),
                    itemCount: cubit.cartList.length,
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
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return BillDetailsItem(
                          title: cubit.cartList[index].title ?? "",
                          balance:
                              "${cubit.cartList[index].price! * cubit.cartList[index].counter}");
                    },
                    itemCount: cubit.cartList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                  const CustomSizedBox(
                    height: 2,
                  ),
                  BillDetailsItem(
                    title: LocaleKeys.totalPayableAmount.tr(),
                    size: 15,
                    balance:
                        "${cubit.cartList.map((element) => element.counter * element.price!).reduce((value, element) => value + element)}",
                  ),
                  const CustomSizedBox(
                    height: 24,
                  ),
                  CustomGradientButton(
                    width: double.infinity,
                    onPressed: () {},
                    child: Text(
                      "Checkout",
                      style: CustomThemes.whiteColoTextTheme(context).copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ).onlyDirectionalPadding(start: 16),
                  const CustomSizedBox(
                    height: 40,
                  ),
                ],
              )
            : const SizedBox();
      },
    );
  }
}
