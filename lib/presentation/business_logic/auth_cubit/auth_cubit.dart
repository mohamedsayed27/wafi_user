import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafi_user/core/cache_helper/cache_keys.dart';
import 'package:wafi_user/core/cache_helper/shared_pref_methods.dart';
import 'package:wafi_user/data/models/auth_models/login_or_register_model.dart';
import 'package:wafi_user/data/models/auth_models/otp_model.dart';
import 'package:wafi_user/data/models/base_response_model.dart';

import '../../../core/services/services_locator.dart';
import '../../../data/data_source/remote_data_source/auth_remote_data_source.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRemoteDataSource _authRemoteDataSource ;

  AuthCubit(this._authRemoteDataSource) : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
  LoginOrRegisterModel? loginOrRegisterModel;

  void login({required String phone}) async {
    emit(LoginLoading());
    final response = await _authRemoteDataSource.login(
      phone: phone,
    );
    response.fold(
      (l) {
        emit(LoginError(
          message: l.baseErrorModel.message,
        ));
      },
      (r) {
        loginOrRegisterModel = r;
        emit(LoginSuccess(baseResponseModel: r.baseResponseModel));
      },
    );
  }

  void register({required String phone}) async {
    emit(RegisterLoading());
    final response = await _authRemoteDataSource.register(
      phone: phone,
    );
    response.fold(
      (l) {
        emit(
          RegisterError(
            error: l.baseErrorModel.message,
          ),
        );
      },
      (r) {
        loginOrRegisterModel = r;
        emit(RegisterSuccess(baseResponseModel: r.baseResponseModel));
      },
    );
  }

  void otp({
    required String code,
  }) async {
    emit(OtpLoading());
    final response = await _authRemoteDataSource.otp(
      phone: loginOrRegisterModel?.phone??"",
      code: code,
    );
    response.fold(
      (l) {
        emit(OtpError(error: l.baseErrorModel.message));
      },
      (r) async{
        await CacheHelper.saveData(key: CacheKeys.token, value: r.data?.token,);
        emit(OtpSuccess(otpModel: r));
      },
    );
  }
}
