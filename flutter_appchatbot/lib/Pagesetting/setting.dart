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
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue[400],
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
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Setting",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.blue[100],
                              fontSize: 20,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                IconButton(
                  alignment: Alignment.topRight,
                  icon: Icon(Icons.logout, size: 35, color: Colors.white),
                  onPressed: () {logOut(context);},
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
