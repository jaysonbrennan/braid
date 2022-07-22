import '../channel/channel.dart';
import 'package:http/http.dart' as http;

abstract class ChannelService {
  Future<List<Channel>> retrieveChannels(http.Client client,
      {required String host,
      required String username,
      required String authToken});
}
