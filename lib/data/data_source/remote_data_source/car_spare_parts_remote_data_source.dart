import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wafi_user/core/network/dio_helper.dart';
import 'package:wafi_user/data/models/base_response_model.dart';

import '../../../core/error/error_exception.dart';
import '../../../core/network/api_end_points.dart';
import '../../../core/parameters/spare_by_quotation_parameters.dart';
import '../../models/car_spare_parts_model/car_spare_part_model.dart';

class CarSparePartsRemoteDataSource {
  final DioHelper dioHelper;

  CarSparePartsRemoteDataSource({required this.dioHelper});

  Future<Either<ErrorException, GetCarSparePartsProducts>> getCarSparePartsProducts() async {
    try {
      final response = await dioHelper.getData(
        url: EndPoints.carSparePartsProduct,
      );
      return Right(GetCarSparePartsProducts.fromJson(response.data));
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<ErrorException, CarSparePartModel>> getSparePartDetails({required int id}) async {
    try {
      final response = await dioHelper.getData(
        url: "${EndPoints.carSparePartsProduct}/$id",
      );
      return Right(CarSparePartModel.fromJson(response.data));
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<ErrorException, BaseResponseModel>> sendQuotationRequest(
      {required SpareByQuotationParameters parameters}) async {
    try {
      final response = await dioHelper.postData(
          url: EndPoints.sendQuotationRequest, data: FormData.fromMap(await parameters.toJson()));
      return Right(BaseResponseModel.fromJson(response.data));
    } catch (e) {
      rethrow;
    }
  }
}
