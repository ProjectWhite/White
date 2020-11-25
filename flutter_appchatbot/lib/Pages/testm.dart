
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_appchatbot/DiaryNew/PageDiary.dart';
import 'package:flutter_appchatbot/Milestoneherebright/Milestone.dart';
import 'package:flutter_appchatbot/Milestoneherebright/Milestonelite.dart';
import 'package:flutter_appchatbot/Milestoneherebright/Pages.dart';
import 'package:flutter_appchatbot/Milestoneherebright/ShowStatMileStone.dart';
import 'package:flutter_appchatbot/Pagesetting/setting.dart';
import 'package:flutter_appchatbot/Pagechat/chatbot.dart';
import 'package:flutter_appchatbot/main.dart';
import 'package:flutter_appchatbot/Milestoneherebright/ShowStatMileStone.dart';
import 'package:flutter_appchatbot/DiaryNew/CustomDialog.dart';
import 'package:http/http.dart' as http;

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {

  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Showmilestone(),
    Diary(),
    chatbot(),
    SettingUI()
  ];

  void _onItemTap(int index) {

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(l==1){
      _selectedIndex = 1;
    }
    l=0;
    k=1;
    check=0;
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
              activeIcon: Icon(Icons.line_weight_rounded),
              backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            label: 'Diary',
            icon: Icon(Icons.event),
            activeIcon: Icon(Icons.event_note),
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
              label: 'Chat',
              icon: Icon(Icons.hdr_weak_rounded),
            activeIcon: Icon(Icons.hdr_strong_rounded),
              backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
              label: 'Account',
              icon: Icon(Icons.supervisor_account_outlined),
              activeIcon: Icon(Icons.supervised_user_circle),
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