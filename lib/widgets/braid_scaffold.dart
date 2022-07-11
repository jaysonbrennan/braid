import 'package:flutter/material.dart';

import '../routing/route_state.dart';

class BraidScaffold extends StatefulWidget {
  const BraidScaffold({Key? key, required this.routeState}) : super(key: key);
  final RouteState routeState;

  @override
  State<BraidScaffold> createState() => _BraidScaffoldState();
}

class _BraidScaffoldState extends State<BraidScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: widget.routeState.tabIndex,
        onTap: _onTabSelected,
      ),
    );
  }

  void _onTabSelected(int index) {
    setState(() {
      widget.routeState.tabIndex = index;
    });
  }
}
