import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'edit_profile.dart';
import 'white_profile.dart';
import 'account_password.dart';
import 'theme.dart';
import 'prefered_hours.dart';
import 'security.dart';
import 'rate_us.dart';
import 'help_center.dart';


class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _notification = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 40, right: 16),
        child: ListView(
          children: [
            Row(
              children: [
                Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.settings, size: 35, color: Colors.black),
              ],
            ),
            SizedBox(height: 34),
            buildListTile('My Profile', Icons.person, EditProfilePage()),
            buildListTile('White Profile', Icons.favorite, WhiteProfilePage()),
            buildListTile('Account & Password', Icons.vpn_key, AccountPasswordPage()),
            buildListTile('Theme', Icons.color_lens, ThemePage()),
            SwitchListTile(
              title: Text('Notification', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
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
                onPressed: () {},
                color: Colors.blue[400],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: 120,
                  child: Row(
                    children: [
                      Text(
                        ' LOG OUT',
                        style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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
                fontWeight: FontWeight.bold,
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
