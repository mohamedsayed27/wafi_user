import '../base_response_model.dart';

class GetUserDataModel extends BaseResponseModel<UserDataModel> {
  const GetUserDataModel({
    required super.message,
    required super.status,
    required super.data,
  });

  factory GetUserDataModel.fromJson(Map<String, dynamic> json) {
    return GetUserDataModel(
      message: json['msg'],
      status: json['status'],
      data: UserDataModel.fromJson(json["data"]),
    );
  }
}

class UserDataModel {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? image;

  UserDataModel({
    this.id,
    this.name,
    this.email,
    this.image,
    this.phone,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['id'],
      name: json['name'],
      email: json["email"],
      image: json['image_url'],
      phone: json['phone'],
    );
  }
}
