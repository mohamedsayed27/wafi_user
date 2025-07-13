import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wafi_user/data/models/auth_models/otp_model.dart';

import '../../../core/network/dio_helper.dart';
import '../../../core/error/error_exception.dart';
import '../../../core/network/api_end_points.dart';
import '../../../core/network/error_message_model.dart';
import '../../models/auth_models/login_or_register_model.dart';

class AuthRemoteDataSource {
  final DioHelper dioHelper;

  AuthRemoteDataSource({
    required this.dioHelper,
  });

  Future<Either<ErrorException, LoginOrRegisterModel>> login({
    required String phone,
  }) async {
    try {
      final response = await dioHelper.postData(
        url: EndPoints.login,
        data: FormData.fromMap({
          "phone": phone,
        }),
      );
      return Right(LoginOrRegisterModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(
        ErrorException(
          baseErrorModel: BaseErrorModel(
            message: e.error.toString(),
            status: e.response?.statusCode?.toString() ?? "",
            data: e.response.toString(),
          ),
        ),
      );
    }
  }

  Future<Either<ErrorException, LoginOrRegisterModel>> register({
    required String phone,
  }) async {
    try {
      final response = await dioHelper.postData(
        url: EndPoints.register,
        data: FormData.fromMap({
          "phone": phone,
        }),
      );
      return Right(LoginOrRegisterModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(
        ErrorException(
          baseErrorModel: BaseErrorModel(
            message: e.error.toString(),
            status: e.response?.statusCode?.toString() ?? "",
            data: e.response.toString(),
          ),
        ),
      );
    }
  }

  Future<Either<ErrorException, OtpModel>> otp({
    required String phone,
    required String code,
  }) async {
    try {
      final response = await dioHelper.postData(
        url: EndPoints.otp,
        data: FormData.fromMap({
          "phone": phone,
          "otp": code,
        }),
      );
      return Right(OtpModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(
        ErrorException(
          baseErrorModel: BaseErrorModel(
            message: e.error.toString(),
            status: e.response?.statusCode?.toString() ?? "",
            data: e.response.toString(),
          ),
        ),
      );
    }
  }
}
