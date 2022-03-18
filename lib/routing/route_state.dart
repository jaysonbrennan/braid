import 'package:flutter/foundation.dart';
import 'parsed_route.dart';

class RouteState extends ChangeNotifier {
  ParsedRoute _route;

  RouteState() : _route = ParsedRoute('/');

  ParsedRoute get route => _route;

  set route(ParsedRoute route) {
    // Don't notify if route hasn't change
    if (_route == route) return;

    _route = route;
    notifyListeners();
  }
}
