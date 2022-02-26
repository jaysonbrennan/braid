import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../user/user.dart';

Future<User> login(http.Client client,
    {required String host,
    required String username,
    required String password}) async {
  final url = Uri.https(host, 'api/v1');
  final response =
      await client.post(url, body: {'user': username, 'password': password});
  var json = jsonDecode(response.body);
  if (response.statusCode == 200 && json['status'] == 'success') {
    return User.fromJson(json['data']);
  } else {
    // TODO: Do something
    throw Exception('Failed to login');
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
