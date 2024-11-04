import 'package:equatable/equatable.dart';

class BaseResponseModel<T> extends Equatable {
  final String? message;
  final bool? status;
  final T? data;

  const BaseResponseModel({
    required this.message,
    required this.status,
    this.data,
  });

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) {
    return BaseResponseModel(
      message: json['msg'],
      status: json['status'],
      data: json["data"],
    );
  }

  @override
  List<Object?> get props => [
        message,
        status,
        data,
      ];
}
