import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appchatbot/Milestoneherebright/Milestone.dart';
import 'package:flutter_appchatbot/Pagechat/chatbot.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'edit_profile.dart';
import 'white_profile.dart';
import 'account_password.dart';
import 'theme.dart';
import 'prefered_hours.dart';
import 'security.dart';
import 'rate_us.dart';
import 'help_center.dart';

class SettingUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackGestureWidthTheme(
      backGestureWidth: BackGestureWidth.fraction(0.4),
      child: MaterialApp(
        theme: ThemeData(
            pageTransitionsTheme: PageTransitionsTheme(
                builders: {
                  TargetPlatform.android : CupertinoPageTransitionsBuilderCustomBackGestureWidth(),
                  TargetPlatform.iOS : CupertinoPageTransitionsBuilderCustomBackGestureWidth(),

                },
            ),
        ),
        debugShowCheckedModeBanner: false,
        title: 'Setting UI',
        home: SettingPage(),

      ),
    );
  }
}

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  Future logOut(BuildContext context)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('us');
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Are you sure to logout'),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Yes'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(),),);
                },
              )
            ],
          );
        });
  }
  int _currentIndex=0;
  bool _notification = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 10, top: 40, right: 16),
        child: ListView(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                SizedBox(width: 10),
                Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'RobotoCondensed',
                  ),
                ),


              ],
            ),
            SizedBox(height: 25),
            buildListTile('My Profile', Icons.person, EditProfilePage()),
            buildListTile('White Profile', Icons.favorite, WhiteProfilePage()),
            buildListTile('Account & Password', Icons.vpn_key, AccountPasswordPage()),
            buildListTile('Theme', Icons.color_lens, ThemePage()),
            SwitchListTile(
              title: Text('Notification', style: TextStyle(fontSize: 20,fontFamily: 'RobotoCondensed',),),
              secondary: Icon(Icons.notifications, color: Colors.blue[300]),
              value: _notification,
              onChanged: (value){
                setState(() {
                  _notification = value;
                });
              },
            ),
            buildListTile('Preferred Hours', Icons.access_time, PreferedHoursPage()),
            buildListTile('Security', Icons.lock, SecurityPage()),
            buildListTile('Rate Us', Icons.star, RatePage()),
            buildListTile('Help Center', Icons.help, HelpCenterPage()),
            SizedBox(height: 20),
            Center(
              child: RaisedButton(
                onPressed: () {
                  logOut(context);
                },
                color: Colors.blue[400],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: 120,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        ' LOG OUT',
                        style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'RobotoCondensed',
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.logout, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),


    );
  }

  ListTile buildListTile(String labelText, icon, page  ) {
    return ListTile(
            title: Text(
              labelText,
              style: TextStyle(
                fontSize: 20,
                  fontFamily: 'RobotoCondensed',
              ),
            ),
            leading: Icon(icon, color: Colors.blue[300],),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black,),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => page));
            },
          );
  }
  
  
}
