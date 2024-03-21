import 'dart:developer';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<Map<String, dynamic>> getCurrentLocation() async{

  Map<String, dynamic> locationData={};

  try{
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission==LocationPermission.denied || permission==LocationPermission.deniedForever){
      log("Location Denied");
      LocationPermission ask = await Geolocator.requestPermission();
      if(ask==LocationPermission.denied || ask==LocationPermission.deniedForever){
        locationData['city'] = 'Udaipur';
        return locationData;
      }
    }
    else{
      Position currentposition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      log("Latitude=${currentposition.latitude.toString()}");
      log("Longitude=${currentposition.longitude.toString()}");

      List<Placemark> placemarks = await placemarkFromCoordinates(currentposition.latitude, currentposition.longitude);
      String city = placemarks.first.locality ?? 'Udaipur';

      locationData['latitude'] = currentposition.latitude;
      locationData['longitude'] = currentposition.longitude;
      locationData['city'] = city;
      return locationData;
    }
  }catch(e){
    log('Error getting user location : $e');
    locationData['city'] = 'Udaipur';
    return locationData;
  }

  locationData['city'] = 'Udaipur';
  return locationData;

}

