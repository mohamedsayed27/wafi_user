import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:map_picker/map_picker.dart';
import 'package:wafi_user/core/app_theme/custom_themes.dart';
import 'package:wafi_user/core/assets_path/lottie_path.dart';
import 'package:wafi_user/core/constants/constants.dart';
import 'package:wafi_user/core/constants/extensions.dart';
import 'package:wafi_user/presentation/business_logic/address_cubit/address_cubit.dart';

import '../../../core/assets_path/svg_path.dart';
import '../../widgets/address_widget/address_search_bar_widget.dart';
import '../../widgets/shared_widgets/gradient_svg.dart';

class AddressGoogleMapsScreen extends StatefulWidget {
  const AddressGoogleMapsScreen({super.key});

  @override
  State<AddressGoogleMapsScreen> createState() =>
      _AddressGoogleMapsScreenState();
}

class _AddressGoogleMapsScreenState extends State<AddressGoogleMapsScreen> {
  @override
  void initState() {
    super.initState();
    if (context.read<AddressCubit>().addressCameraPosition == null) {
      context.read<AddressCubit>().getUserCurrentLocation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AddressCubit, AddressState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            final cubit = context.read<AddressCubit>();
            return cubit.addressCameraPosition != null
                ? Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      MapPicker(
                        iconWidget: const GradientSvg(
                          svgPath: SvgPath.mapPinLogo,
                        ),
                        mapPickerController: cubit.mapPickerController,
                        child: GoogleMap(
                          myLocationEnabled: true,
                          zoomControlsEnabled: false,
                          myLocationButtonEnabled: false,
                          mapType: MapType.normal,
                          initialCameraPosition: cubit.addressCameraPosition!,
                          onMapCreated: (GoogleMapController controller) {
                            cubit.mapController = controller;
                          },
                          onCameraMoveStarted: () {
                            cubit.mapPickerController.mapMoving!();
                          },
                          onCameraMove: (cameraPosition) {
                            cubit.addressCameraPosition = cameraPosition;
                          },
                          onCameraIdle: () async {
                            cubit.mapPickerController.mapFinishedMoving!();
                            cubit.changeCurrentLocation();
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const BackButton(),
                          Text(
                            cubit.googleMapsSearchBarHint ?? "",
                            style: CustomThemes.greyColor1CTextStyle(context)
                                .copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ).onlyDirectionalPadding(
                        top: preferredSize.height / 3,
                      ),
                      const AddressMapServiceSearchBarWidget(),
                    ],
                  )
                : Center(
                    child: Lottie.asset(
                      LottiePath.loading,
                    ),
                  );
          },
        ),
      ),
    );
  }
}
