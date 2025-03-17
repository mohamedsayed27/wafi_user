import 'package:equatable/equatable.dart';

import '../base_response_model.dart';

class GetCountriesModel extends BaseResponseModel<List<CountryModel>?> {
  const GetCountriesModel({
    required super.message,
    required super.status,
    super.data,
  });

  factory GetCountriesModel.fromJson(Map<String, dynamic> json) {
    return GetCountriesModel(
      message: json['msg'],
      status: json['status'],
      data: List.from(json['data']?.map(
        (element) => CountryModel.fromJson(element),
      )),
    );
  }
}

class CountryModel extends Equatable {
  final int? id;
  final String? icon;
  final String? countryKey;
  final String? longitude;
  final String? latitude;
  final int? active;
  final String? createdAt;
  final String? name;
  final String? image;

  const CountryModel({
    this.id,
    this.icon,
    this.countryKey,
    this.longitude,
    this.latitude,
    this.active,
    this.createdAt,
    this.name,
    this.image,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'] as int?,
      icon: json['icon'] as String?,
      countryKey: json['country_key'] as String?,
      longitude: json['longitude'] as String?,
      latitude: json['latitude'] as String?,
      active: json['active'] as int?,
      createdAt: json['created_at'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'icon': icon,
      'country_key': countryKey,
      'longitude': longitude,
      'latitude': latitude,
      'active': active,
      'created_at': createdAt,
      'name': name,
      'image': image,
    };
  }

  @override
  List<Object?> get props => [
        id,
        icon,
        countryKey,
        longitude,
        latitude,
        active,
        createdAt,
        name,
        image
      ];
}
