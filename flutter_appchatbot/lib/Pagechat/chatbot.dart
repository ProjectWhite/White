import 'dart:convert';

import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appchatbot/Pagechat/Milestone.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:intl/intl.dart';
import '../main.dart';
import 'Profile.dart';
import 'SecurityPage.dart';
import 'SettingPage.dart';
import 'HelpCenterPage.dart';
import 'package:http/http.dart' as http;

import 'emotiontest.dart';



class chatbot extends StatefulWidget {
  chatbot({Key key, this.title, this.username,this.name}): super(key: key);
  final String username;
  final String name;
  final String title;
  bool bot = false;
  @override
  _chatbotState createState() => _chatbotState();
}

class _chatbotState extends State<chatbot> {


  Future<List> _insertai(String ms) async {
    print(ms);
    await http.post(
        "$uml/my_store/insertAI.php", body: {
      "username": username,
      "message": ms,
    });
  }

  Future<List> _insertmsg() async {
    print(messageInsert.text);
    await http.post(
        "$uml/my_store/insertmessage.php", body: {
      "username": username,
      "message": messageInsert.text,
    });
  }

  void response(query) async {
    AuthGoogle authGoogle = await AuthGoogle(
        fileJson: "assets/newagent-akoy-6c17e9e97bf2.json")
        .build();
    Dialogflow dialogflow =
    Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse aiResponse = await dialogflow.detectIntent(query);
    setState(() {
      messsages.insert(0, {
        "data": 0,
        "message": aiResponse.getListMessage()[0]["text"]["text"][0].toString()
      });
    });
    String ms = aiResponse.getListMessage()[0]["text"]["text"][0].toString();
    _insertai(ms);

  }

  final messageInsert = TextEditingController();
  List<Map> messsages = List();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat bot",),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      drawer : new Drawer(
        child: ListView(
          children:<Widget> [
            new UserAccountsDrawerHeader(
              accountName: new Text('$name'),
              accountEmail: new Text('aoy35085@hotmail.com'),

            ),
            new ListTile(
              title: new Text('Profile'),
              onTap: (){
                // ignore: unnecessary_statements
                Navigator.of(context).pop();
                Navigator.push(context,
                    new MaterialPageRoute(
                      builder: (BuildContext context) => new AboutPage(),
                    ));
              },
            ),
            new ListTile(
              title: new Text('emotion test.'),
              onTap: (){
                // ignore: unnecessary_statements
                Navigator.of(context).pop();
                Navigator.push(context,
                    new MaterialPageRoute(
                      builder: (BuildContext context) => new Emotiontest(),
                    ));
              },
            ),
            new ListTile(
              title: new Text('Setting'),
              onTap: (){
                // ignore: unnecessary_statements
                Navigator.of(context).pop();
                Navigator.push(context,
                    new MaterialPageRoute(
                      builder: (BuildContext context) => new SettingPage(),
                    ));
              },
            ),
            new ListTile(
              title: new Text('Security'),
              onTap: (){
                // ignore: unnecessary_statements
                Navigator.of(context).pop();
                Navigator.push(context,
                    new MaterialPageRoute(
                      builder: (BuildContext context) => new SecurityPage(),
                    ));
              },
            ),
            new ListTile(
              title: new Text('Help center'),
              onTap: (){
                // ignore: unnecessary_statements
                Navigator.of(context).pop();
                Navigator.push(context,
                    new MaterialPageRoute(
                      builder: (BuildContext context) => new HelpCenterPage(),
                    ));
              },
            ),
            new ListTile(
              title: new Text('Milestone'),
              onTap: (){
                // ignore: unnecessary_statements
                Navigator.of(context).pop();
                Navigator.push(context,
                    new MaterialPageRoute(
                      builder: (BuildContext context) => new Milestone(),
                    ));
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [0.1, 0.5, 0.8, 0.9],
              colors: [Colors.yellow[400], Colors.yellow[100], Colors.purple[100], Colors.purple]
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Text("$name : Today, ${DateFormat("Hm").format(DateTime.now())}", style: TextStyle(
                fontSize: 20, color: Colors.black,
              ),),
            ),
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    itemCount: messsages.length,
                    itemBuilder: (context, index) => chat(
                        messsages[index]["message"].toString(),
                        messsages[index]["data"]))),
            SizedBox(
              height: 20,
            ),

            Divider(
              height: 5.0,
              color: Colors.greenAccent,
            ),
            Container(
              child: ListTile(
                leading: IconButton(
                  icon: Icon(Icons.add, color: Colors.purple, size: 35,),
                ),
                title: Container(
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(
                        15)),
                    color: Color.fromRGBO(220, 220, 220, 1),
                  ),
                  padding: EdgeInsets.only(left: 15),
                  child: TextFormField(
                    controller: messageInsert,
                    decoration: InputDecoration(
                      hintText: "Enter a Message...",
                      hintStyle: TextStyle(
                          color: Colors.black26
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black
                    ),
                    onChanged: (value) {
                    },
                  ),
                ),
                trailing: IconButton(
                    icon: Icon(
                      Icons.send,
                      size: 30.0,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      if (messageInsert.text.isEmpty) {
                        print("empty message");
                      } else {
                        setState(() {
                          messsages.insert(0,
                              {"data": 1, "message": messageInsert.text});
                        });
                        _insertmsg();
                        response(messageInsert.text);
                        messageInsert.clear();
                      }
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    }),
              ),
            ),
            SizedBox(
              height: 15.0,
            )
          ],
        ),
      ),
    );
  }

  //for better one i have use the bubble package check out the pubspec.yaml

  Widget chat(String message, int data) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),

      child: Row(
        mainAxisAlignment: data == 1 ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [

          data == 0 ? Container(
            height: 60,
            width: 60,
          ) : Container(),

          Padding(
            padding: EdgeInsets.all(10.0),
            child: Bubble(
                radius: Radius.circular(15.0),
                color: data == 0 ? Color.fromRGBO(23, 157, 139, 1) : Colors.orangeAccent,
                elevation: 0.0,
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        width: 10.0,
                      ),
                      Flexible(
                          child: Container(
                            constraints: BoxConstraints( maxWidth: 200),
                            child: Text(
                              message,
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ))
                    ],
                  ),
                )),
          ),


          data == 1? Container(
            height: 60,
            width: 60,

          ) : Container(),
        ],
      ),
    );
  }

}