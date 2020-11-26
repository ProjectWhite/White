import 'package:flutter/material.dart';
import 'package:flutter_appchatbot/Pages/testm.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';
import 'package:http/http.dart' as http;

class editpassword extends StatefulWidget {
  @override
  _editpasswordState createState() => _editpasswordState();
}

class _editpasswordState extends State<editpassword> {

  TextEditingController message = TextEditingController();

  Future _editpassword() async {
    var url = "$uml/my_store/updatepassword.php";
    print(username);
    print(message.text);
    var response = await http.post(url, body: {
      "username": username,
      "password": message.text,
    });
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('password have change'),
            actions: <Widget>[
              new FlatButton(
                child: new Text('ok'),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Nav(),),);
                },
              )
            ],
          );
        });
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
                  hintText: 'Enter new password',
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
      onPressed: (){
        _editpassword();
      },
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.blue[500],
      child: Text(
        'Change',
        style: GoogleFonts.rubik(
            textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white
            )
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
