import 'package:equatable/equatable.dart';

class CarModel extends Equatable {
  final int? id;
  final int? carTypeId;
  final String? imageCarType;
  final int? modelId;
  final String? carModelName;
  final String? year;
  final String? carTypeName;
  final String? structureNum;
  final int? userId;
  final int? active;
  final String? createdAt;
  final String? updatedAt;

  const CarModel({
    this.id,
    this.carTypeId,
    this.imageCarType,
    this.carTypeName,
    this.carModelName,
    this.modelId,
    this.year,
    this.structureNum,
    this.userId,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'] as int?,
      carTypeId: json['car_type_id'] as int?,
      imageCarType: json['image_car_type'] as String?,
      modelId: json['model_id'] as int?,
      carTypeName: json['car_type_name'] as String?,
      year: json['year'] as String?,
      structureNum: json['structure_num'] as String?,
      userId: json['user_id'] as int?,
      carModelName: json['car_model_name'] as String?,
      active: json['active'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'car_type_id': carTypeId,
      'image_car_type': imageCarType,
      'model_id': modelId,
      'year': year,
      'structure_num': structureNum,
      'user_id': userId,
      'active': active,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  @override
  List<Object?> get props => [
    id,
    carTypeId,
    imageCarType,
    modelId,
    year,
    structureNum,
    userId,
    active,
    createdAt,
    updatedAt,
  ];
}
