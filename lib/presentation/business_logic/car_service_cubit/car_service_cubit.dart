import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_picker/map_picker.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

import '../../../core/error/error_exception.dart';
import '../../../core/parameters/car_service_parameters.dart';
import '../../../core/services/google_maps_services.dart';
import '../../../data/data_source/remote_data_source/car_service_and_maintenance_data_source.dart';
import '../../../data/models/base_response_model.dart';
import '../../../data/models/car_service_and_maintenance_models/car_service_model.dart';
import '../../../data/models/car_service_and_maintenance_models/sub_service_model.dart';
import '../../../data/models/shared_models/place_mark_model.dart';

part 'car_service_state.dart';

class CarServiceCubit extends Cubit<CarServiceState> {
  final CarServiceAndMaintenanceDataSource _dataSource;
  final LocationService _locationService;

  CarServiceCubit(this._dataSource, this._locationService) : super(CarServiceInitial());

  static CarServiceCubit get(context) => BlocProvider.of(context);

  SubServiceModel? selectedSubServiceList;

  late CameraPosition cameraPosition;

  bool getCurrentLocationLoading = false;
  DateTime? serviceDateSelected;
  TimeOfDay? serviceTimeSelected;
  final FloatingSearchBarController controller = FloatingSearchBarController();
  List<Placemark> placeMarks = [];
  String googleMapsSearchBarHint = "";

  late GoogleMapController mapController;

  final MapPickerController mapPickerController = MapPickerController();

  void selectServiceList(SubServiceModel subServiceModel) {
    if (selectedSubServiceList != subServiceModel) {
      selectedSubServiceList = subServiceModel;
    } else {
      selectedSubServiceList = null;
    }
    emit(SelectSubService());
  }

  void selectDate(DateTime? date) {
    serviceDateSelected = date;
    emit(SelectDateState());
  }

  void selectTime(TimeOfDay? time) {
    serviceTimeSelected = time;
    emit(SelectTimeState());
  }

  void getCurrentLocation() async {
    getCurrentLocationLoading = true;
    cameraPosition = const CameraPosition(
      target: LatLng(30.043174148962876, 31.21029107536478),
      zoom: 14.4746,
    );
    emit(GetCurrentLocationLoading());
    try {
      final position = await _locationService.determinePosition();
      cameraPosition = CameraPosition(
        target: LatLng(
          position.latitude,
          position.longitude,
        ),
        zoom: 14.4746,
      );
      getCurrentLocationLoading = false;

      placeMarks = await placemarkFromCoordinates(
        cameraPosition.target.latitude,
        cameraPosition.target.longitude,
      );
      controller.query = placeMarks.first.name ?? "";
      emit(GetCurrentLocationSuccess());
    } on LocationException catch (error) {
      getCurrentLocationLoading = false;
      cameraPosition = const CameraPosition(
        target: LatLng(30.043174148962876, 31.21029107536478),
        zoom: 14.4746,
      );
      placeMarks = await placemarkFromCoordinates(
        cameraPosition.target.latitude,
        cameraPosition.target.longitude,
      );
      controller.query = placeMarks.first.name ?? "";
      emit(GetCurrentLocationError(error: error.message));
    }
  }

  void onSearchedResultClicked(PlaceResult placeResult) async {
    cameraPosition = CameraPosition(
      target: LatLng(
        placeResult.geometry?.location.lat ?? 0,
        placeResult.geometry?.location.lng ?? 0,
      ),
      zoom: 14.4746,
    );
    googleMapsSearchBarHint = placeResult.name ?? "";
    moveCamera(
      cameraPosition: cameraPosition,
    );
  }

  void moveCamera({
    required CameraPosition cameraPosition,
  }) async {
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosition),
    );
    emit(ChangeCameraPosition());
  }

  void changeCurrentLocation() async {
    placeMarks = await placemarkFromCoordinates(
      cameraPosition.target.latitude,
      cameraPosition.target.longitude,
    );
    controller.query = placeMarks.first.name ?? "";
    emit(ChangeCurrentPosition());
  }

  List<CarServiceModel>? serviceList = [];
  CarServiceModel? carServiceModel;
  Future<void> getServiceList() async {
    emit(GetServiceListLoading());
    try {
      final Either<ErrorException, List<CarServiceModel>?> result =
          await _dataSource.getServiceList();

      result.fold(
        (error) => emit(GetServiceListError(error.baseErrorModel.message)),
        (services) {
          serviceList = services ?? [];
          emit(GetServiceListSuccess(services));
        },
      );
    } catch (e) {
      emit(GetServiceListError(e.toString()));
    }
  }

  List<SubServiceModel>? subServiceList = [];
  bool getSubServiceLoading = false;

  Future<void> getSubServiceList({required int id}) async {
    getSubServiceLoading = true;
    emit(GetSubServiceListLoading());
    try {
      final Either<ErrorException, List<SubServiceModel>?> result =
          await _dataSource.getsUBServiceList(id: id);

      result.fold(
        (error) {
          getSubServiceLoading = false;
          emit(GetSubServiceListError(error.baseErrorModel.message));
        },
        (subServices) {
          subServiceList = subServices ?? [];
          getSubServiceLoading = false;
          emit(GetSubServiceListSuccess(subServices));
        },
      );
    } catch (e) {
      emit(GetSubServiceListError(e.toString()));
    }
  }

  Future<void> addOrderService({
    required CarServicesParameters parameters,
  }) async {
    emit(AddOrderServiceLoading());
    try {
      final Either<ErrorException, BaseResponseModel> result =
          await _dataSource.addOrderService(addCarParameters: parameters);

      result.fold(
        (error) => emit(AddOrderServiceError(error.baseErrorModel.message)),
        (response) => emit(AddOrderServiceSuccess(response)),
      );
    } catch (e) {
      emit(AddOrderServiceError(e.toString()));
    }
  }

  List<PlaceResult> searchResults = [];

  void searchPlaces(String query) async {
    emit(GetSearchedLocationsLoading());
    try {
      searchResults = await _locationService.searchPlaces(query);
      emit(GetSearchedLocationsSuccess());
    } catch (error) {
      emit(GetCurrentLocationError(error: error.toString()));
    }
  }
}
