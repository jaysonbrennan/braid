import 'package:flutter/material.dart';

import 'login_components.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: LoginComponents(),
        ),
      ),
    );
  }
}
