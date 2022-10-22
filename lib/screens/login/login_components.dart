import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../routing/login_state.dart';
import '../../user/user.dart';
import 'login_text_field.dart';

class LoginComponents extends StatefulWidget {
  const LoginComponents({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginComponentsState();
}

class _LoginComponentsState extends State<LoginComponents> {
  final _urlController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  var _displayLoginError = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          children: [
            LoginTextField(
              urlController: _urlController,
              labelText: 'Url',
            ),
            LoginTextField(
              urlController: _usernameController,
              labelText: 'Username',
            ),
            LoginTextField(
              urlController: _passwordController,
              labelText: 'Password',
              obscureText: true,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.blue,
              backgroundColor: Colors.yellow,
            ),
            onPressed: () {
              var user = context.read<User>();
              var loginState = context.read<LoginState>();
              _login(
                user,
                loginState,
                host: _urlController.text,
                username: _usernameController.text,
                password: _passwordController.text,
              );
            },
            child: const Text('Log In'),
          ),
        ),
        if (_displayLoginError)
          const Text(
            'Log in failed!',
            style: TextStyle(color: Colors.red),
          )
        else
          const Text('')
      ],
    );
  }

  void _login(
    User user,
    LoginState loginState, {
    required String host,
    required String username,
    required String password,
  }) async {
    final success =
        await user.login(host: host, username: username, password: password);
    loginState.loggedIn = success;
    _onLoginAttemptComplete(success);
  }

  void _onLoginAttemptComplete(bool success) {
    if (success) {
      _urlController.text = '';
      _usernameController.text = '';
    }

    setState(() {
      _displayLoginError = !success;
    });
    _passwordController.text = '';
  }
}
