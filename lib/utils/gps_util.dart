import 'dart:async';
import 'package:cirrus_map_view/location.dart';
import 'package:flutter/services.dart';
import 'package:geo_location_finder/geo_location_finder.dart';
import 'package:shared_preferences/shared_preferences.dart';


class GpgUtils {
  GpsUtilListener listener;
  bool _permission = false;
  Map<String, double> _currentLocation;
  Location _startLocation = Location(0.0, 0.0);
  String error;
  double lat;
  double lng;
  Timer timer;
  bool currentWidget = true;
  var location = new Location(0.0,0.0);
  GpgUtils(this.listener);

  void init() {
    //ejecutar metodo cada 5 segundos
    _getLocation();
    /**
    timer = Timer.periodic(Duration(seconds: 15), (Timer t){
      _getLocation();
    });
        */

  }

    _getLocation() async {
    Map<dynamic, dynamic> locationMap;
    var prefs = await SharedPreferences.getInstance();
    String result;
    print('entra aqui ');
    try {
      locationMap = await GeoLocation.getLocation;
      var status = locationMap["status"];
      print('entra aqui2 ');
      if ((status is String && status == "true") ||
          (status is bool) && status) {
        lat = locationMap["latitude"];
         lng = locationMap["longitude"];
        print('entra aqui3');
        print('xd ${locationMap["latitude"]}');
        print('xd ${locationMap}');
        prefs.setString('lat',lat.toString());
        prefs.setString('lat',lng.toString());
        print(locationMap);
        location = new Location(lat, lng);
        _startLocation = location;
        listener.onLocationChange(lat,lng);
        //_currentLocation = locationMap;
        //listener.onLocationChange(_currentLocation);
        if (lat is String) {
          result = "Location: ($lat, $lng)";

        } else {
          // lat and lng are not string, you need to check the data type and use accordingly.
          // it might possible that else will be called in Android as we are getting double from it.
          result = "Location: ($lat, $lng)";
        }
      } else {
        result = locationMap["message"];
      }
    } on PlatformException {
      result = 'Failed to get location';
    }

  }
}


abstract class GpsUtilListener {
  onLocationChange(lat,lng);
}
