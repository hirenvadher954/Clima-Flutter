import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;

  Future<Location> getLocation() async {
    Location location = new Location();
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      location.longitude = position.longitude;
      location.latitude = position.latitude;
    } catch (e) {
      print(e);
    }

    return location;
  }
}
