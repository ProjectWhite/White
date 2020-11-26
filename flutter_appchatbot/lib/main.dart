import 'dart:async';
import 'package:flutter_appchatbot/DiaryNew/PageDiary.dart';
import 'package:flutter_appchatbot/Pages/Navigator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Pagechat/chatbot.dart';
import 'Pages/intro.dart';
import 'Pages/FirstLogin.dart';
import 'package:flutter/services.dart';
import 'login/login_screen.dart';
import 'package:flutter_appchatbot/Pages/FirstLogin.dart';

void main() async{
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor:
      SystemUiOverlayStyle.dark.systemNavigationBarColor,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var u = preferences.getString('us');
  username = u;
  runApp(MaterialApp(home: u == null ? intro() : Nav(),
    debugShowCheckedModeBanner: false,));
}

String username='';
String name='';
String uml='https://a0f21483d26f.ngrok.io';
int k=2;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: TextTheme(
          headline: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 24),
          body1: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20),
          body2: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontSize: 18),
          subtitle: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontSize: 14),
        ),
      ),
      title: 'White',
      routes: <String,WidgetBuilder>{
        '/wellcome1': (BuildContext context)=> new wellcome(),
        '/MyHomePage': (BuildContext context)=> new MyHomePage(),
        '/chat' : (BuildContext context)=> new chatbot(username: username),
        '/Navi' : (BuildContext context)=> new Nav(),
        '/Diary' : (BuildContext context)=> new Diary(),
        '/intro' : (BuildContext context)=> new intro(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController user=new TextEditingController();
  TextEditingController pass=new TextEditingController();

  String msg='';

  Future save() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('us', user.text);
  }
  
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       title: 'White',
       theme: ThemeData(
         // brightness: Brightness.dark,
         primarySwatch: Colors.deepPurple,
         accentColor: Colors.orange,
         cursorColor: Colors.orange,
         // fontFamily: 'SourceSansPro',
         textTheme: TextTheme(
           display2: TextStyle(
             fontFamily: 'OpenSans',
             fontSize: 45.0,
             // fontWeight: FontWeight.w400,
             color: Colors.orange,
           ),
           button: TextStyle(
             // OpenSans is similar to NotoSans but the uppercases look a bit better IMO
             fontFamily: 'OpenSans',
           ),
           caption: TextStyle(
             fontFamily: 'NotoSans',
             fontSize: 12.0,
             fontWeight: FontWeight.normal,
             color: Colors.deepPurple[300],
           ),
           display4: TextStyle(fontFamily: 'Quicksand'),
           display3: TextStyle(fontFamily: 'Quicksand'),
           display1: TextStyle(fontFamily: 'Quicksand'),
           headline: TextStyle(fontFamily: 'NotoSans'),
           title: TextStyle(fontFamily: 'NotoSans'),
           subhead: TextStyle(fontFamily: 'NotoSans'),
           body2: TextStyle(fontFamily: 'NotoSans'),
           body1: TextStyle(fontFamily: 'NotoSans'),
           subtitle: TextStyle(fontFamily: 'NotoSans'),
           overline: TextStyle(fontFamily: 'NotoSans'),
         ),
       ),
       home: LoginScreen(),
       // navigatorObservers: [TransitionRouteObserver()],
       routes: {
         LoginScreen.routeName: (context) => LoginScreen(),
       },
     );
  }
}

