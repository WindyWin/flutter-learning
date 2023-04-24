import 'package:flutter/material.dart';
import 'package:mvvm/ViewModels/Auth.dart';

import '../model/User.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  User? get user => _user;

  void update(AuthProvider auth) {
    if (auth.token == "1") {
      _user = User("Nguyễn Văn A");
      debugPrint("UserProvider: ${_user?.username}");
    } else {
      _user = null;
      debugPrint("UserProvider: ${null}");
    }

    debugPrint("UserProvider: ${_user?.username}");
    notifyListeners();
  }
}
