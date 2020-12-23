import 'package:flutter/material.dart';

// Default values for everything will go here. Think of it as res/values.xml
var jDefaultPadding = 20.0;
// Themes and stuff
final lightTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
  accentColor: Colors.blueAccent,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.white54,
);
final darkTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primarySwatch: Colors.blue,
  brightness: Brightness.dark,
  accentColor: Colors.blueAccent,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
);
