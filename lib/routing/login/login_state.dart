import 'package:flutter/foundation.dart';

class LoginState with ChangeNotifier {
  bool _loggedIn = false;

  set loggedIn(bool loggedIn) {
    _loggedIn = loggedIn;
    notifyListeners();
  }

  bool get loggedIn => _loggedIn;
}
