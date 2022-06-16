import 'package:braid/services/rocketchat/rocketchat_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'routing/braid_delegate.dart';
import 'routing/braid_parser.dart';
import 'routing/route_state.dart';
import 'themes/braid_theme.dart';
import 'user/user.dart';

class Braid extends StatefulWidget {
  const Braid({Key? key}) : super(key: key);

  @override
  _BraidState createState() => _BraidState();
}

class _BraidState extends State<Braid> {
  final _routeState = RouteState();
  final _routeInformationParser = BraidRouteInformationParser();
  late final _routerDelegate;

  @override
  void initState() {
    _routerDelegate = BraidRouterDelegate(_routeState);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<User>(
      create: (context) => User(loginService: RocketchatLogin()),
      child: MaterialApp.router(
        title: 'Braid',
        theme: braidLightTheme,
        routeInformationParser: _routeInformationParser,
        routerDelegate: _routerDelegate,
      ),
    );
  }
}
