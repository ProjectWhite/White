import 'package:flutter/material.dart';
import 'package:flutter_appchatbot/Pages/Navigator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../main.dart';

class ChangeName extends StatefulWidget {
  @override
  _ChangeNameState createState() => _ChangeNameState();
}

class _ChangeNameState extends State<ChangeName> {
  TextEditingController newnickname = TextEditingController();

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
                controller: newnickname,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter your nickname',
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
      onPressed: () async {
        var url= await "$uml/my_store/updatenickname.php";
        http.post(url,body:{
          'username' : username,
          'name': newnickname.text,
        });
        Navigator.pop(context, );
        setState(() {
          name = newnickname.text;
        });
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

