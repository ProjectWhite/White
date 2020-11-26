import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_appchatbot/DiaryNew/CustomDialog.dart';
import 'package:flutter_appchatbot/class/Emotion.dart';
import 'package:flutter_appchatbot/class/Facade.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import '../main.dart';

int c;
int check = 0;

class Diary extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Diary> {

  Future<List<dynamic>> _aoyler;
  @override
  void initState() {
    super.initState();
    _aoyler = _readdiary();
  }

  final messageInsert = TextEditingController();
  final msg = TextEditingController();
  final date = TextEditingController();
  final emo = TextEditingController();
  final type = TextEditingController();
  List<Map> messsages = List();

  Future<List> _readdiary() async {
    final response = await http.post("$uml/my_store/readdiary.php", body: {
      "username": username,
    });

    print('readdiary');

    var dataus;

    dataus = json.decode(response.body);

    for(c=0;;c++){
      try{
        //ignore exception
        if(dataus[c]["MILESTONE_DIARY"]==null)
          break;
      }catch (Exception){
        print(Exception);
        break;
      }
      print(dataus[c]["MILESTONE_DIARY"]);
      print(dataus[c]["MILESTONE_DIARY"]);
      msg.text = dataus[c]["MILESTONE_DIARY"];
      date.text = dataus[c]["MILESTONE_DATE"];
      emo.text = dataus[c]["MILESTONE_EMOTION"];
      type.text = dataus[c]["MILESTONE_TYPE"];
      setState(() {
        messsages.insert(0,
            {"data": 1, "message": msg.text, "date": date.text,"emo": emo.text,"type": type.text});
      });
      check=1;
    }
    return dataus;
  }

  @override
  Widget build(BuildContext context) {
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
            FutureBuilder(
                future: _aoyler,
                builder: (BuildContext context,AsyncSnapshot snap) {
                  if (check == 0) {
                    check = 2;
                    return
                      Expanded(
                        child: SpinKitFadingCube(
                            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                                .withOpacity(1.0),
                            size: 50.0, duration: Duration(seconds: 1)
                        ),
                      );
                  }
                  if (check == 2) {
                    return Expanded(
                      child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: Icon(
                                  Icons.menu_book_rounded,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                'Write diary now',
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          )),
                    );
                  }

                  return Flexible(
                      child: ListView.builder(
                          reverse: false,
                          itemCount: messsages.length,
                          itemBuilder: (context, index) =>
                              chat(
                                messsages[index]["message"].toString(),
                                messsages[index]["date"].toString(),
                                messsages[index]["emo"].toString(),
                                messsages[index]["type"].toString(),
                              )
                      ));
                }
            ),
          ],
        ),
      ),
    );

  }


  Widget chat(String message,String date,String emotionxx,String type) {
    // emotion x = EnumToString.fromString(emotion.values,emotionxx);
    String msgnew ;
    msgnew = message;
    tone tonefromstring(String value){
      return tone.values.firstWhere((e) => e.toString().split('.')[1]==value);
    }
    emotion emotionfromstring(String value){
      return emotion.values.firstWhere((e) => e.toString().split('.')[1]==value);
    }
    Facade obj = new Facade();
    obj.find(emotionfromstring(emotionxx),tonefromstring(type));
    if(message.length>=30){
      msgnew = message.substring(0,30)+'...';
    }
    // print(x);
    // var emoji = 'assets/smiling_face_with_heart_eyes.gif';
    // if(emotion == 'emotion.love'){
    //   emoji = 'assets/smiling_face_with_heart_eyes.gif';
    // }else if(emotion == 'emotion.happy'){
    //   emoji = 'assets/beaming_face_with_smiling_eyes.gif';
    // }else if(emotion == 'emotion.cry'){
    //   emoji = 'assets/crying_face.gif';
    // }else if(emotion == 'emotion.cry'){
    //   emoji = 'assets/face_with_steam_from_nose.gif';
    // }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            InkWell(
              child: Container(
                  height: 110,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: [Colors.grey,Colors.grey],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300],
                          blurRadius: 12,
                          offset: Offset(0,6),
                        )
                      ]
                  )
              ),
              onTap: (){
                showDialog(context: context,builder: (context) => CustomDialog(
                  title: emotionxx,
                  // ignore: missing_return
                  description: message,
                  date: date,
                  type: type,
                  emotions: emotionxx,
                ),
                );

              },
            ),
            Positioned.fill(
              child:  Row(
                children: <Widget>[
                  Expanded(
                    child: new IconButton(
                      icon: new Icon(Icons.circle),
                      color: HexColor(obj.find(emotionfromstring(emotionxx),tonefromstring(type))),
                      onPressed: () {
                      },
                    ),

                    // child: IconButton(
                    //   icon: Image.asset(emoji),
                    //   iconSize: 20,
                    // ),
                    flex: 2,
                  ),
                  SizedBox(height: 50,),
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          msgnew,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'RobotoCondensed',
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 50,),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          children: [
                            Icon(Icons.date_range_outlined,
                              color: Colors.black,),
                            SizedBox(width: 7,),
                            Text('Date',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'RobotoCondensed',
                                fontWeight: FontWeight.w500,
                              ),),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text(date,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'RobotoCondensed',
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}