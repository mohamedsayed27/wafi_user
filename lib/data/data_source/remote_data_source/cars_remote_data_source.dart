import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wafi_user/data/models/cars_models/car_model.dart';

import '../../../core/network/dio_helper.dart';
import '../../../core/error/error_exception.dart';
import '../../../core/network/api_end_points.dart';
import '../../../core/network/error_message_model.dart';
import '../../../core/parameters/add_user_car_parameters.dart';
import '../../models/base_response_model.dart';
import '../../models/cars_models/get_all_car_types_models_model.dart';

class CarsRemoteDataSource {
  final DioHelper dioHelper;

  CarsRemoteDataSource({
    required this.dioHelper,
  });

  Future<Either<ErrorException, GetAllCarTypesAndModels>> getCarTypes() async {
    try {
      final response = await dioHelper.getData(
        url: EndPoints.carTypes,
      );
      return Right(GetAllCarTypesAndModels.fromJson(response.data));
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

  Future<Either<ErrorException, GetAllCarTypesAndModels>> getCarModels() async {
    try {
      final response = await dioHelper.getData(
        url: EndPoints.carModels,
      );
      return Right(GetAllCarTypesAndModels.fromJson(response.data));
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

  Future<Either<ErrorException, List<CarModel>>> getMyCarsList() async {
    try {
      final response = await dioHelper.getData(
        url: EndPoints.myUserCars,
      );
      return Right(
          List<CarModel>.from(response.data?["data"]?.map((e) => CarModel.fromJson(e)) ?? []));
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

  Future<Either<ErrorException, BaseResponseModel>> addUserCar({
    required AddCarParameters addCarParameters,
  }) async {
    try {
      final response = await dioHelper.postData(
        url: EndPoints.addUserCar,
        data: FormData.fromMap(
          addCarParameters.toMap(),
        ),
      );
      return Right(BaseResponseModel.fromJson(response.data));
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

  Future<Either<ErrorException, BaseResponseModel>> updateUserCar({
    required AddCarParameters addCarParameters,
  }) async {
    try {
      final response = await dioHelper.postData(
        url: EndPoints.editCar,
        data: FormData.fromMap(
          addCarParameters.toMap(),
        ),
      );
      return Right(BaseResponseModel.fromJson(response.data));
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

  Future<Either<ErrorException, BaseResponseModel>> deleteUserCar({
    required String carId,
  }) async {
    try {
      final response = await dioHelper.postData(
        url: EndPoints.deleteCar,
        data: FormData.fromMap(
          {
            "user_car_id": carId,
          },
        ),
      );
      return Right(BaseResponseModel.fromJson(response.data));
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
