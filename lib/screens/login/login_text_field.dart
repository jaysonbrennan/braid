import 'package:flutter/material.dart';

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
        autocorrect: false,
        style: const TextStyle(
          color: Colors.yellow,
        ),
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
