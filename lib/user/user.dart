import '../services/login_service.dart';
import 'user_info.dart';
import 'package:http/http.dart' as http;

class User {
  final LoginService _loginService;
  late String _host;
  late String _username;
  late String _userId;
  late List<AccountRole> _roles;
  late String _authToken;
  late List<String> _emails;
  late String _status;
  late int _utcOffset;
  late String _avatar;
  bool _loggedIn = false;

  User({required LoginService loginService}) : _loginService = loginService;

  bool get isLoggedIn => _loggedIn;

  Future<bool> login({
    required String host,
    required String username,
    required String password,
  }) async {
    // Check if we are already logged in
    if (_loggedIn) return true;

    UserInfo? userInfo = await _loginService.login(
      http.Client(),
      host: host,
      username: username,
      password: password,
    );

    if (userInfo != null) {
      _username = userInfo.username;
      _userId = userInfo.userId;
      _roles = userInfo.roles;
      _authToken = userInfo.authToken;

      _host = host;
      _loggedIn = true;
    }

    return _loggedIn;
  }

  Future<bool> logout() async {
    // Check if we are logged in
    if (!_loggedIn) return true;

    var success = await _loginService.logout(http.Client(),
        host: _host, username: _username, authToken: _authToken);

    if (success) {
      _loggedIn = false;
    }
    
    return success;
  }
}
