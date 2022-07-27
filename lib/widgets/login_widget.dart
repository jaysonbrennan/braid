import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../user/user.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _urlController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  var _displayLoginError = false;

  static const textFieldColor = Color.fromARGB(255, 13, 134, 233);

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
              urlController: _urlController,
              labelText: 'Username',
            ),
            LoginTextField(
              urlController: _urlController,
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

    setState(() {
      _displayLoginError = !success;
    });
    _passwordController.text = '';
  }
}

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    Key? key,
    required TextEditingController urlController,
    required String labelText,
    obscureText = false,
  })  : _urlController = urlController,
        _labelText = labelText,
        _obscureText = obscureText,
        super(key: key);

  final TextEditingController _urlController;
  final String _labelText;
  final bool _obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextField(
        controller: _urlController,
        obscureText: _obscureText,
        cursorColor: Colors.yellow,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.blue.shade600,
          labelText: _labelText,
          labelStyle: const TextStyle(
            color: Colors.yellow,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.yellow,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.yellow,
            ),
          ),
        ),
      ),
    );
  }
}
