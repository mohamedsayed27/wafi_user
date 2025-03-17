import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../core/error/error_exception.dart';
import '../../../core/network/api_end_points.dart';
import '../../../core/network/dio_helper.dart';
import '../../../core/parameters/car_service_parameters.dart';
import '../../models/base_response_model.dart';
import '../../models/car_service_and_maintenance_models/car_service_model.dart';
import '../../models/car_service_and_maintenance_models/sub_service_model.dart';

class CarServiceAndMaintenanceDataSource {
  final DioHelper dioHelper;

  CarServiceAndMaintenanceDataSource({
    required this.dioHelper,
  });

  Future<Either<ErrorException, List<CarServiceModel>?>>
      getServiceList() async {
    try {
      final response = await dioHelper.getData(
        url: EndPoints.carServiceAndMaintenance,
      );
      return Right(List.from(response.data["data"]
          .map((element) => CarServiceModel.fromJson(element))));
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<ErrorException, List<SubServiceModel>?>> getsUBServiceList({
    required int id,
  }) async {
    try {
      final response = await dioHelper.getData(
        url: "${EndPoints.carServiceAndMaintenance}/$id",
      );
      return Right(List.from(response.data["data"].map((element) => SubServiceModel.fromJson(element))));
    } catch (e) {
      rethrow;
    }
  }



  Future<Either<ErrorException, BaseResponseModel>> addOrderService({
    required CarServicesParameters addCarParameters,
  }) async {
    try {
      final response = await dioHelper.postData(
        url: EndPoints.addOrderService,
        data: FormData.fromMap(
          addCarParameters.toJson(),
        ),
      );
      print("response ====> ${response.data}");
      return Right(BaseResponseModel.fromJson(response.data));
    } catch (e) {
      rethrow;
    }
  }
}
