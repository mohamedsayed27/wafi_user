import 'package:equatable/equatable.dart';

class AddressParameters extends Equatable {
  final String? locationName;
  final String? addressText;
  final String? street;
  final String? building;
  final String? floor;
  final String? flat;
  final String? latitude;
  final String? longitude;
  final String? cityId;
  final String? addresId;
  final String? staticValue;

  const AddressParameters({
    this.locationName,
    this.addressText,
    this.street,
    this.building,
    this.floor,
    this.addresId,
    this.flat,
    this.latitude,
    this.longitude,
    this.cityId,
    this.staticValue,
  });

  factory AddressParameters.fromJson(Map<String, dynamic> json) {
    return AddressParameters(
      locationName: json['location_name'] as String?,
      addressText: json['addres_text'] as String?,
      street: json['street'] as String?,
      building: json['building'] as String?,
      floor: json['floor'] as String?,
      flat: json['flat'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      cityId: json['city_id'] as String?,
      staticValue: json['static'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location_name': locationName,
      'addres_text': addressText,
      'street': street,
      'building': building,
      'floor': floor,
      'flat': flat,
      if(addresId!=null)'addres_id': addresId,
      'latitude': latitude,
      'longitude': longitude,
      'city_id': "110",
      'static': "yes",
    };
  }

  @override
  List<Object?> get props => [
        locationName,
        addressText,
        street,
        building,
        floor,
        flat,
        latitude,
        longitude,
        cityId,
        staticValue,
      ];
}
