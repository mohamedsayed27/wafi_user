import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:map_picker/map_picker.dart';
import 'package:wafi_user/core/assets_path/lottie_path.dart';
import 'package:wafi_user/presentation/business_logic/car_service_cubit/car_service_cubit.dart';

import '../../../core/assets_path/svg_path.dart';
import '../shared_widgets/custom_sized_box.dart';
import '../shared_widgets/gradient_svg.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CarServiceCubit, CarServiceState>(
      listener: (context, state) {},
      builder: (context, state) {
        final carServiceCubit = CarServiceCubit.get(context);
        return carServiceCubit.getCurrentLocationLoading
            ? Center(
                child: Lottie.asset(LottiePath.loading),
              )
            : CustomSizedBox(
                height: double.infinity,
                width: double.infinity,
                child: MapPicker(
                  iconWidget: const GradientSvg(svgPath: SvgPath.mapPinLogo),
                  mapPickerController: carServiceCubit.mapPickerController,
                  child: GoogleMap(
                    myLocationEnabled: true,
                    zoomControlsEnabled: false,
                    myLocationButtonEnabled: false,
                    mapType: MapType.normal,
                    initialCameraPosition: carServiceCubit.cameraPosition,
                    onMapCreated: (GoogleMapController controller) {
                      carServiceCubit.mapController = controller;
                    },
                    onCameraMoveStarted: () {
                      carServiceCubit.mapPickerController.mapMoving!();
                    },
                    onCameraMove: (cameraPosition) {
                      carServiceCubit.cameraPosition = cameraPosition;
                    },
                    onCameraIdle: () async {
                      carServiceCubit.mapPickerController.mapFinishedMoving!();
                      carServiceCubit.changeCurrentLocation();
                    },
                  ),
                ),
              );
      },
    );
  }
}
