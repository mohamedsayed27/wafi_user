import 'package:equatable/equatable.dart';

class CarServicesParameters extends Equatable {
  final int? sectionId;
  final int? serviceId;
  final String? orderDate;
  final String? orderTime;
  final String? latitude;
  final String? longitude;
  final String? addressText;

  const CarServicesParameters({
    this.sectionId,
    this.serviceId,
    this.orderDate,
    this.orderTime,
    this.latitude,
    this.longitude,
    this.addressText,
  });

  factory CarServicesParameters.fromJson(Map<String, dynamic> json) {
    return CarServicesParameters(
      sectionId: json['section_id'] as int?,
      serviceId: json['service_id'] as int?,
      orderDate: json['order_date'] as String?,
      orderTime: json['order_time'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      addressText: json['address_text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'section_id': sectionId,
      'service_id': serviceId,
      'order_date': orderDate,
      'order_time': orderTime,
      'latitude': latitude,
      'longitude': longitude,
      'address_text': addressText,
    };
  }

  @override
  List<Object?> get props => [
    sectionId,
    serviceId,
    orderDate,
    orderTime,
    latitude,
    longitude,
    addressText,
  ];
}
