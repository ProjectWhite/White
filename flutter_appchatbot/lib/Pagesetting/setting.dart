import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'Griddashboard.dart';

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
            title: Text('Are you sure to logout', style:
              GoogleFonts.rubik(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                )),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Yes',
                  style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      )),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(),),);
                },
              ),
              new FlatButton(
                child: new Text('Cancel',
                  style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      )),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Account",
                      style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                              color: Colors.blue[400],
                              fontSize: 36,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Setting",
                      style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                              color: Colors.blue[200],
                              fontSize: 20,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                Material(
                  borderRadius: BorderRadius.circular(30),
                  elevation: 5,
                  color: Colors.blue[400],
                  child: IconButton(
                    alignment: Alignment.centerRight,
                    icon: Icon(Icons.logout, size: 30, color: Colors.white),
                    onPressed: () {logOut(context);},
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GridDashboard(),
        ],
      ),


    );
  }
}
