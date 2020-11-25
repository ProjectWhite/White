import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_appchatbot/Pagesetting/checkpassword.dart';
import 'package:flutter_appchatbot/main.dart';
import 'package:google_fonts/google_fonts.dart';
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
    var headline = GoogleFonts.robotoCondensed(
        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white)
    );
    return Scaffold(
      backgroundColor: Colors.blue[300] ,
      body: Container(
        padding: EdgeInsets.only(left: 14, right: 14, top: 25),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  borderRadius: BorderRadius.circular(30),
                  elevation: 5,
                  color: Colors.blue[500],
                  child: IconButton(
                    alignment: Alignment.center,
                    icon: Icon(Icons.arrow_back_ios_rounded, size: 20, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Account & Password",
                      style: GoogleFonts.robotoCondensed(
                          textStyle: TextStyle(
                              shadows: [Shadow(color: Colors.black, offset: Offset(2,3), blurRadius: 10)],
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(width: 8,),
                    Stack(
                      children: [
                        Positioned(
                          left: 2,
                          top: 3,
                          child: Icon(
                            Icons.vpn_key_rounded, color: Colors.black38, size: 40,
                          ),
                        ),
                        Icon(
                          Icons.vpn_key_rounded, color: Colors.blue[500], size: 40,
                        ),
                      ]
                    )
                  ],
                ),

              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Icon(
                  Icons.person_rounded,
                  color: Colors.black54,
                ),
                SizedBox(width: 8),
                Text(
                  'Account',
                  style: headline,
                ),
              ],
            ),
            SizedBox(height: 8),
            Divider(thickness: 2, color: Colors.black12),
            buildInkWell('Email', VerifyEmail(), 'Unverified'),
            buildInkWell('Username', ChangeUsername(), username),
            SizedBox(height: 30),
            Row(
              children: [
                Icon(
                  Icons.vpn_key_rounded,
                  color: Colors.black54,
                ),
                SizedBox(width: 8),
                Text(
                  'Password',
                  style: headline,
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
                        title: Text('Delete Account : '+ username),
                        actions: <Widget>[
                          Row(
                            children: [
                              Align(
                                child: FlatButton(
                                  child: Text('cancel',),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              SizedBox(width: 6,),
                              Align(
                                child: FlatButton(
                                  child: Text(
                                    'confirm',
                                    textAlign: TextAlign.center,
                                  ),
                                  onPressed: () async {
                                    var url = "$uml/my_store/delete.php";
                                    print(username);
                                    await http.post(url, body: {
                                      "username": username,
                                    });
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(),),);
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    });
              },
              color: Colors.blue[500],
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
    var body1 = GoogleFonts.robotoCondensed(
        textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white70, fontStyle: FontStyle.italic)
    );
    var body = GoogleFonts.robotoCondensed(
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white)
    );
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
            Text(textTitle, style: body),
            Row(
              children: [
                Text(textBehide, style: body1),
                SizedBox(width: 10),
                Icon(Icons.arrow_forward_ios_rounded, color: Colors.white,
                    size: 18)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

