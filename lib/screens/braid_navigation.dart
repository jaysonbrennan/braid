import 'package:flutter/material.dart';

class BraidScaffold extends StatefulWidget {
  const BraidScaffold({Key? key}) : super(key: key);

  @override
  State<BraidScaffold> createState() => _BraidScaffoldState();
}

class _BraidScaffoldState extends State<BraidScaffold> {
  int _tabIndex = 0;

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
        currentIndex: _tabIndex,
        onTap: _onTabSelected,
      ),
    );
  }

  void _onTabSelected(int index) {
    setState(() {
      _tabIndex = index;
    });
  }
}
