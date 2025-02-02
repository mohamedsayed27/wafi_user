part of 'cars_cubit.dart';

sealed class CarsState {}

final class CarsInitial extends CarsState {}

final class Loading extends CarsState {}
final class Success extends CarsState {}
final class Error extends CarsState {}
final class GetModelsLoading extends CarsState {}
final class GetModelsSuccess extends CarsState {}
final class GetModelsError extends CarsState {}
final class GetCarTypesLoading extends CarsState {}
final class GetCarTypesSuccess extends CarsState {}
final class GetCarTypesError extends CarsState {}


final class GetMyCarsListLoading extends CarsState {}
final class GetMyCarsListSuccess extends CarsState {}
final class GetMyCarsListError extends CarsState {}

final class InitResLoading extends CarsState {}
final class InitResSuccess extends CarsState {}
final class InitResError extends CarsState {}

final class UpdateDropDownValue extends CarsState {}


final class AddUserCarLoading extends CarsState {}
final class AddUserCarSuccess extends CarsState {
  final BaseResponseModel baseResponseModel;

  AddUserCarSuccess({required this.baseResponseModel});
}
final class AddUserCarError extends CarsState {}