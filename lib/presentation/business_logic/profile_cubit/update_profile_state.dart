part of 'update_profile_cubit.dart';

sealed class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateUserDataLoading extends UpdateProfileState {}

class UpdateUserDataSuccess extends UpdateProfileState {
  final GetUserDataModel userDataModel;

  UpdateUserDataSuccess({
    required this.userDataModel,
  });
}

class UpdateUserDataError extends UpdateProfileState {
  final String error;

  UpdateUserDataError({
    required this.error,
  });
}

class ChangeProfileData extends UpdateProfileState {
  final bool isDataChanged;

  ChangeProfileData({
    required this.isDataChanged,
  });
}

class PickImageLoading extends UpdateProfileState {}

class PickImageSuccess extends UpdateProfileState {}

class PickImageError extends UpdateProfileState {
  final String error;

  PickImageError({
    required this.error,
  });
}
