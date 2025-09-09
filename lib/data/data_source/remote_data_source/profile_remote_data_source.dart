import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wafi_user/core/network/api_end_points.dart';

import '../../../core/error/error_exception.dart';
import '../../../core/network/dio_helper.dart';
import '../../../core/network/error_message_model.dart';
import '../../models/profile_model/user_data_model.dart';
import '../../models/profile_model/user_data_params.dart';

class ProfileDataSource {
  final DioHelper dioHelper;

  ProfileDataSource({required this.dioHelper});

  Future<Either<ErrorException, GetUserDataModel>> getProfile() async {
    try {
      final response = await dioHelper.getData(
        url: EndPoints.userData,
      );
      return Right(GetUserDataModel.fromJson(response.data));
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

  Future<Either<ErrorException, GetUserDataModel>> update({
    required UserDataParams params,
  }) async {
    try {
      final response = await dioHelper.postData(
        url: EndPoints.updateData,
        data: FormData.fromMap(
          await params.toJson(),
        ),
      );
      return Right(GetUserDataModel.fromJson(response.data));
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
