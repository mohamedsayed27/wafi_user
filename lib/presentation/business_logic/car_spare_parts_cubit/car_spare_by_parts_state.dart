part of 'car_spare_by_parts_cubit.dart';

sealed class CarSparePartsState {}

final class CarSparePartsInitial extends CarSparePartsState {}

class GetCarSparePartsLoading extends CarSparePartsState {}

class GetCarSparePartsLoaded extends CarSparePartsState {
  final GetCarSparePartsProducts data;

  GetCarSparePartsLoaded({required this.data});
}

class GetCarSparePartsError extends CarSparePartsState {
  final String message;

  GetCarSparePartsError({required this.message});
}

class GetSparePartDetailsLoading extends CarSparePartsState {}

class GetSparePartDetailsLoaded extends CarSparePartsState {
  final CarSparePartModel data;

  GetSparePartDetailsLoaded({required this.data});
}

class GetSparePartDetailsError extends CarSparePartsState {
  final String message;

  GetSparePartDetailsError({required this.message});
}

class SearchCarSpareParts extends CarSparePartsState {}
