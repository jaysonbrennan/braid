import '../user/user_info.dart';
import 'package:http/http.dart' as http;

abstract class LoginService {
  Future<UserInfo?> login(http.Client client,
      {required String host,
      required String username,
      required String password});

  void logout(String authToken);
}
