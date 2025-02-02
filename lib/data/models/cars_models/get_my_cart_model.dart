import 'package:wafi_user/data/models/base_response_model.dart';
import 'package:wafi_user/data/models/cars_models/car_model.dart';

class GetMyCartModel extends BaseResponseModel<List<CarModel>>{
  const GetMyCartModel({required super.message, required super.status,super.data});


  factory GetMyCartModel.fromJson(Map<String, dynamic> json) {
    return GetMyCartModel(
      message: json["msg"],
      status: json["status"],
      data: json["data"].isNotEmpty && json["data"] != null
          ? List.from(
        json["data"].map((element) => CarModel.fromJson(element)),
      )
          : null,
    );
  }

}