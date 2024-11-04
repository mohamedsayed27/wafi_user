import 'package:equatable/equatable.dart';
import 'package:wafi_user/data/models/base_response_model.dart';

class LoginOrRegisterModel extends Equatable {
  final BaseResponseModel? baseResponseModel;
  final String? phone;

  const LoginOrRegisterModel({
    this.baseResponseModel,
    this.phone,
  });

  factory LoginOrRegisterModel.fromJson(Map<String, dynamic> json) {
    return LoginOrRegisterModel(
      baseResponseModel: BaseResponseModel.fromJson(json),
      phone: json['phone'] as String?,
    );
  }

  @override
  List<Object?> get props => [
    baseResponseModel,
    phone,
  ];
}
