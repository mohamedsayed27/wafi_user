part of 'address_cubit.dart';

sealed class AddressState {}

final class AddressInitial extends AddressState {}

// Get User Address List States
final class GetUserAddressLoading extends AddressState {}

final class GetUserAddressSuccess extends AddressState {
  final List<AddressModel>? addresses;
  GetUserAddressSuccess(this.addresses);
}

final class GetUserAddressError extends AddressState {
  final String message;
  GetUserAddressError(this.message);
}

// Get Countries List States
final class GetCountriesLoading extends AddressState {}

final class GetCountriesSuccess extends AddressState {
  final GetCountriesModel countries;
  GetCountriesSuccess(this.countries);
}

final class GetCountriesError extends AddressState {
  final String message;
  GetCountriesError(this.message);
}

// Get Cities List States
final class GetCitiesLoading extends AddressState {}

final class GetCitiesSuccess extends AddressState {
  final GetCitiesModel cities;
  GetCitiesSuccess(this.cities);
}

final class GetCitiesError extends AddressState {
  final String message;
  GetCitiesError(this.message);
}

// Add Address States
final class AddAddressLoading extends AddressState {}

final class AddAddressSuccess extends AddressState {
  final BaseResponseModel response;
  AddAddressSuccess(this.response);
}

final class AddAddressError extends AddressState {
  final String message;
  AddAddressError(this.message);
}

// Update Address States
final class UpdateAddressLoading extends AddressState {}

final class UpdateAddressSuccess extends AddressState {
  final BaseResponseModel response;
  UpdateAddressSuccess(this.response);
}

final class UpdateAddressError extends AddressState {
  final String message;
  UpdateAddressError(this.message);
}
final class ChangeStatusAddressLoading extends AddressState {}

final class ChangeStatusAddressSuccess extends AddressState {
  final BaseResponseModel response;
  ChangeStatusAddressSuccess(this.response);
}

final class ChangeStatusAddressError extends AddressState {
  final String message;
  ChangeStatusAddressError(this.message);
}

// Delete Address States
final class DeleteAddressLoading extends AddressState {}

final class DeleteAddressSuccess extends AddressState {
  final BaseResponseModel response;
  DeleteAddressSuccess(this.response);
}

final class DeleteAddressError extends AddressState {
  final String message;
  DeleteAddressError(this.message);
}

final class GetCurrentLocationLoading extends AddressState {}

final class GetCurrentLocationSuccess extends AddressState {}

final class GetCurrentLocationError extends AddressState {
  final String message;
  GetCurrentLocationError(this.message);
}

final class InitAddressCameraPositionOnEditAddressLoading extends AddressState {}

final class InitAddressCameraPositionOnEditAddressSuccess extends AddressState {}

final class InitAddressCameraPositionOnEditAddressError extends AddressState {
  final String message;
  InitAddressCameraPositionOnEditAddressError(this.message);
}

final class GetSearchedLocationsLoading extends AddressState {}

final class GetSearchedLocationsSuccess extends AddressState {}

final class GetSearchedLocationsError extends AddressState {
  final String error;
  GetSearchedLocationsError({required this.error});
}

final class ChangeLocationLoading extends AddressState {}

final class ChangeCameraPosition extends AddressState {}
final class ChangeCurrentPosition extends AddressState {}
final class OnCameraMoveSuccess extends AddressState {}

final class ChangeLocationSuccess extends AddressState {}

final class ChangeLocationError extends AddressState {
  final String message;
  ChangeLocationError(this.message);
}
