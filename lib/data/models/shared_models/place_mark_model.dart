import 'package:equatable/equatable.dart';

class PlaceResult extends Equatable {
  final String? id;
  final String? name;
  final String? formattedAddress;
  final Geometry? geometry;

  const PlaceResult({
    required this.id,
    required this.name,
    required this.formattedAddress,
    required this.geometry,
  });

  factory PlaceResult.fromJson(Map<String, dynamic> json) {
    return PlaceResult(
      id: json['place_id'],
      name: json['name'],
      formattedAddress: json['formatted_address'],
      geometry: Geometry.fromJson(json['geometry']),
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        formattedAddress,
        geometry,
      ];
}

class Geometry extends Equatable {
  final Location location;

  const Geometry({required this.location});

  factory Geometry.fromJson(Map<String, dynamic> json) {
    return Geometry(
      location: Location.fromJson(json['location']),
    );
  }

  @override
  List<Object?> get props => [
        location,
      ];
}

class Location extends Equatable {
  final double? lat;
  final double? lng;

  const Location({required this.lat, required this.lng});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      lat: json['lat'],
      lng: json['lng'],
    );
  }

  @override
  List<Object?> get props => [
        lat,
        lng,
      ];
}
