import 'package:handyclientapp/models/location_info.dart';
import 'package:handyclientapp/models/models.dart';
import 'package:location/location.dart';

abstract class LocationService {
  Future<LocationInfo> getCurrentLocation();
  Future<bool> isLocationAvailable();
  Future<bool> requestLocationAccess();
}

class LocationServiceDefault extends LocationService {
  @override
  Future<LocationInfo> getCurrentLocation() async {
    
    Location loc = new Location();
    LocationData currentLoc;
    // set the initial location by pulling the user's 
    // current location from the location's getLocation()
    currentLoc = await loc.getLocation();
    return new LocationInfo(latitude: currentLoc.latitude, longitude: currentLoc.longitude);
  }

  Future<bool> isLocationAvailable() async{
    Location loc = new Location();
    var perm = await loc.hasPermission();
    return perm == PermissionStatus.GRANTED;
  }

  Future<bool> requestLocationAccess() async{
    Location loc = new Location();
    var perm = await loc.requestPermission();
    return perm == PermissionStatus.GRANTED;
  }

}
