import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screens/braid_navigation.dart';
import '../../screens/login/login_page.dart';
import 'login_route.dart';
import 'login_state.dart';

class LoginRouterDelegate extends RouterDelegate<LoginRoute>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<LoginRoute> {
  @override
  final navigatorKey = GlobalKey<NavigatorState>();

  // TODO: Update this to support the web
  @override
  LoginRoute get currentConfiguration => LoginRoute();

  @override
  Widget build(BuildContext context) {
    var loggedIn =
        context.select<LoginState, bool>((loginState) => loginState.loggedIn);
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          child: BraidScaffold(),
        ),
        if (!loggedIn) LoginPage(),
      ],
      onPopPage: (route, result) {
        return route.didPop(result);
      },
    );
  }

  @override
  Future<void> setNewRoutePath(LoginRoute configuration) {
    return SynchronousFuture(null);
  }
}
