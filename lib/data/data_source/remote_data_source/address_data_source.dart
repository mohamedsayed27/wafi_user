import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wafi_user/data/models/base_response_model.dart';

import '../../../core/error/error_exception.dart';
import '../../../core/network/api_end_points.dart';
import '../../../core/network/dio_helper.dart';
import '../../models/address_model/address_model.dart';

class AddressDataSource {
  final DioHelper dioHelper;

  AddressDataSource({
    required this.dioHelper,
  });

  Future<Either<ErrorException, List<Address>>> getUsersAddressList() async {
    try {
      final response = await dioHelper.getData(
        url: EndPoints.myAddress,
      );
      return Right(
        List<Address>.from(
          response.data?["data"]?.map((e) => Address.fromJson(e)) ?? [],
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<ErrorException, BaseResponseModel>> addAddress({
    required Address address,
  }) async {
    try {
      final response = await dioHelper.postData(
          url: EndPoints.addAddress, data: FormData.fromMap(address.toJson()));
      return Right(
        BaseResponseModel.fromJson(
          response.data?["data"] ?? {},
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<ErrorException, BaseResponseModel>> updateAddress({
    required Address address,
  }) async {
    try {
      final response = await dioHelper.postData(
          url: EndPoints.editAddress, data: FormData.fromMap(address.toJson()));
      return Right(
        BaseResponseModel.fromJson(
          response.data?["data"] ?? {},
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<ErrorException, BaseResponseModel>> deleteAddress({
    required String addressId,
  }) async {
    try {
      final response = await dioHelper.postData(
        url: EndPoints.deleteAddress,
        data: FormData.fromMap(
          {
            "addres_id": addressId,
          },
        ),
      );
      return Right(
        BaseResponseModel.fromJson(
          response.data?["data"] ?? {},
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
