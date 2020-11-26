import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appchatbot/Pagesetting/BottomSheet.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';
import 'HelpCenterPage2.dart';
import 'package:http/http.dart' as http;

class HelpCenterPage extends StatefulWidget {
  @override
  _HelpCenterPageState createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {

  int _selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: Column(
            children: [
              SizedBox(height: 90,),
              Row(
                  children: [
                    SizedBox(width: 10,),
                    Material(
                      borderRadius: BorderRadius.circular(30),
                      elevation: 5,
                      color: Colors.blue[500],
                      child: IconButton(
                        alignment: Alignment.center,
                        icon: Icon(Icons.arrow_back_ios_rounded, size: 20, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                          },
                      ),
                    ),
                    SizedBox(width: 144,),
                    Text(
                      "Help Center",
                      style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                              color: Colors.blue[400],
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.6
                          )),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.live_help_rounded, color: Colors.blue[300], size: 40,
                    )
                  ]),
            ],
          ),
        ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(''),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: options.length + 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return SizedBox(height: 15.0);
            } else if (index == options.length + 1) {
              return SizedBox(height: 100.0);
            }
            return buildContainer(index);
          },
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: RaisedButton(
                onPressed: () {
                  showModalBottomSheet(
                    shape: BottomSheetShape(),
                    backgroundColor: Colors.blue[300],
                    context: context,
                    builder: (context) => Container(
                      height: 280,
                      padding: const EdgeInsets.only(top: 30, left: 48, right: 48),
                      child: ReportBottomSheet(),
                      ),
                  );
                },
                color: Colors.blue[500],
                padding: EdgeInsets.only(top: 12, bottom: 12, left: 30, right: 30),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.report_gmailerrorred_rounded,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5),
                    Text(
                      ' Report Message ',
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontSize: 16,
                          letterSpacing: 1,
                          color: Colors.white,
                        ),
                      )
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 90,)
          ],
        ),
      ),
    );
  }



  Container buildContainer(int index) {
    return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 20, right: 15, left: 15),
            width: double.infinity,
            height: 70.0,
            decoration: BoxDecoration(
              color: _selectedOption == index - 1
                  ? Colors.blue[400]
                  : Colors.blue[300],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child:
            ListTile(
              leading: _selectedOption == index -1
                  ? Icon(Icons.question_answer, size: 35.0, color: Colors.black54)
                  : Icon(Icons.question_answer_outlined, size: 30.0, color: Colors.black26),
              title: Text(
                options[index - 1].title,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                    color: _selectedOption == index - 1
                        ? Colors.black
                        : Colors.grey[700],
                  ),
                )
              ),
              subtitle: Text(
                options[index - 1].subtitle,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                    color:
                    _selectedOption == index - 1
                        ? Colors.grey[900]
                        : Colors.grey[600],
                  ),
                )
              ),
              selected: _selectedOption == index - 1,
              onTap: () {
                setState(() {
                  _selectedOption = index - 1;
                });
              },
            ),
          );
  }
}

class ReportBottomSheet extends StatefulWidget {
  @override
  _ReportBottomSheetState createState() => _ReportBottomSheetState();
}

class _ReportBottomSheetState extends State<ReportBottomSheet> {

  TextEditingController _message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 50),
          buildmessage(),
          SizedBox(height: 30),
          buildsentBtn(),
        ],
      ),
    );
  }

  @override
  Future _insertreport() async {
    var url = "$uml/my_store/insertreport.php";
    print(username);
    print(_message.text);
    var response = await http.post(url, body: {
      "username": username,
      "message": _message.text,
    });
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Report are already sent it'),
            actions: <Widget>[
              new FlatButton(
                child: new Text('ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  Widget buildmessage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Material(
          elevation: 3,
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 320,
            height: 80,
            alignment: Alignment.centerLeft,
            child: Container(
              alignment: Alignment.centerLeft,
              width: 280,
              height: 80,
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: _message,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.report_gmailerrorred_outlined,
                    color: Colors.black54,
                  ),
                  hintText: 'Enter your detail',
                  hintStyle: GoogleFonts.rubik(
                      textStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black54
                      )
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildsentBtn() {
    return Container(
      width: 240,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          _insertreport();

        },
        padding: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.blue[500],
        child: Text(
          'sent report',
          style: GoogleFonts.rubik(
            textStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white
            )
          ),
        ),
      ),
    );
  }
}






