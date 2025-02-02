import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final int? id;
  final int? userId;
  final String? locationName;
  final String? addressText;
  final String? street;
  final int? building;
  final int? floor;
  final int? flat;
  final String? latitude;
  final String? longitude;
  final int? cityId;
  final String? staticStatus;
  final String? createdAt;
  final String? updatedAt;
  final String? cityName;

  const Address({
    this.id,
    this.userId,
    this.locationName,
    this.addressText,
    this.street,
    this.building,
    this.floor,
    this.flat,
    this.latitude,
    this.longitude,
    this.cityId,
    this.staticStatus,
    this.createdAt,
    this.updatedAt,
    this.cityName,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      locationName: json['location_name'] as String?,
      addressText: json['addres_text'] as String?,
      street: json['street'] as String?,
      building: json['building'] as int?,
      floor: json['floor'] as int?,
      flat: json['flat'] as int?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      cityId: json['city_id'] as int?,
      staticStatus: json['static'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      cityName: json['city_name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'location_name': locationName,
      'addres_text': addressText,
      'street': street,
      'building': building,
      'floor': floor,
      'flat': flat,
      'latitude': latitude,
      'longitude': longitude,
      'city_id': cityId,
      'static': staticStatus,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'city_name': cityName,
    };
  }

  @override
  List<Object?> get props => [
    id,
    userId,
    locationName,
    addressText,
    street,
    building,
    floor,
    flat,
    latitude,
    longitude,
    cityId,
    staticStatus,
    createdAt,
    updatedAt,
    cityName,
  ];
}
