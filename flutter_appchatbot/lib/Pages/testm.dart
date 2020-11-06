
import 'package:flutter/material.dart';
import 'package:flutter_appchatbot/Milestoneherebright/Milestone.dart';
import 'package:flutter_appchatbot/Pagesetting/setting.dart';
import 'package:flutter_appchatbot/Pagechat/chatbot.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Milestone(),
    chatbot(),
    SettingPage()
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              label: 'Milestone',
              icon: Icon(Icons.line_style_rounded),
              backgroundColor: Colors.green
          ),
          BottomNavigationBarItem(
              label: 'Chat',
              icon: Icon(Icons.hdr_strong_rounded),
              backgroundColor: Colors.red
          ),
          BottomNavigationBarItem(
              label: 'Account',
              icon: Icon(Icons.supervisor_account_outlined),
              backgroundColor: Colors.blue
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
      ),
    );
  }
}