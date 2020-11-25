import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_appchatbot/Pagesetting/checkpassword.dart';
import 'package:flutter_appchatbot/main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'account_username.dart';
import 'account_verify.dart';
import 'package:http/http.dart' as http;

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
            buildInkWell('Change Password', checkpass(), ''),
            SizedBox(height: 40,),
            RaisedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Are you sure to delete account'),
                        actions: <Widget>[
                          new FlatButton(
                            child: new Text('yes'),
                            onPressed: ()  async {
                              var url = "$uml/my_store/delete.php";
                              print(username);
                              await http.post(url, body: {
                                "username": username,
                              });
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(),),);
                            },
                          )
                        ],
                      );
                    });
              },
              color: Colors.blue[400],
              padding: EdgeInsets.symmetric(horizontal: 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Text(
                ' Delete Account ',
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 2.2,
                  color: Colors.white,
                  fontFamily: 'RobotoCondensed',
                ),
              ),
            ),

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

