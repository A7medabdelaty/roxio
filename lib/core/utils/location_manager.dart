import 'package:geolocator/geolocator.dart';

class LocationManager {
  Future<bool> requestLocationService() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
    }
    return serviceEnabled;
  }

  Future<bool> requestLocationPermission() async {
    LocationPermission hasPermission = await Geolocator.checkPermission();
    if (hasPermission == LocationPermission.denied) {
      hasPermission = await Geolocator.requestPermission();
    }
    if (hasPermission == LocationPermission.denied ||
        hasPermission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  void getLocationStream(void Function(Position)? onData) {
    Geolocator.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation,
      ),
    ).listen(onData);
  }

  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition();
  }
}
