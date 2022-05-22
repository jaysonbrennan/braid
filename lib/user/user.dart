import 'package:flutter/foundation.dart';
import '../services/login_service.dart';
import 'user_info.dart';
import 'package:http/http.dart' as http;

class User with ChangeNotifier {
  final LoginService _loginService;
  String? username;
  String? userId;
  List<AccountRole>? roles;
  String? authToken;
  List<String>? emails;
  String? status;
  int? utcOffset;
  String? avatar;
  bool _loggedIn = false;

  User({required LoginService loginService}) : _loginService = loginService;

  get isLoggedIn => _loggedIn;

  Future<bool> login({
    required String host,
    required String username,
    required String password,
  }) async {
    // Check if we are already logged in
    if (_loggedIn == true) return true;

    UserInfo? userInfo = await _loginService.login(
      http.Client(),
      host: host,
      username: username,
      password: password,
    );

    if (userInfo != null) {
      this.username = userInfo.username;
      userId = userInfo.userId;
      roles = userInfo.roles;
      authToken = userInfo.authToken;

      _loggedIn = true;
      notifyListeners();
    }

    return _loggedIn;
  }
}
