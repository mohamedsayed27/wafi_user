import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_router/screens_name.dart';
import 'package:wafi_user/presentation/business_logic/address_cubit/address_cubit.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/text_shimmer_widget.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../translations/locale_keys.g.dart';
import '../../widgets/reservations_widgets/location_details_container.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';
import '../../widgets/shared_widgets/gradient widgets.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Add Address",
      ),
      body: BlocConsumer<AddressCubit, AddressState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<AddressCubit>();
          return ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 32.h,
            ),
            children: [
              DetailsContainer(
                child: Row(
                  children: [
                    Expanded(
                      child: state is GetCurrentLocationLoading
                          ? const TextShimmerWidget()
                          : Text(
                              cubit.googleMapsSearchBarHint ?? "",
                              style: CustomThemes.greyColor1CTextStyle(context)
                                  .copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color:
                                    CustomThemes.greyColor1CTextStyle(context)
                                        .color!
                                        .withOpacity(0.8),
                              ),
                            ),
                    ),
                    const CustomSizedBox(
                      width: 16,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          ScreenName.addressGoogleMap,
                          arguments: [cubit],
                        );
                      },
                      child: GradientWidget(
                        gradientList: AppColors.gradientColorsList,
                        isGradient: true,
                        child: Text(
                          LocaleKeys.change.tr(),
                          style:
                              CustomThemes.whiteColoTextTheme(context).copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
