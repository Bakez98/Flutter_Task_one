import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'dart:io' as plt;

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
