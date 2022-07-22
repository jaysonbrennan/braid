import 'package:flutter/material.dart';

class Channel with ChangeNotifier {
  final String name;
  final int messageCount;
  final List<String> usernames;
  final DateTime lastUpdated;

  Channel(this.name, this.messageCount, this.usernames, this.lastUpdated);

  factory Channel.fromJson(Map<String, dynamic> json) {
    final usernames = (json['usernames'] as List<dynamic>)
        .map((username) => (username as String))
        .toList();

    final lastUpdated = DateTime.parse(json['_updatedAt']);

    return Channel(
      json['name'] as String,
      json['msgs'] as int,
      usernames,
      lastUpdated,
    );
  }

  set lastUpdated(DateTime dateTime) {
    if (lastUpdated != dateTime) {
      lastUpdated = dateTime;
      notifyListeners();
    }
  }
}
