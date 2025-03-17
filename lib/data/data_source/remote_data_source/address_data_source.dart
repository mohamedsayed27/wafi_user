import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wafi_user/data/models/address_model/country_model.dart';
import 'package:wafi_user/data/models/base_response_model.dart';

import '../../../core/error/error_exception.dart';
import '../../../core/network/api_end_points.dart';
import '../../../core/network/dio_helper.dart';
import '../../models/address_model/address_model.dart';
import '../../models/address_model/city_model.dart';

class AddressDataSource {
  final DioHelper dioHelper;

  AddressDataSource({
    required this.dioHelper,
  });

  Future<Either<ErrorException, List<AddressModel>>>
      getUsersAddressList() async {
    try {
      final response = await dioHelper.getData(
        url: EndPoints.myAddress,
      );
      return Right(
        List<AddressModel>.from(
          response.data?["data"]?.map((e) => AddressModel.fromJson(e)) ?? [],
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<ErrorException, GetCountriesModel>> getCountriesList() async {
    try {
      final response = await dioHelper.getData(
        url: EndPoints.country,
      );
      return Right(GetCountriesModel.fromJson(response.data));
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<ErrorException, GetCitiesModel>> getCitiesList(
      {required int id}) async {
    try {
      final response = await dioHelper.getData(
        url: "${EndPoints.city}/$id",
      );
      return Right(GetCitiesModel.fromJson(response.data));
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<ErrorException, BaseResponseModel>> addAddress({
    required AddressModel address,
  }) async {
    try {
      final response = await dioHelper.postData(
          url: EndPoints.addAddress, data: FormData.fromMap(address.toJson()));
      return Right(
        BaseResponseModel.fromJson(
          response.data,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<ErrorException, BaseResponseModel>> updateAddress({
    required AddressModel address,
  }) async {
    try {
      final response = await dioHelper.postData(
          url: EndPoints.editAddress, data: FormData.fromMap(address.toJson()));
      return Right(
        BaseResponseModel.fromJson(
          response.data,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<ErrorException, BaseResponseModel>> changeAddressStatus({
    required int id,
  }) async {
    try {
      final response = await dioHelper.postData(
        url:"${EndPoints.addressStatus}/$id",
        data: FormData.fromMap(
          {
            "status": "active",
          },
        ),
      );
      print(response);
      return Right(
        BaseResponseModel.fromJson(
          response.data,
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
          response.data,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
