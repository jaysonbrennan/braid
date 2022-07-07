import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../user/user.dart';

class ChannelScreen extends StatelessWidget {
  const ChannelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          var user = context.read<User>();
          user.logout();
        },
        child: const Text('Log Out'),
      ),
    );
  }
}
