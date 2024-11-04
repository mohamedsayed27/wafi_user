part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoading extends AuthState {}
final class LoginSuccess extends AuthState {
  final BaseResponseModel? baseResponseModel;

  LoginSuccess({ this.baseResponseModel});
}
final class LoginError extends AuthState {
  final String message;

  LoginError({required this.message});
}

final class RegisterLoading extends AuthState {}
final class RegisterSuccess extends AuthState {
  final BaseResponseModel? baseResponseModel;

  RegisterSuccess({ this.baseResponseModel});
}
final class RegisterError extends AuthState {
  final String error;

  RegisterError({required this.error});
}

final class OtpLoading extends AuthState {}
final class OtpSuccess extends AuthState {
  final OtpModel otpModel;

  OtpSuccess({required this.otpModel});
}
final class OtpError extends AuthState {
  final String error;

  OtpError({required this.error});
}

