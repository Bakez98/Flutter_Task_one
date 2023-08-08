import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  Map<String, dynamic> language = {};

  Locale my_current_locale = Locale("en");

  bool _isDarkThemeEnabled = false;
  bool _isArabicLanguageSelected = false;

  bool get isDarkThemeEnabled => _isDarkThemeEnabled;
  bool get isArabicLanguageSelected => _isArabicLanguageSelected;

  void setDarkThemeEnabled(bool value) {
    _isDarkThemeEnabled = value;
    notifyListeners();
  }
// SharedPreferences prefs = await SharedPreferences.getInstance();

  // Future<void> setTheme(String theme) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setBool('_isDarkThemeEnabled', true);
  // }

  // Future<bool?> getTheme() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getBool('_isDarkThemeEnabled');
  // }

  void setArabicLanguageSelected(bool value) async {
    _isArabicLanguageSelected = value;
    String langAsset = "en.json";
    if (value) {
      langAsset = "ar.json";
      my_current_locale = const Locale("ar");
    } else {
      langAsset = "en.json";
      my_current_locale = const Locale("en");
    }
    String xx = await rootBundle.loadString("assets/lang/${langAsset}");
    var jsonMap = json.decode(xx);
    language = jsonMap;

    notifyListeners();
  }
}
