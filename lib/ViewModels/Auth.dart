import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String? _username = '';
  String? _password = '';

  String? _token = "";

  String? get username => _username;
  String? get password => _password;

  String? get token => _token;

  void setUsername(String? username) {
    _username = username;
    notifyListeners();
  }

  void setPassword(String? password) {
    _password = password;
    notifyListeners();
  }

  Future<int> onLogin() {
    //delay 2s
    Future.delayed(const Duration(seconds: 3));
    debugPrint('username: $_username');
    debugPrint('password: $_password');

    _token = "1";
    // set token and user info

    //

    return Future.value(1);
  }
}
