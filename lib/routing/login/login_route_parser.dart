import 'package:flutter/widgets.dart';

import 'login_route.dart';

// NOTE: This class is not used as we are not targetting the web
class LoginRouteInformationParser extends RouteInformationParser<LoginRoute> {
  @override
  Future<LoginRoute> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    // TODO: Update this to support the web
    return LoginRoute();
  }

  @override
  RouteInformation restoreRouteInformation(LoginRoute configuration) =>
      // TODO: Update this to support the web
      const RouteInformation(location: '/home');
}
