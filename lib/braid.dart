import 'package:braid/services/rocketchat/rocketchat_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'routing/login/login_router_delegate.dart';
import 'routing/login/login_route_parser.dart';
import 'routing/login/login_state.dart';
import 'themes/braid_theme.dart';
import 'user/user.dart';

class Braid extends StatefulWidget {
  const Braid({Key? key}) : super(key: key);

  @override
  _BraidState createState() => _BraidState();
}

class _BraidState extends State<Braid> {
  final _routeInformationParser = LoginRouteInformationParser();
  late final LoginRouterDelegate _routerDelegate;

  @override
  void initState() {
    _routerDelegate = LoginRouterDelegate();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginState>(create: (context) => LoginState()),
        Provider<User>(
          create: (context) => User(loginService: RocketchatLogin()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Braid',
        theme: braidLightTheme,
        routeInformationParser: _routeInformationParser,
        routerDelegate: _routerDelegate,
      ),
    );
  }
}
