import 'package:flutter/material.dart';

import '../widgets/login_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: LoginWidget(),
          ),
        ),
      ),
    );
  }
}
