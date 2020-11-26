import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/material.dart';
import 'package:flutter_appchatbot/Pages/Navigator.dart';
import 'package:flutter_login/flutter_login.dart';
import 'constants.dart';
import 'dart:async';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_appchatbot/Pages/FirstLogin.dart';
import 'package:flutter_appchatbot/main.dart';

class LoginScreen extends StatelessWidget {
  
  static const routeName = '/auth';

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  Future<String> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder = BorderRadius.vertical(
      bottom: Radius.circular(10.0),
      top: Radius.circular(20.0),
    );

    Future<String> _loginUser(LoginData data) {
      print(data);
    }

    Future save(LoginData data) async{
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('us', data.name);
    }

    Future<List> register(LoginData datas) async {
      var url = "$uml/my_store/register.php";
      var response = await http.post(url, body: {
        "username": datas.name,
        "password": datas.password,
      });
      var data = json.decode(response.body);
      if (data == "Error") {
        Fluttertoast.showToast(
            msg: "Username are already use",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),),);
      } else {
        Fluttertoast.showToast(
            msg: "Register Successful",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(),),);
      }
    }


    Future<List> _login(LoginData data) async {
        print('login');
        print(data.name);
        final response = await http.post("$uml/my_store/login.php", body: {
          "username": data.name,
          "password": data.password,
        });

        var datauser = json.decode(response.body);
        print(datauser[0]['USERNAME']);

        if (datauser.length == 0) {
          Fluttertoast.showToast(
              msg: "Invalid username & password",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0
          );
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyHomePage(),),);
        } else {
          if (datauser[0]['NICKNAME'] == null) {
            save(data);
            print('success');
            Fluttertoast.showToast(
                msg: "Login Successful",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0
            );
            username = datauser[0]['USERNAME'];
            Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => welcome(),),);
          }
          else {
            save(data);
            print('success');
            Fluttertoast.showToast(
                msg: "Login Successful",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0
            );
            username = datauser[0]['USERNAME'];
            name = datauser[0]['NICKNAME'];
            Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Nav(),),);
          }
        }
        return datauser;
    }

    return FlutterLogin(
      title: Constants.appName,
      logoTag: Constants.logoTag,
      titleTag: Constants.titleTag,
      messages: LoginMessages(
        usernameHint: 'Username',
        passwordHint: 'Password',
        confirmPasswordHint: 'Confirm',
        loginButton: 'LOG IN',
        signupButton: 'REGISTER',
        forgotPasswordButton: 'Forgot password',
        recoverPasswordButton: 'HELP ME',
        goBackButton: 'GO BACK',
        confirmPasswordError: 'Not match!',
        recoverPasswordIntro: 'Don\'t feel bad. Happens all the time.',
        recoverPasswordDescription: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
        recoverPasswordSuccess: 'Password rescued successfully',
      ),

      emailValidator: (value) {
        if (value.isEmpty) {
          return 'Username is empty';
        }
        return null;
      },
      passwordValidator: (value) {
        if (value.isEmpty) {
          return 'Password is empty';
        }
        return null;
      },

      onLogin: (loginData) {
        print('Login info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        print(loginData);
        _login(loginData);
        return Future.delayed(loginTime).then((_) {
          _loginUser(loginData);
          return null;
        });
      },

      onSignup: (loginData) {
        print('Signup info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        register(loginData);
        return
          Future.delayed(loginTime).then((_) {
            _loginUser(loginData);
            return null;
          });
      },

      onRecoverPassword: (name) {
        print('Recover password info');
        print('Name: $name');
        return _recoverPassword(name);
        // Show new password dialog
      },
    );
  }
}