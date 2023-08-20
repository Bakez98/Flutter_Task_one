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

  late SharedPreferences prefs;
  bool? myTheme;
  bool? myLang;
  bool isDefined = false;

  Future initMyController() async {
    if (!isDefined) {
      prefs = await SharedPreferences.getInstance();
      isDefined = true;
    }

    checkIfExist();
  }

  void setDarkThemeEnabled(bool value) async {
    _isDarkThemeEnabled = value;
    prefs.setBool("isDarkThemeEnabled", value);
    notifyListeners();
  }

  void setArabicLanguageSelected(bool value) async {
    _isArabicLanguageSelected = value;
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("isArabicLanguageSelected", value);
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

  void checkIfExist() async {
    print("inside check if Exist");
    if (prefs.containsKey("isDarkThemeEnabled") &&
        prefs.containsKey("isArabicLanguageSelected")) {
      setAlreadyUsedTheme();
    } else {
      setDefaultSettings();
    }
  }

  Future setDefaultSettings() async {
    bool darktheme = false;
    bool arabiclang = false;

    myTheme = darktheme;
    myLang = arabiclang;

    await prefs.setBool("isDarkThemeEnabeled", myTheme!);
    await prefs.setBool("isArabicLanguageSelected", myLang!);

    notifyListeners();
  }

  Future setAlreadyUsedTheme() async {
    _isDarkThemeEnabled = prefs.getBool("isDarkThemeEnabled")!;
    _isArabicLanguageSelected = prefs.getBool("isArabicLanguageSelected")!;
    setArabicLanguageSelected(_isArabicLanguageSelected);
    notifyListeners();
  }
}
