import 'dart:convert';
import 'package:animate_icons/animate_icons.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appchatbot/Milestoneherebright/Milestone.dart';
import 'package:flutter_appchatbot/Milestoneherebright/Milestonelite.dart';
import 'package:flutter_appchatbot/Milestoneherebright/PieChart2.dart';
import 'package:flutter_appchatbot/Pagesetting/setting.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import '../main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_appchatbot/Milestoneherebright/Graph.dart';

int counter=0;
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
  int i = 0;

  Future<List> _insertai(String ms) async {
    print(ms);
    await http.post(
        "$uml/my_store/insertAI.php", body: {
      "username": username,
      "message": ms,
    });
  }

  Future<List> _insertmsg() async {
    await http.post(
        "$uml/my_store/insertmessage.php", body: {
      "username": username,
      "message": messageInsert.text,
    });
    // if(i==1){
    //   await http.post("$uml/my_store/insertdiary.php", body: {
    //     "username": username,
    //     "message" : messageInsert.text
    //   });
    //   i=0;
    // }
  }

  Future<List> _insertdiary() async{
    if(i==1){
      await http.post("$uml/my_store/insertdiary.php", body: {
        "username": username,
        "message" : messageInsert.text
      });
      i=0;
    }
  }

  var dataus;

  // Future<List> _insertdiary(String m) async{
  //   print('insert diary');
  //   print(messageInsert.text);
  //       final res = await http.post("$uml/my_store/insertdiary.php", body: {
  //         "username": username,
  //         "diary" : messageInsert.text
  //       });
  // }

  void response(query) async {
    AuthGoogle authGoogle = await AuthGoogle(
        fileJson: "assets/newagent-akoy-6c17e9e97bf2.json")
        .build();
    Dialogflow dialogflow =
    Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse aiResponse = await dialogflow.detectIntent(query);
    String diary = aiResponse.queryResult.intent.displayName;
    print (diary);
    setState(() {
      messsages.insert(0, {
        "data": 0,
        "message": aiResponse.getListMessage()[0]["text"]["text"][0].toString(),
      });
    });
    String ms = aiResponse.getListMessage()[0]["text"]["text"][0].toString();
    if(diary=='Diarycommand'){
      i=1;
      print(i);
    }
    _insertai(ms);
  }

  final messageInsert = TextEditingController();
  List<Map> messsages = List();

  @override
  Widget build(BuildContext context){
    int _currentIndex=0;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [HexColor('#FFFFFF'), HexColor('#FFFFFF')]
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 35, bottom: 10),
              child: Text("$name ${DateFormat("Hm").format(DateTime.now())}", style: TextStyle(
                fontSize: 20, color: Colors.black,fontFamily: 'RobotoCondensed',fontWeight: FontWeight.bold,
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
              color: Colors.grey,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: ListTile(
                leading: IconButton(
                  icon: Icon(Icons.add, color: Colors.purple, size: 35,),
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (BuildContext context) => ));
                  },
                ),
                title: Container(
                  height: 40,
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
                          color: Colors.black26,fontFamily: 'RobotoCondensed',
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      fontFamily: 'RobotoCondensed',
                    ),
                    onChanged: (value) {
                    },
                  ),
                ),
                trailing: IconButton(
                    icon: Icon(
                      Icons.send,
                      size: 30.0,
                      color: Colors.deepPurple,
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
                        print(i);
                        _insertdiary();
                        response(messageInsert.text);
                        messageInsert.clear();
                      }
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                      print (messsages);
                    }),
              ),
            ),
            SizedBox(
              height: 7,
            )
          ],
        ),
      ),

    );
  }

  Widget chat(String message, int data) {
    return Container(
      padding: EdgeInsets.only(left: 0 ,right: 0),

      child: Row(
        mainAxisAlignment: data == 1 ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [

          data == 0 ? Container(
            height: 10,
            width: 10,
          ) : Container(),

          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Bubble(
                radius: Radius.circular(15.0),
                color: data == 0 ? Color.fromRGBO(23, 157, 139, 1) : Colors.orangeAccent,
                elevation: 0.0,
                child: Padding(
                  padding: EdgeInsets.only(top:2,left:0,right:10,bottom:2),
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
            height: 10,
            width: 10,
          ) : Container(),
        ],
      ),
    );
  }

}