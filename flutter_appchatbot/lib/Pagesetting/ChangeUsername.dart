import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangeUsername extends StatefulWidget {
  @override
  _ChangeUsernameState createState() => _ChangeUsernameState();
}

class _ChangeUsernameState extends State<ChangeUsername> {
  TextEditingController message = TextEditingController();

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
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter your username',
                  hintStyle: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[700],
                      )),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget buildsentBtn() {
    return RaisedButton(
      onPressed: () {
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

