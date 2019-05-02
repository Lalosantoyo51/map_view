import 'package:flutter/material.dart';
import 'package:ultima/map_screen.dart';
import 'package:cirrus_map_view/map_view.dart';

void main() {
  MapView.setApiKey("AIzaSyAkA-O8S7tInbJ099PpGzNqR3g5e_CkvBY");
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
      primaryColor: const Color(0xFF02BB9F),
      primaryColorDark: const Color(0xFF167F67),
      accentColor: const Color(0xFF167F67),
    ),
    home: new MapScreen(),
  ));
}