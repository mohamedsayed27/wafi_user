import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wafi_user/data/models/base_response_model.dart';
import 'package:wafi_user/data/models/base_response_model.dart';

import '../../../core/network/dio_helper.dart';
import '../../../core/error/error_exception.dart';
import '../../../core/network/api_end_points.dart';
import '../../../core/parameters/add_user_car_parameters.dart';
import '../../models/cars_models/get_all_car_types_models_model;.dart';

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
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<ErrorException, GetAllCarTypesAndModels>> getCarModels() async {
    try {
      final response = await dioHelper.getData(
        url: EndPoints.carModels,
      );
      return Right(GetAllCarTypesAndModels.fromJson(response.data));
    } catch (e) {
      rethrow;
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
      print("response ====> ${response.data}");
      return Right(BaseResponseModel.fromJson(response.data));
    } catch (e) {
      rethrow;
    }
  }
}
