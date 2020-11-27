import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_appchatbot/Pagesetting/BottomSheet.dart';
import 'package:flutter_appchatbot/Pagesetting/ChangeName.dart';
import 'package:flutter_appchatbot/Pagesetting/ChangePass.dart';
import 'package:flutter_appchatbot/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AccountPasswordPage extends StatefulWidget {
  @override
  _AccountPasswordPageState createState() => _AccountPasswordPageState();
}

class _AccountPasswordPageState extends State<AccountPasswordPage> {

  @override
  Widget build(BuildContext context) {
    var headline = GoogleFonts.rubik(
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.blue[400], letterSpacing: -0.5)
    );
    return Scaffold(
      backgroundColor: Colors.white ,
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
                      style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                              color: Colors.blue[400],
                              fontSize: 24,
                              letterSpacing: -0.6,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(width: 8,),
                    Icon(
                      Icons.vpn_key_rounded, color: Colors.blue[300], size: 40,
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
            buildInkWell('Change Nickname', ChangeName(), name),
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
            Divider(thickness: 2, color: Colors.black12),
            buildInkWell('Change Password', ChangePass(), ''),
            SizedBox(height: 40,),


            Column(
              children: [
                Container(
                  width: 180,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.blue[500],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Delete Account '+ username + ' ?',
                              style: GoogleFonts.rubik(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  color: Colors.black,
                                  letterSpacing: -0.5,
                                )),
                              ),
                              actions: <Widget>[
                                Row(
                                  children: [
                                    FlatButton(
                                      child: new Text(
                                        'Yes',
                                        style: GoogleFonts.rubik(
                                            textStyle: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                            )),
                                      ),
                                      onPressed: () async {
                                        var url = "$uml/my_store/delete.php";
                                        print(username);
                                        await http.post(url, body: {
                                          "username": username,
                                        });
                                        SharedPreferences preferences = await SharedPreferences.getInstance();
                                        preferences.remove('us');
                                        Navigator.of(context).popUntil((route) => route.isFirst);
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(),),);
                                      },
                                    ),
                                    FlatButton(
                                      child: new Text(
                                        'Cancel',
                                        style: GoogleFonts.rubik(
                                            textStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                            )),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      }
                                    ),
                                  ],
                                )
                              ],
                            );
                          });
                    },
                    child: Text(
                      ' Delete Account ',
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      )
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.blue[500],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  InkWell buildInkWell(String textTitle, page, textBehide) {
    var body1 = GoogleFonts.rubik(
        textStyle: TextStyle(fontSize: 15, color: Colors.blue[300], fontStyle: FontStyle.italic, letterSpacing: -0.6, fontWeight: FontWeight.w300)
    );
    var body = GoogleFonts.rubik(
        textStyle: TextStyle(fontSize: 16, color: Colors.blue[400], letterSpacing: -0.6, fontWeight: FontWeight.normal)
    );
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          shape: BottomSheetShape(),
          backgroundColor: Colors.blue[300],
          context: context,
          builder: (context) => Container(
            height: 280,
            padding: const EdgeInsets.only(top: 30, left: 48, right: 48),
            child: page,
          ),
        );
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
                Icon(Icons.arrow_forward_ios_rounded, color: Colors.black38, size: 18)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

