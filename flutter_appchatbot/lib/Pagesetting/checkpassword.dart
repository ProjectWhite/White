import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constrants.dart';
import '../main.dart';
import 'package:http/http.dart' as http;

import 'editpassword.dart';



class checkpass extends StatefulWidget {
  @override
  _checkpassState createState() => _checkpassState();
}

class _checkpassState extends State<checkpass> {
  TextEditingController message = TextEditingController();

  Future checkpass() async {
    var url = "$uml/my_store/login.php";
    print(username);
    print(message.text);

    var response = await http.post(url, body: {
      "username": username,
      "password": message.text,
    });

    var data = json.decode(response.body);
    String m = '';

    if (data.length == 0) {
      Fluttertoast.showToast(
          msg: "password incorrect",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    else {
      Navigator.push(
        context, MaterialPageRoute(builder: (context) => editpassword(),),);
      Fluttertoast.showToast(
          msg: "correct",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  Widget buildmessage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: message,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.report_gmailerrorred_outlined,
                color: Colors.white,
              ),
              hintText: 'Enter your password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildsentBtn() {
    return RaisedButton(
      onPressed: () {
        checkpass();
      },
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: SizedBox(
        width: 50,
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Text(
              'next',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'RobotoCondensed',
              ),
            ),
            SizedBox(width: 8),
          ],
        ),
      ),
    );

    // return Container(
    //   padding: EdgeInsets.symmetric(vertical: 15.0),
    //   width: double.infinity,
    //   child: RaisedButton(
    //     elevation: 5.0,
    //     onPressed: () {
    //       _editpassword();
    //     },
    //     padding: EdgeInsets.all(15.0),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(30.0),
    //     ),
    //     color: Colors.white,
    //     child: Text(
    //       'change',
    //       style: TextStyle(
    //         color: Color(0xFF527DAA),
    //         letterSpacing: 1.5,
    //         fontSize: 18.0,
    //         fontWeight: FontWeight.bold,
    //         fontFamily: 'OpenSans',
    //       ),
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 100.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      buildmessage(),
                      SizedBox(
                        height: 50.0,
                      ),
                      buildsentBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

