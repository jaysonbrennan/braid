enum AccountRole {
  user,
  admin,
}

enum OnlineStatus {
  offline,
  online,
  away,
}

class UserInfo {
  final String username;
  final String userId;
  final List<AccountRole> roles;
  final String authToken;
  final List<String> emails;
  final OnlineStatus status;
  final int utcOffset;
  final String avatar;

  UserInfo({
    required this.username,
    required this.userId,
    required this.roles,
    required this.authToken,
    List<String>? emails,
    this.status = OnlineStatus.offline,
    this.utcOffset = 0,
    this.avatar = '',
  }) : emails = emails ?? List<String>.empty();
}
