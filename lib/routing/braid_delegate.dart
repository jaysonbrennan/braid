import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'parsed_route.dart';
import 'route_state.dart';
import '../screens/login_screen.dart';
import '../screens/channel_screen.dart';
import '../user/user.dart';

class BraidRouterDelegate extends RouterDelegate<ParsedRoute>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<ParsedRoute> {
  final RouteState _routeState;

  @override
  final navigatorKey = GlobalKey<NavigatorState>();

  BraidRouterDelegate(this._routeState) {
    _routeState.addListener(notifyListeners);
  }

  @override
  ParsedRoute get currentConfiguration => _routeState.route;

  @override
  Widget build(BuildContext context) {
    var loggedIn = context.select<User, bool>(
      (user) => user.isLoggedIn,
    );
    return Navigator(
      key: navigatorKey,
      pages: [
        if (loggedIn)
          MaterialPage(
            key: const ValueKey('Channel Screen'),
            child: ChannelScreen(),
          )
        else
          MaterialPage(
            key: const ValueKey('Login Screen'),
            child: LoginScreen(),
          )
      ],
      onPopPage: (route, result) {
        return route.didPop(result);
      },
    );
  }

  @override
  Future<void> setNewRoutePath(ParsedRoute configuration) {
    _routeState.route = configuration;
    return SynchronousFuture(null);
  }
}
