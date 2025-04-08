import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wafi_user/core/app_router/screens_name.dart';

import '../../../core/constants/extensions.dart';
import '../../../core/enums/address_status_enum.dart';
import '../../../data/models/address_model/address_model.dart';
import '../../../presentation/business_logic/address_cubit/address_cubit.dart';
import '../../../presentation/widgets/shared_widgets/text_shimmer_widget.dart';
import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/svg_path.dart';
import '../../../core/services/services_locator.dart';
import '../../screens/main_layout/main_layout.dart';
import '../shared_widgets/custom_sized_box.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.r),
          bottomRight: Radius.circular(8.r),
        ),
        gradient: const LinearGradient(
          colors: [
            AppColors.homeScreenGradientFirstColor,
            AppColors.fourthGradientColor,
          ],
          begin: Alignment(-0.9, -0.9),
          end: Alignment(1.0, 1.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  advancedDrawerController.showDrawer();
                },
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: const CircleBorder(),
                ),
                icon: SvgPicture.asset(
                  SvgPath.burgerMenu,
                  height: 17.h,
                  width: 24.w,
                  colorFilter: const ColorFilter.mode(
                    AppColors.whiteColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              BlocProvider(
                create: (context) => sl<AddressCubit>()..getUserAddressList(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocConsumer<AddressCubit, AddressState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        // Retrieve address list and active address logic
                        final addressCubit = context.read<AddressCubit>();
                        final addressList = addressCubit.addressList;

                        String addressText = "Add Address";
                        if (addressList.isNotEmpty) {
                          final activeAddress = addressList.firstWhere(
                                  (address) => address.status == AddressStatusEnum.active.name,
                              orElse: () => const AddressModel()
                          );
                          addressText = activeAddress.addressText ?? "Select Your Default Address";
                        }

                        return InkWell(
                          onTap: state is GetUserAddressLoading
                              ? null
                              : () {
                            Navigator.pushNamed(
                              context,
                              ScreenName.addressScreen,
                              arguments: [addressCubit],
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.location_on_rounded,
                                color: AppColors.whiteColor,
                                size: 15.r,
                              ),
                              const CustomSizedBox(width: 2),
                              state is GetUserAddressLoading
                                  ? const TextShimmerWidget(width: 80, height: 8)
                                  : Text(
                                addressText,
                                style: CustomThemes.whiteColoTextTheme(context).copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const CustomSizedBox(height: 2),
                    Container(
                      height: 0.9.h,
                      width: 140.w,
                      color: Colors.white,
                    ),
                  ],
                ),
              )
              ,
            ],
          ).onlyDirectionalPadding(end: 16),
        ],
      ),
    );
  }
}
