import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:braid/services/rocketchat/rocketchat_login.dart';
import 'package:braid/user/user_info.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'rocketchat_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('RocketChat Service Test', () {
    test('Login successful', () async {
      // Setup
      final client = MockClient();

      const responseString = '{'
          '"status": "success",'
          '"data": {'
          '"authToken": "9HqLlyZOugoStsXCUfD_0YdwnNnunAJF8V47U3QHXSq",'
          '"userId": "aobEdbYhXfu5hkeqG",'
          '"me": {'
          '"_id": "aYjNnig8BEAWeQzMh",'
          '"name": "Rocket Cat",'
          '"emails": ['
          '{'
          '"address": "rocket.cat@rocket.chat",'
          '"verified": false'
          '}'
          '],'
          '"status": "offline",'
          '"statusConnection": "offline",'
          '"username": "rocket.cat",'
          '"utcOffset": -3,'
          '"active": true,'
          '"roles": ['
          '"admin"'
          '],'
          '"settings": {'
          '"preferences": {}'
          '},'
          '"avatarUrl": "http://localhost:3000/avatar/test"'
          '}'
          '}'
          '}';

      when(client.post(any,
              headers: anyNamed('headers'), body: anyNamed('body')))
          .thenAnswer((_) async {
        return http.Response(responseString, 200);
      });

      // Run
      var loginService = RocketchatLogin();
      final userInfo = await loginService.login(client,
          host: 'hostname.com', username: 'bob', password: 'p4ssw0rd');

      // Verify
      expect(userInfo, isA<UserInfo>());
      expect(userInfo?.username, 'Rocket Cat');
      expect(userInfo?.userId, 'aobEdbYhXfu5hkeqG');
      expect(userInfo?.roles, {AccountRole.admin});
      expect(
          userInfo?.authToken, '9HqLlyZOugoStsXCUfD_0YdwnNnunAJF8V47U3QHXSq');
      expect(userInfo?.emails, {'rocket.cat@rocket.chat'});
      expect(userInfo?.status, OnlineStatus.offline);
      expect(userInfo?.utcOffset, -3);
      expect(userInfo?.avatar, 'http://localhost:3000/avatar/test');
    });
  });
}
