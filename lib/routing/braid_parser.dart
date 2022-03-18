import 'parsed_route.dart';
import 'package:flutter/widgets.dart';

class BraidRouteInformationParser extends RouteInformationParser<ParsedRoute> {
  @override
  Future<ParsedRoute> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    return ParsedRoute(routeInformation.location!);
  }

  @override
  RouteInformation restoreRouteInformation(ParsedRoute configuration) =>
      RouteInformation(location: configuration.path);
}
