import '../base_response_model.dart';
import 'car_type_and_model_model.dart';

class GetAllCarTypesAndModels extends BaseResponseModel<List<CarTypeAndModelModels>> {
  const GetAllCarTypesAndModels({
    required super.message,
    required super.status,
    super.data,
  });

  factory GetAllCarTypesAndModels.fromJson(Map<String, dynamic> json) {
    return GetAllCarTypesAndModels(
      message: json["msg"],
      status: json["status"],
      data: json["data"].isNotEmpty && json["data"] != null
          ? List.from(
              json["data"].map((element) => CarTypeAndModelModels.fromJson(element)),
            )
          : null,
    );
  }
}
