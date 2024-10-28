import 'dart:developer';

import 'package:geolocator/geolocator.dart';

class LocationClass {
  Future<Position> getMyLocation() async {
    Position? position;
    try {
      position = await Geolocator.getCurrentPosition(
          locationSettings:
              const LocationSettings(accuracy: LocationAccuracy.low));
    } on Exception catch (e) {
      log('Exception $e');
    }
    return position!;
  }
}
