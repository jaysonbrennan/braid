import 'braid_route.dart';
import 'package:flutter/widgets.dart';

class BraidRouteInformationParser extends RouteInformationParser<BraidRoute> {
  @override
  Future<BraidRoute> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    // TODO: Update this to support the web
    return HomeRoute();
  }

  @override
  RouteInformation restoreRouteInformation(BraidRoute configuration) =>
      // TODO: Update this to support the web
      const RouteInformation(location: '/home'); 
}
