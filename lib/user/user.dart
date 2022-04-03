import 'package:flutter/foundation.dart';

class User with ChangeNotifier {
  final String? username;
  final String? userId;
  final List<String?>? emails;
  final List<String>? roles;
  String status;
  int utcOffset;
  String avatar;

  bool loggedIn = false;

  User(
      {this.username,
      this.userId,
      this.emails,
      this.roles,
      this.status = 'offline',
      this.utcOffset = 0,
      this.avatar = ''});

  factory User.fromJson(Map<String, dynamic> json) {
    final requestStatus = json['status'];
    if (requestStatus == 'success') {
      final userId = json['userId'] as String?;
      final me = json['me'];
      final username = me['name'] as String?;
      final emails = (me['emails'] as List<dynamic>?)
          ?.map((email) => (email['address'] as String?))
          .toList();
      final status = me['status'] as String?;
      final utcOffset = me['utcOffset'] as int?;
      final roles = (me['roles'] as List<dynamic>?)
          ?.map((role) => role as String)
          .toList();
      final avatar = me['avatarUrl'] as String?;

      return User(
          username: username,
          userId: userId,
          emails: emails,
          roles: roles,
          status: status ?? 'offline',
          utcOffset: utcOffset ?? 0,
          avatar: avatar ?? '');
    } else {
      return User();
    }
  }
}
