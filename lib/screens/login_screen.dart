import 'package:flutter/material.dart';

import '../widgets/login_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: LoginWidget(),
        ),
      ),
    );
  }
}
