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
String uml='https://de4cd3c3bcd4.ngrok.io';
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


  bool _rememberMe = false;

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Username',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: user,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.account_box,
                color: Colors.white,
              ),
              hintText: 'Enter your Username',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: pass,
            obscureText: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                // save();
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: (){
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildtext(){
    return RichText(
      text: TextSpan(
        text: 'Don\'t have an Account? ',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () => Navigator.push(context,
        MaterialPageRoute(builder: (context) => Register(),),),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],

        ),
      ),
    );
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
