import 'package:equatable/equatable.dart';
import 'package:wafi_user/data/models/base_response_model.dart';

class GetCitiesModel extends BaseResponseModel<List<CityModel>?> {
  const GetCitiesModel({
    required super.message,
    required super.status,
    super.data,
  });

  factory GetCitiesModel.fromJson(Map<String, dynamic> json) {
    return GetCitiesModel(
      message: json['msg'],
      status: json['status'],
      data: List.from(json['data']?.map(
        (element) => CityModel.fromJson(element),
      )),
    );
  }
}

class CityModel extends Equatable {
  final int? id;
  final int? countryId;
  final String? latitude;
  final String? longitude;
  final String? icon;
  final int? active;
  final String? createdAt;
  final String? name;
  final String? nameWeb;
  final String? countryName;

  const CityModel({
    this.id,
    this.countryId,
    this.latitude,
    this.longitude,
    this.icon,
    this.active,
    this.createdAt,
    this.name,
    this.nameWeb,
    this.countryName,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'] as int?,
      countryId: json['country_id'] as int?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      icon: json['icon'] as String?,
      active: json['active'] as int?,
      createdAt: json['created_at'] as String?,
      name: json['name'] as String?,
      nameWeb: json['name_web'] as String?,
      countryName: json['country_name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'country_id': countryId,
      'latitude': latitude,
      'longitude': longitude,
      'icon': icon,
      'active': active,
      'created_at': createdAt,
      'name': name,
      'name_web': nameWeb,
      'country_name': countryName,
    };
  }

  @override
  List<Object?> get props => [
        id,
        countryId,
        latitude,
        longitude,
        icon,
        active,
        createdAt,
        name,
        nameWeb,
        countryName
      ];
}
