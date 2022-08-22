import 'package:braid/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

class LoginPage extends Page {
  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      transitionDuration: const Duration(milliseconds: 750),
      reverseTransitionDuration: const Duration(milliseconds: 750),
      pageBuilder: (context, animation, secondaryAnimation) {
        var offsetTween = Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        );
        var curveTween = CurveTween(curve: Curves.easeInOutBack);

        return SlideTransition(
          position: animation.drive(curveTween).drive(offsetTween),
          child: WillPopScope(
            onWillPop: () async => false,
            child: const LoginScreen(),
          ),
        );
      },
    );
  }
}
