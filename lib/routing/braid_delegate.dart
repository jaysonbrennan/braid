import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/login_screen.dart';
import '../user/user.dart';
import '../widgets/braid_scaffold.dart';
import 'braid_route.dart';
import 'route_state.dart';

class BraidRouterDelegate extends RouterDelegate<BraidRoute>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<BraidRoute> {
  final RouteState _routeState;

  @override
  final navigatorKey = GlobalKey<NavigatorState>();

  BraidRouterDelegate(this._routeState) {
    _routeState.addListener(notifyListeners);
  }

  // TODO: Update this to support the web
  @override
  BraidRoute get currentConfiguration => HomeRoute();

  @override
  Widget build(BuildContext context) {
    var loggedIn = context.select<User, bool>(
      (user) => user.isLoggedIn,
    );
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: const ValueKey('Channel Screen'),
          child: BraidScaffold(routeState: _routeState),
        ),
        if (!loggedIn)
          const MaterialPage(
            key: ValueKey('Login Screen'),
            child: LoginScreen(),
          ),
      ],
      onPopPage: (route, result) {
        return route.didPop(result);
      },
    );
  }

  @override
  Future<void> setNewRoutePath(BraidRoute configuration) {
    _routeState.route = configuration;
    return SynchronousFuture(null);
  }
}
