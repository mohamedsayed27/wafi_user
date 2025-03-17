import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:wafi_user/core/app_router/screens_name.dart';
import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/lottie_path.dart';
import '../../../core/constants/constants.dart';
import '../../../presentation/business_logic/address_cubit/address_cubit.dart';
import '../../../presentation/widgets/shared_widgets/custom_sized_box.dart';

import '../../../translations/locale_keys.g.dart';
import '../../widgets/address_widget/address_item_widget.dart';
import '../../widgets/shared_widgets/custom_app_bar.dart';
import '../../widgets/shared_widgets/gradient widgets.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressCubit, AddressState>(
      listener: (context, state) {
        if (state is ChangeStatusAddressLoading) {
          showProgressIndicator(context);
        } else if (state is ChangeStatusAddressSuccess) {
          Navigator.pop(context);
          showToast(errorType: 0, message: state.response.message ?? "");
          Navigator.pop(context);
          context.read<AddressCubit>().getUserAddressList();
        } else if (state is ChangeStatusAddressError) {
          Navigator.pop(context);
          showToast(errorType: 0, message: state.message);
        }
      },
      builder: (context, state) {
        final cubit = context.read<AddressCubit>();
        return Scaffold(
          appBar: CustomAppBar(
            title: LocaleKeys.address.tr(),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, ScreenName.addAddressScreen,
                      arguments: [cubit]);
                },
                child: GradientWidget(
                  gradientList: AppColors.gradientColorsList,
                  isGradient: true,
                  child: Text(
                    "+Add New Address",
                    style: CustomThemes.whiteColoTextTheme(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              )
            ],
          ),
          body: state is GetUserAddressLoading
              ? Center(
                  child: Lottie.asset(
                    LottiePath.loading,
                  ),
                )
              : ListView.separated(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 32.h,
                  ),
                  itemBuilder: (context, index) {
                    return AddressItemWidget(
                      address: cubit.addressList[index],
                      onChangeAddressClicked: () {
                        cubit.changeAddressStatus(
                            cubit.addressList[index].id ?? 0);
                      },
                    );
                  },
                  separatorBuilder: (_, index) {
                    return const CustomSizedBox(
                      height: 16,
                    );
                  },
                  itemCount: cubit.addressList.length,
                ),
        );
      },
    );
  }
}
