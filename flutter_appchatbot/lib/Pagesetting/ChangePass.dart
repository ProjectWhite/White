import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_appchatbot/Pagesetting/BottomSheet.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';
import 'package:http/http.dart' as http;
import 'Editpassword.dart';

class ChangePass extends StatefulWidget {
  @override
  _ChangepassState createState() => _ChangepassState();
}

class _ChangepassState extends State<ChangePass> {
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
      showModalBottomSheet(
        shape: BottomSheetShape(),
        backgroundColor: Colors.blue[300],
        context: context,
        builder: (context) => Container(
          height: 280,
          padding: const EdgeInsets.only(top: 30, left: 48, right: 48),
          child: editpassword(),
        ),
      );
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

  bool _obscureText = true;

  Widget buildmessage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20.0),
        Material(
          elevation: 3,
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 320,
            height: 60,
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              width: 280,
              height: 60,
              child: TextField(
                controller: message,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter your password',
                  hintStyle: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[700],
                      )),
                  suffixIcon: IconButton(
                    icon: Icon(_obscureText
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                      color: _obscureText
                        ? Colors.black54
                        : Colors.blue[400],
                        ),
                    onPressed: (){
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
              ),
            ),
          ),
        ),
        )
      ],
    );
  }

  Widget buildsentBtn() {
    return RaisedButton(
      onPressed: () {
        checkpass();
      },
      padding: EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.blue[500],
      child: Text(
        'Next',
        style: GoogleFonts.rubik(
            textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white
            )
        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 30.0),
          buildmessage(),
          SizedBox(height: 50.0,),
          buildsentBtn(),
        ],
      ),
    );
  }
}

