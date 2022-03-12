class User {
  final String username;
  final String userId;
  final List<String> emails;
  final List<String> roles;
  final String status;
  final int utcOffset;
  final String avatar;

  User(
      {required this.username,
      required this.userId,
      required this.emails,
      required this.roles,
      this.status = "offline",
      this.utcOffset = 0,
      this.avatar = ""});
}
