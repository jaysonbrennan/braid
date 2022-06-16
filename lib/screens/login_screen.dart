import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../user/user.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _urlController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  var _displayLoginError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _urlController,
              decoration: const InputDecoration(labelText: 'Url'),
            ),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                onPressed: () {
                  var user = context.read<User>();
                  _login(
                    user,
                    host: _urlController.text,
                    username: _usernameController.text,
                    password: _passwordController.text,
                  );
                },
                child: const Text('Log In'),
              ),
            ),
          ],
        ),
      ),
      //backgroundColor: const Color(0xFF424242), // dark grey
    );
  }

  void _login(
    User user, {
    required String host,
    required String username,
    required String password,
  }) async {
    final success =
        await user.login(host: host, username: username, password: password);
    _onLoginAttemptComplete(success);
  }

  void _onLoginAttemptComplete(bool success) {
    if (success) {
      _urlController.text = '';
      _usernameController.text = '';
    }

    _displayLoginError = !success;
    _passwordController.text = '';
  }
}
