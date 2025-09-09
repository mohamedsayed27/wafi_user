part of 'profile_cubit.dart';

sealed class ProfileState {}

class ProfileInitial extends ProfileState {}

class FetchUserDataLoading extends ProfileState {}

class FetchUserDataSuccess extends ProfileState {
  final UserDataModel userDataModel;

  FetchUserDataSuccess({
    required this.userDataModel,
  });
}

class FetchUserDataError extends ProfileState {
  final String error;

  FetchUserDataError({
    required this.error,
  });
}
