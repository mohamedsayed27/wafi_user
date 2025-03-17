import 'package:dartz/dartz.dart';
import 'package:wafi_user/core/network/dio_helper.dart';

import '../../../core/error/error_exception.dart';
import '../../../core/network/api_end_points.dart';
import '../../models/car_spare_parts_model/car_spare_part_model.dart';

class CarSparePartsRemoteDataSource{
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

  Future<Either<ErrorException, GetCarSparePartsProducts>> getSparePartDetails({required int id}) async {
    try {
      final response = await dioHelper.getData(
        url: "${EndPoints.carSparePartsProduct}/$id",
      );
      return Right(GetCarSparePartsProducts.fromJson(response.data));
    } catch (e) {
      rethrow;
    }
  }

}