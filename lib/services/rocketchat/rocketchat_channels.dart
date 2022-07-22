import 'dart:async';
import 'dart:convert';

import 'package:braid/channel/channel.dart';
import 'package:http/http.dart' as http;

import '../channel_service.dart';

class RocketChatChannels implements ChannelService {
  @override
  Future<List<Channel>> retrieveChannels(http.Client client,
      {required String host,
      required String username,
      required String authToken}) async {
    final url = Uri.https(host, 'api/v1/channels.list');
    final headers = {'X-Auth-Token': authToken, 'X-User-Id': username};

    final response = await client.post(url, headers: headers);
    if (response.statusCode != 200) return List<Channel>.empty();

    final json = jsonDecode(response.body);
    List<Channel> channelList = (json['channels'] as List<dynamic>)
        .map((channel) => Channel.fromJson(channel))
        .toList();

    return channelList;
  }
}
