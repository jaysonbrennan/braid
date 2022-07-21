import 'package:flutter/foundation.dart';

import 'braid_route.dart';

class RouteState extends ChangeNotifier {
  var _tabIndex = 0;
  BraidRoute _route;

  RouteState() : _route = HomeRoute();

  BraidRoute get route => _route;

  set route(BraidRoute route) {
    // Don't notify if route hasn't change
    if (_route == route) return;

    _route = route;
    notifyListeners();
  }

  int get tabIndex => _tabIndex;

  set tabIndex(int index) {
    // Don't notify if index hasn't change
    if (_tabIndex == index) return;

    _tabIndex = index;
    notifyListeners();
  }
}
