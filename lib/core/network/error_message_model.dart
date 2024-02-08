import 'package:equatable/equatable.dart';

class BaseErrorModel extends Equatable {
  final String message;
  final String status;
  final dynamic data;

  const BaseErrorModel({
    required this.message,
    required this.status,
    required this.data,
  });

  factory BaseErrorModel.fromJson(Map<String, dynamic> json) {
    return BaseErrorModel(
      message: json['message'],
      status: json['status'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "message": message,
      "status": status,
      "data": data,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        message,
        status,
        data,
      ];
}
