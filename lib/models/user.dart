class User {
  final String username;
  final String userId;
  final List<String> emails;
  final String status;
  final int utcOffset;
  final List<String> roles;
  final String avatar;

  User(
      {required this.username,
      required this.userId,
      required this.emails,
      required this.status,
      required this.utcOffset,
      required this.roles,
      required this.avatar});

  factory User.fromJson(Map<String, dynamic> json) {
    final userId = json['userId'] as String;
    final me = json['me'];
    final username = me['name'] as String;
    final emails = me['emails'].map((email) => email['address']).toList();
    final status = me['status'] as String;
    final utcOffset = me['utcOffset'] as int;
    final roles = me['roles'] as List<String>;
    final avatar = me['avatarUrl'];

    return User(
        username: username,
        userId: userId,
        emails: emails,
        status: status,
        utcOffset: utcOffset,
        roles: roles,
        avatar: avatar);
  }
}
