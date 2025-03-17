part of 'car_service_cubit.dart';

sealed class CarServiceState {}

final class CarServiceInitial extends CarServiceState {}


final class GetServiceListLoading extends CarServiceState {}

final class GetServiceListSuccess extends CarServiceState {
  final List<CarServiceModel>? services;

  GetServiceListSuccess(this.services);
}

final class GetServiceListError extends CarServiceState {
  final String message;

  GetServiceListError(this.message);
}


final class GetSubServiceListLoading extends CarServiceState {}

final class GetSubServiceListSuccess extends CarServiceState {
  final List<SubServiceModel>? subServices;

  GetSubServiceListSuccess(this.subServices);
}

final class GetSubServiceListError extends CarServiceState {
  final String message;

  GetSubServiceListError(this.message);
}


final class AddOrderServiceLoading extends CarServiceState {}

final class AddOrderServiceSuccess extends CarServiceState {
  final BaseResponseModel response;

  AddOrderServiceSuccess(this.response);
}

final class AddOrderServiceError extends CarServiceState {
  final String message;

  AddOrderServiceError(this.message);
}


final class GetCurrentLocationLoading extends CarServiceState {}
final class GetCurrentLocationSuccess extends CarServiceState {}
final class GetCurrentLocationError extends CarServiceState {
  final String error;

  GetCurrentLocationError({required this.error});

}
final class SelectSubService extends CarServiceState {}
final class SelectDateState extends CarServiceState {}
final class SelectTimeState extends CarServiceState {}
final class ChangeCameraPosition extends CarServiceState {}
final class ChangeCurrentPosition extends CarServiceState {}

final class GetSearchedLocationsLoading extends CarServiceState {}
final class GetSearchedLocationsSuccess extends CarServiceState {}
final class GetSearchedLocationsError extends CarServiceState {
  final String? error;

  GetSearchedLocationsError({ this.error});
}
