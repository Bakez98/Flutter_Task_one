import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gallery_application/models/user.dart';

class AuthProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  bool userNotCorrect = false;
  bool passwordNotCorrect = false;

  //to register a new user
  void registerUser(
      String email, String password, String name, String phoneNumber) {
    _user = User(
        email: email, password: password, name: name, phoneNumber: phoneNumber);
    notifyListeners();
  }

  bool loginUser(String email, String password) {
    if (email == _user!.email && password == _user!.password) {
      return true;
    } else if (email != _user!.email && password == _user!.password) {
      userNotCorrect = true;
      return false;
    } else if (email == _user!.email && password != _user!.password) {
      passwordNotCorrect = true;
      return false;
    } else {
      return false;
    }
  }

  void logoutUser() {
    _user = null;
    notifyListeners();
  }
}
