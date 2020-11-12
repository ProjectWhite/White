import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_appchatbot/main.dart';
import 'account_changepass.dart';
import 'account_username.dart';
import 'account_verify.dart';

class AccountPasswordPage extends StatefulWidget {
  @override
  _AccountPasswordPageState createState() => _AccountPasswordPageState();
}

class _AccountPasswordPageState extends State<AccountPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account & Password',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'RobotoCondensed',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
        elevation: 15,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.blue[100],
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 14, right: 14, top: 25),
        child: ListView(
          children: [
            Row(
              children: [
                Icon(
                  Icons.person_rounded,
                  color: Colors.blue[400],
                ),
                SizedBox(width: 8),
                Text(
                  'Account',
                  style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18, fontFamily: 'RobotoCondensed',
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Divider(thickness: 2),
            buildInkWell('Email', VerifyEmail(), 'Unverified'),
            buildInkWell('Username', ChangeUsername(), username),
            SizedBox(height: 30),
            Row(
              children: [
                Icon(
                  Icons.vpn_key_rounded,
                  color: Colors.blue[400],
                ),
                SizedBox(width: 8),
                Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18,fontFamily: 'RobotoCondensed',
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Divider(thickness: 2),
            buildInkWell('Change Password', ChangePassword(), '')
          ],
        ),
      ),
    );
  }

  InkWell buildInkWell(String textTitle, page, textBehide) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => page));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(textTitle, style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400,fontFamily: 'RobotoCondensed',
            ),),
            Row(
              children: [
                Text(textBehide, style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'RobotoCondensed',
                ),),
                SizedBox(width: 10),
                Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey[600],
                    size: 18)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

