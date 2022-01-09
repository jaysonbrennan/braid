import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';

Future<User> login({required String username, required String password}) async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com'));
  return User.fromJson(jsonDecode(response.body));
}

Future<http.Response> logout() async {
  final response = http.get(Uri.parse('https://jsonplaceholder.typicode.com'));
  return response;
}

Future<http.Response> fetchChannels() async {
  final response = http.get(Uri.parse('https://jsonplaceholder.typicode.com'));
  return response;
}

Future<http.Response> fetchChannelMessages() async {
  final response = http.get(Uri.parse('https://jsonplaceholder.typicode.com'));
  return response;
}
