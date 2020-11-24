import 'dart:async';
import 'dart:convert';
import 'package:flutter_appchatbot/Pages/testm.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'Pagechat/chatbot.dart';
import 'Pages/wellcome1.dart';
import 'Pages/wellcome2.dart';
import 'constrants.dart';
import 'package:flutter/services.dart';
import 'login/dashboard_screen.dart';
import 'login/login_screen.dart';
import 'login/transition_route_observer.dart';
import 'register.dart';
import 'package:flutter_appchatbot/Pages/wellcome1.dart';

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
  runApp(MaterialApp(home: u == null ? MyHomePage() : Nav(),
    debugShowCheckedModeBanner: false,));
}

String username='';
String name='';
String uml='https://e283a556408f.ngrok.io';
int k;

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
        '/wellcome2': (BuildContext context)=> new wellcome2(),
        '/MyHomePage': (BuildContext context)=> new MyHomePage(),
        '/chat' : (BuildContext context)=> new chatbot(username: username),
        '/Navi' : (BuildContext context)=> new Nav(),
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
       title: 'Login Demo',
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
         DashboardScreen.routeName: (context) => DashboardScreen(),
       },
     );
  }
}

// Scaffold(
//   body: AnnotatedRegion<SystemUiOverlayStyle>(
//     value: SystemUiOverlayStyle.light,
//     child: GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Stack(
//         children: <Widget>[
//           Container(
//             height: double.infinity,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Color(0xFF73AEF5),
//                   Color(0xFF61A4F1),
//                   Color(0xFF478DE0),
//                   Color(0xFF398AE5),
//                 ],
//                 stops: [0.1, 0.4, 0.7, 0.9],
//               ),
//             ),
//           ),
//           Container(
//             height: double.infinity,
//             child: SingleChildScrollView(
//               physics: AlwaysScrollableScrollPhysics(),
//               padding: EdgeInsets.symmetric(
//                 horizontal: 40.0,
//                 vertical: 120.0,
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     'Sign In',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontFamily: 'OpenSans',
//                       fontSize: 30.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 30.0),
//                   _buildEmailTF(),
//                   SizedBox(
//                     height: 30.0,
//                   ),
//                   _buildPasswordTF(),
//                   _buildForgotPasswordBtn(),
//                   SizedBox(height: 10.0,),
//                   _buildLoginBtn(),
//                   SizedBox(height: 30.0,),
//                   _buildtext(),
//                   SizedBox(
//                     height: 30.0,
//                   ),
//                   _buildSignupBtn(),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     ),
//   ),
// );
