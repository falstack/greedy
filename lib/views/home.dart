import 'package:flutter/material.dart';
import 'package:greedy/config/app.dart';
import 'package:greedy/views/main-note.dart';
import 'package:greedy/views/main-notice.dart';
import 'package:greedy/views/main-user.dart';
import 'package:greedy/views/main-zone.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;
  List<Widget> _pages = [
    MainNote(),
    MainZone(),
    MainNotice(),
    MainUser()
  ];
  List<BottomNavigationBarItem> _tabs = [
    BottomNavigationBarItem(
      icon: Icon(Icons.note),
      title: Text('发现')
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.category),
        title: Text('分区')
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.notifications),
        title: Text('消息')
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('我的')
    )
  ];

  void _itemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _tabs,
        currentIndex: _currentIndex,
        onTap: _itemTapped,
        type: BottomNavigationBarType.fixed,
        fixedColor: App.color,
        selectedFontSize: 12.0,
      ),
    );
  }
}
