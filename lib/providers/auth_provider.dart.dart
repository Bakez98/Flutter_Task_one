import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gallery_application/models/user.dart';

class AuthProvider extends ChangeNotifier {
  
  User? _user;

  User? get user => _user;

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
    } else {
      // _user = null;
      return false;
    }
  }

  void logoutUser() {
    _user = null;
    notifyListeners();
  }
}
