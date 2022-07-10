import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../user/user_info.dart';
import '../login_service.dart';

class RocketchatLogin implements LoginService {
  @override
  Future<UserInfo?> login(http.Client client,
      {required String host,
      required String username,
      required String password}) async {
    final url = Uri.https(host, 'api/v1/login');
    final headers = {'Content-type': 'application/json'};
    final body = jsonEncode({'user': username, 'password': password});

    final response = await client.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode != 200) return null;
    return _parseUserInfo(jsonDecode(response.body));
  }

  @override
  Future<bool> logout(http.Client client,
      {required String host,
      required String username,
      required String authToken}) async {
    final url = Uri.https(host, 'api/v1/logout');
    final headers = {'X-Auth-Token': authToken, 'X-User-Id': username};

    // TODO #1: Check response status code
    await client.post(url, headers: headers);
    return true;
  }

  UserInfo? _parseUserInfo(Map<String, dynamic> json) {
    final requestStatus = json['status'];
    if (requestStatus != 'success') return null;
    final data = json["data"];

    final userId = data['userId'] as String?;
    final authToken = data['authToken'] as String?;
    final me = data['me'];
    final username = me['name'] as String?;
    final emails = (me['emails'] as List<dynamic>?)
        ?.map((email) => (email['address'] as String?) ?? '')
        .toList();
    final status = me['status'] as String?;
    final utcOffset = me['utcOffset'] as int?;
    final roles = (me['roles'] as List<dynamic>?)?.map((role) {
      if (role == 'admin') {
        return AccountRole.admin;
      }
      return AccountRole.user;
    }).toList();
    final avatar = me['avatarUrl'] as String?;

    OnlineStatus onlineStatus;
    if (status == 'online') {
      onlineStatus = OnlineStatus.online;
    } else if (status == 'away') {
      onlineStatus = OnlineStatus.away;
    } else {
      onlineStatus = OnlineStatus.offline;
    }

    return UserInfo(
        username: username ?? '',
        userId: userId ?? '',
        roles: roles ?? List<AccountRole>.empty(),
        authToken: authToken ?? '',
        emails: emails ?? List<String>.empty(),
        status: onlineStatus,
        utcOffset: utcOffset ?? 0,
        avatar: avatar ?? '');
  }
}
