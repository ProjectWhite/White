import 'package:flutter/material.dart';
import 'package:flutter_appchatbot/Pages/Navigator.dart';
import 'package:flutter_appchatbot/main.dart';
import 'package:flutter/services.dart';
import '../constrants.dart';
import 'package:http/http.dart' as http;

class wellcome extends StatefulWidget {
  @override
  _wellcomeState createState() => _wellcomeState();
}

class _wellcomeState extends State<wellcome> {

  TextEditingController nickname = new TextEditingController();

  Widget _buildname() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image.asset('assets/Let.png',scale:4,),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 60.0,
          child: TextField(
            controller: nickname,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.drive_file_rename_outline,
                color: Colors.grey[700],
              ),
              hintText: 'Enter your name',
              hintStyle: TextStyle(
                color: Colors.grey[700],
                fontFamily: 'RobotoCondensed',
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildok() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 3.0,
        onPressed: () async {
          var url= await "$uml/my_store/updatenickname.php";
          http.post(url,body:{
            'username' : username,
            'name': nickname.text,
          });
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Nav(),),);
          setState(() {
            name = nickname.text;
          });
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.black,
        child: Text(
          'FINISH',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed',
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 120.0,
              ),
              child: Wrap(
                children: <Widget>[
                  Image.asset("assets/LASTTHING.png"),
                  SizedBox(height: 30,),
                  _buildname(),
                  SizedBox(height: 200,),
                  _buildok()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}