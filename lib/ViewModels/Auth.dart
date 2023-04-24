import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

  Future<int> onLogin() async {
    //delay 2s
    final result = await Future.delayed(const Duration(microseconds: 500), () {
      _token = "1";
      notifyListeners();
      return Future.value(1);
    });
    debugPrint('username: $_username');
    debugPrint('password: $_password');

    // set token and user info

    //

    return result;
  }

  Future<int> onLogout(BuildContext context) async {
    _token = "";
    //delay 2s
    final rerult = await Future.delayed(const Duration(microseconds: 500), () {
      context.go('/login');
      return 1;
    });

    // set token and user info

    //

    return rerult;
  }
}
