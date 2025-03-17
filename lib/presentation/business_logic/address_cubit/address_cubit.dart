import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_picker/map_picker.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:wafi_user/data/models/shared_models/place_mark_model.dart';

import '../../../core/services/google_maps_services.dart';
import '../../../data/data_source/remote_data_source/address_data_source.dart';
import '../../../data/models/address_model/address_model.dart';
import '../../../data/models/address_model/city_model.dart';
import '../../../data/models/address_model/country_model.dart';
import '../../../data/models/base_response_model.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final AddressDataSource _addressDataSource;
  final LocationService _locationService;

  AddressCubit(
    this._addressDataSource,
    this._locationService,
  ) : super(AddressInitial());

  static AddressCubit get(context)=> BlocProvider.of(context);
  List<AddressModel> addressList = [];

  Future<void> getUserAddressList() async {
    emit(GetUserAddressLoading());
    final result = await _addressDataSource.getUsersAddressList();
    result.fold(
      (error) => emit(GetUserAddressError(error.toString())),
      (addresses) {
        addressList = addresses;
        emit(GetUserAddressSuccess(addresses));
      },
    );
  }

  Future<void> getCountriesList() async {
    emit(GetCountriesLoading());
    final result = await _addressDataSource.getCountriesList();
    result.fold(
      (error) => emit(GetCountriesError(error.toString())),
      (countries) => emit(GetCountriesSuccess(countries)),
    );
  }

  Future<void> getCitiesList({
    required int id,
  }) async {
    emit(GetCitiesLoading());
    final result = await _addressDataSource.getCitiesList(
      id: id,
    );
    result.fold(
      (error) => emit(GetCitiesError(error.toString())),
      (cities) => emit(GetCitiesSuccess(cities)),
    );
  }

  Future<void> addAddress(AddressModel address) async {
    emit(AddAddressLoading());
    final result = await _addressDataSource.addAddress(address: address);
    result.fold(
      (error) => emit(AddAddressError(error.toString())),
      (response) => emit(AddAddressSuccess(response)),
    );
  }

  Future<void> updateAddress(AddressModel address) async {
    emit(UpdateAddressLoading());
    final result = await _addressDataSource.updateAddress(address: address);
    result.fold(
      (error) => emit(UpdateAddressError(error.toString())),
      (response) => emit(UpdateAddressSuccess(response)),
    );
  }

  Future<void> changeAddressStatus(int id) async {
    emit(ChangeStatusAddressLoading());
    final result = await _addressDataSource.changeAddressStatus(id: id);
    result.fold(
      (error) => emit(ChangeStatusAddressError(error.toString())),
      (response) => emit(ChangeStatusAddressSuccess(response)),
    );
  }

  Future<void> deleteAddress(String addressId) async {
    emit(DeleteAddressLoading());
    final result = await _addressDataSource.deleteAddress(addressId: addressId);
    result.fold(
      (error) => emit(DeleteAddressError(error.toString())),
      (response) => emit(DeleteAddressSuccess(response)),
    );
  }

  late CameraPosition? addressCameraPosition;

  late GoogleMapController mapController;

  final MapPickerController mapPickerController = MapPickerController();

  List<Placemark> placeMarks = [];
  String? googleMapsSearchBarHint;
  void getUserCurrentLocation() async {
    emit(GetCurrentLocationLoading());
    try {
      Position position = await _locationService.determinePosition();
      addressCameraPosition = CameraPosition(
        target: LatLng(
          position.latitude,
          position.longitude,
        ),
        zoom: 13,
      );

      placeMarks = await placemarkFromCoordinates(
        addressCameraPosition?.target.latitude ?? 0,
        addressCameraPosition?.target.longitude ?? 0,
      );
      googleMapsSearchBarHint = placeMarks.first.name ?? "";
      emit(GetCurrentLocationSuccess());
    } catch (error) {
      addressCameraPosition = const CameraPosition(
        target: LatLng(
          0.0,
          0.0,
        ),
      );
      emit(GetCurrentLocationError(error.toString()));
    }
  }

  List<PlaceResult> searchResults = [];
  final FloatingSearchBarController controller = FloatingSearchBarController();
  void onSearchedResultClicked(PlaceResult placeResult) async {
    addressCameraPosition = CameraPosition(
      target: LatLng(
        placeResult.geometry?.location.lat ?? 0,
        placeResult.geometry?.location.lng ?? 0,
      ),
      zoom: 14.4746,
    );
    googleMapsSearchBarHint = placeResult.name ?? "";
    moveCamera(
      cameraPosition: addressCameraPosition!,
    );
  }


  void searchPlaces(String query) async {
    emit(GetSearchedLocationsLoading());
    try {
      searchResults = await _locationService.searchPlaces(query);
      emit(GetSearchedLocationsSuccess());
    } catch (error) {
      emit(GetSearchedLocationsError(error: error.toString()));
    }
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
      addressCameraPosition?.target.latitude??0,
      addressCameraPosition?.target.longitude??0,
    );
    googleMapsSearchBarHint = placeMarks.first.name ?? "";
    emit(ChangeCurrentPosition());
  }

  void onCameraMove(CameraPosition cameraPosition) async {
    addressCameraPosition = cameraPosition;
    emit(OnCameraMoveSuccess());
  }
}
