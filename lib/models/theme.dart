import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  scaffoldBackgroundColor: const Color(0xfff1f1f1),
  drawerTheme: const DrawerThemeData(
    shadowColor: Colors.blue,
  ),
);

ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.lightBlue[800],
  fontFamily: 'Georgia',
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontSize: 24.0, fontStyle: FontStyle.italic),
    bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
  ),
  cardColor: Colors.teal[900],
  drawerTheme: DrawerThemeData(
    shadowColor: Colors.teal[900],
  ),
);
