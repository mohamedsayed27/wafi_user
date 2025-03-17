import 'package:geolocator/geolocator.dart';
import 'package:wafi_user/core/network/dio_helper.dart';

import '../../data/models/shared_models/place_mark_model.dart';

class LocationService {
  final DioHelper _dioHelper;

  LocationService(this._dioHelper);

   Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw LocationException(
          'Location services are disabled. Please enable them in settings.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw LocationException(
            'Location permissions are denied. Please grant permission to use location services.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw LocationException(
          'Location permissions are permanently denied. You need to enable them from app settings.');
    }

    try {
      return await Geolocator.getCurrentPosition();
    } catch (e) {
      throw LocationException('Failed to get location: ${e.toString()}');
    }
  }

  Future<List<PlaceResult>> searchPlaces(String query) async {
    const apiKey = 'AIzaSyDcWIxw6lRSHR9O8ts9R76d9Z7ZzsFmDa0';
    final url = 'https://maps.googleapis.com/maps/api/place/textsearch/json?query=$query&key=$apiKey';

    final response = await _dioHelper.getData(
      url: url,
    );
    List<PlaceResult> searchResults = [];
    if (response.statusCode == 200) {
      print(response.data);
      final predictions = response.data['results'] as List<dynamic>;
      searchResults =
          predictions.map((result) => PlaceResult.fromJson(result)).toList();
    } else {
      searchResults = [];
    }
    return searchResults;
  }
}

class LocationException implements Exception {
  final String message;

  LocationException(this.message);

  @override
  String toString() => message;
}
