import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../user/user.dart';

User parseUser(Map<String, dynamic> json) {
  final requestStatus = json['status'];
  if (requestStatus == 'success') {
    final userId = json['userId'] as String;
    final me = json['me'];
    final username = me['name'] as String;
    final emails = me['emails']
        .map<String>((email) => (email['address'] as String))
        .toList();
    final status = me['status'] as String;
    final utcOffset = me['utcOffset'] as int;
    final roles = (me['roles'] as List<dynamic>).cast<String>();
    final avatar = me['avatarUrl'];

    return User(
        username: username,
        userId: userId,
        emails: emails,
        status: status,
        utcOffset: utcOffset,
        roles: roles,
        avatar: avatar);
  } else {
    throw Exception('User JSON status not successful');
  }
}

Future<User> login(http.Client client,
    {required String host,
    required String username,
    required String password}) async {
  final url = Uri.https(host, 'api/v1');
  final response =
      await client.post(url, body: {'user': username, 'password': password});
  if (response.statusCode == 200) {
    return parseUser(jsonDecode(response.body));
  } else {
    throw Exception('Failed to login. Unsuccessful status code returned');
  }
}

Future<http.Response> logout(http.Client client) async {
  final response =
      client.get(Uri.parse('https://jsonplaceholder.typicode.com'));
  return response;
}

Future<http.Response> fetchChannels(http.Client client) async {
  final response =
      client.get(Uri.parse('https://jsonplaceholder.typicode.com'));
  return response;
}

Future<http.Response> fetchChannelMessages(http.Client client) async {
  final response =
      client.get(Uri.parse('https://jsonplaceholder.typicode.com'));
  return response;
}
