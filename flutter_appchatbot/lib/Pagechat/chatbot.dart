import 'dart:async';
import 'dart:convert';
import 'package:flutter_appchatbot/Milestoneherebright/bartest.dart';
import 'package:animate_icons/animate_icons.dart';
import 'package:bubble/bubble.dart';
import 'package:emojis/emojis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appchatbot/Milestoneherebright/Milestone.dart';
import 'package:flutter_appchatbot/Milestoneherebright/Milestonelite.dart';
import 'package:flutter_appchatbot/Milestoneherebright/Pages.dart';
import 'package:flutter_appchatbot/Milestoneherebright/PieChart2.dart';
import 'package:flutter_appchatbot/Pagesetting/setting.dart';
import 'package:flutter_appchatbot/class/Emotion.dart';
import 'package:flutter_appchatbot/class/Emotion/Disgust.dart';
import 'package:flutter_appchatbot/class/Facade.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_10.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_5.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_6.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_7.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_8.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_9.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import '../main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_appchatbot/Milestoneherebright/Graph.dart';
import 'package:flutter_appchatbot/Pages/testm.dart';
import 'dart:math' as math;
import 'package:flutter_spinkit/flutter_spinkit.dart';


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
  int j = 0;
  var dataus2;

  Future<List> _readcountdiary() async{
    print('count diary');
    final response = await http.post("$uml/my_store/countdiary.php", body: {
      "username": username,
    });
    dataus2 = json.decode(response.body);

    print(dataus2);
    print(dataus2[0]['emotion']);
    print(dataus2[0]['count(emotion)']);

    return dataus2;
  }


  Future<List> _insertai(String ms) async {
    print(ms);
    await http.post(
        "$uml/my_store/insertAI.php", body: {
      "username": username,
      "message": ms,
    });
  }

  Future<List> _insertmsg(query) async {
    try {
      await http.post(
          "$uml/my_store/insertmessage.php", body: {
        "username": username,
        "message": query,
      });
      // if(i==1){
      //   await http.post("$uml/my_store/insertdiary.php", body: {
      //     "username": username,
      //     "message" : messageInsert.text
      //   });
      //   i=0;
      // }
    }catch(e)
    {
      print (e);
    }
  }

  Future<List> _readdiary() async {
    final response = await http.post("$uml/my_store/readdiary.php", body: {
      "username": username,

    });

    dataus = json.decode(response.body);

    print(dataus);
    print(dataus[0]['milestoneID']);

    return dataus;
  }


  int checkmsg=0;
  
  Future<List> _readmsg() async{
    final response = await http.post("$uml/my_store/readchat.php", body: {
      "username": username,
    });
    var datauser = json.decode(response.body);
    print(datauser);

    for(j=0;;j++){
      try{
        //ignore exception
        if(datauser[j]["text"]==null)break;
      }catch (Exception){
        print(Exception);
        break;
      }
      print(j);
      print(datauser[j]["text"]);
      msg.text = datauser[j]["text"];
      if(j%2==0){
        setState(() {
          messsages.insert(0,
              {"data": 1, "message": msg.text});});
        checkmsg=1;
      }
      if(j%2==1){
        setState(() {
          messsages.insert(0,
              {"data": 0, "message": msg.text});});
        checkmsg=1;
      }
    }


  }


  Future<List> _insertdiary(msg) async{
    msg = msg.toString().replaceAll("\'", "\\\'");
    Facade obj = new Facade();
    // Disgust s = new Disgust(tone.bitter);
    // s.test();
    String Xemotion = "fine";
    String Xtype = "fine";
    if(i==1){
      await http.post("$uml/my_store/insertdiary.php", body: {
        "username": username,
        "message" : msg,
      });
      showModalBottomSheet(
        context: context,
          builder: (index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    icon: Image.asset('assets/beaming_face_with_smiling_eyes.gif'),
                    iconSize: 40,
                    tooltip: 'Happy',
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                          context: context,
                          builder: (index){
                            return Wrap(
                              children: [
                                Dismissible(
                                  key: Key("0"),
                                  child: Ink(
                                    color: HexColor(obj.start(4,tone.confident)),
                                    child: ListTile(
                                        title: Text("Confident",
                                        style: TextStyle(fontFamily: 'Rubik',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                        )
                                    ),
                                  ),
                                  onDismissed: (direction){
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    setState(() {
                                      obj.start(4,tone.confident);
                                      Xemotion = obj.theEmotion;
                                      Xtype = obj.theType;
                                      _insertemo(msg, Xemotion,Xtype);
                                    });

                                  },
                                ),
                                Dismissible(
                                  key: Key("1"),
                                  child: Ink(
                                    color: HexColor(obj.start(4,tone.grateful)),
                                    child: ListTile(
                                        title: Text("Grateful",
                                          style: TextStyle(fontFamily: 'Rubik',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                    ),
                                  ),
                                  onDismissed: (direction){
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    setState(() {
                                      obj.start(4,tone.grateful);
                                      Xemotion = obj.theEmotion;
                                      Xtype = obj.theType;
                                      _insertemo(msg, Xemotion,Xtype);
                                    });

                                  },
                                ),
                                Dismissible(
                                  key: Key("2"),
                                  child: Ink(
                                    color: HexColor(obj.start(4,tone.peaceful)),
                                    child: ListTile(
                                        title: Text("Peaceful",
                                          style: TextStyle(fontFamily: 'Rubik',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        )
                                    ),
                                  ),
                                  onDismissed: (direction){
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    setState(() {
                                      obj.start(4,tone.peaceful);
                                      Xemotion = obj.theEmotion;
                                      Xtype = obj.theType;
                                      _insertemo(msg, Xemotion,Xtype);
                                    });

                                  },
                                ),
                                Dismissible(
                                  key: Key("3"),
                                  child: Ink(
                                    color: HexColor(obj.start(4,tone.excited)),
                                    child: ListTile(
                                        title: Text("Excited",
                                          style: TextStyle(fontFamily: 'Rubik',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        )
                                    ),
                                  ),
                                  onDismissed: (direction){
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    setState(() {
                                      obj.start(4,tone.excited);
                                      Xemotion = obj.theEmotion;
                                      Xtype = obj.theType;
                                      _insertemo(msg, Xemotion,Xtype);
                                    });

                                  },
                                ),
                                Dismissible(
                                  key: Key("4"),
                                  child: Ink(
                                    color: HexColor(obj.start(4,tone.playful)),
                                    child: ListTile(
                                        title: Text("Playful",
                                          style: TextStyle(fontFamily: 'Rubik',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        )
                                    ),
                                  ),
                                  onDismissed: (direction){
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    setState(() {
                                      obj.start(4,tone.playful);
                                      Xemotion = obj.theEmotion;
                                      Xtype = obj.theType;
                                      _insertemo(msg, Xemotion,Xtype);
                                    });

                                  },
                                ),
                                Dismissible(
                                  key: Key("5"),
                                  child: Ink(
                                    color: HexColor(obj.start(4,tone.relief)),
                                    child: ListTile(
                                        title: Text("Relief",
                                          style: TextStyle(fontFamily: 'Rubik',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        )
                                    ),
                                  ),
                                  onDismissed: (direction){
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    setState(() {
                                      obj.start(4,tone.relief);
                                      Xemotion = obj.theEmotion;
                                      Xtype = obj.theType;
                                      _insertemo(msg, Xemotion,Xtype);
                                    });

                                  },
                                ),
                                Dismissible(
                                  key: Key("6"),
                                  child: Ink(
                                    color: HexColor(obj.start(4,tone.pride)),
                                    child: ListTile(
                                        title: Text("Pride",
                                          style: TextStyle(fontFamily: 'Rubik',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        )
                                    ),
                                  ),
                                  onDismissed: (direction){
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    setState(() {
                                      obj.start(4,tone.pride);
                                      Xemotion = obj.theEmotion;
                                      Xtype = obj.theType;
                                      _insertemo(msg, Xemotion,Xtype);
                                    });

                                  },
                                ),
                                Dismissible(
                                  key: Key("7"),
                                  child: Ink(
                                    color: HexColor(obj.start(4,tone.satisfaction)),
                                    child: ListTile(
                                        title: Text("Satisfaction",
                                          style: TextStyle(fontFamily: 'Rubik',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        )
                                    ),
                                  ),
                                  onDismissed: (direction){
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    setState(() {
                                      obj.start(4,tone.satisfaction);
                                      Xemotion = obj.theEmotion;
                                      Xtype = obj.theType;
                                      _insertemo(msg, Xemotion,Xtype);
                                    });

                                  },
                                ),
                                Dismissible(
                                  key: Key("8"),
                                  child: Ink(
                                    color: HexColor(obj.start(4,tone.triumph)),
                                    child: ListTile(
                                        title: Text("Triumph",
                                          style: TextStyle(fontFamily: 'Rubik',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        )
                                    ),
                                  ),
                                  onDismissed: (direction){
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    setState(() {
                                      obj.start(4,tone.triumph);
                                      Xemotion = obj.theEmotion;
                                      Xtype = obj.theType;
                                      _insertemo(msg, Xemotion,Xtype);
                                    });

                                  },
                                ),
                              ],
                            );
                          }
                      );
                    }),

                IconButton(
                    icon: Image.asset('assets/crying_face.gif'),
                    iconSize: 40,
                    tooltip: 'Sad',
                    onPressed: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (index){
                            return Wrap(
                              children: [
                                Dismissible(
                                  key: Key("0"),
                                  child: Ink(
                                    color: HexColor(obj.start(6,tone.inadequate)),
                                    child: ListTile(
                                        title: Text("Inadequate",
                                          style: TextStyle(fontFamily: 'Rubik',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        )
                                    ),
                                  ),
                                  onDismissed: (direction){
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    setState(() {
                                      obj.start(6,tone.inadequate);
                                      Xemotion = obj.theEmotion;
                                      Xtype = obj.theType;
                                      _insertemo(msg, Xemotion,Xtype);
                                    });

                                  },
                                ),
                                Dismissible(
                                  key: Key("1"),
                                  child: Ink(
                                    color: HexColor(obj.start(6,tone.uninterested)),
                                    child: ListTile(
                                        title: Text("Uninterested",
                                          style: TextStyle(fontFamily: 'Rubik',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        )
                                    ),
                                  ),
                                  onDismissed: (direction){
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    setState(() {
                                      obj.start(6,tone.uninterested);
                                      Xemotion = obj.theEmotion;
                                      Xtype = obj.theType;
                                      _insertemo(msg, Xemotion,Xtype);
                                    });

                                  },
                                ),
                                Dismissible(
                                  key: Key("2"),
                                  child: Ink(
                                    color: HexColor(obj.start(6,tone.lonely)),
                                    child: ListTile(
                                        title: Text("Lonely",
                                          style: TextStyle(fontFamily: 'Rubik',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        )
                                    ),
                                  ),
                                  onDismissed: (direction){
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    setState(() {
                                      obj.start(6,tone.lonely);
                                      Xemotion = obj.theEmotion;
                                      Xtype = obj.theType;
                                      _insertemo(msg, Xemotion,Xtype);
                                    });

                                  },
                                ),
                                Dismissible(
                                  key: Key("3"),
                                  child: Ink(
                                    color: HexColor(obj.start(6,tone.guilty)),
                                    child: ListTile(
                                        title: Text("Guilty",
                                          style: TextStyle(fontFamily: 'Rubik',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        )
                                    ),
                                  ),
                                  onDismissed: (direction){
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    setState(() {
                                      obj.start(6,tone.guilty);
                                      Xemotion = obj.theEmotion;
                                      Xtype = obj.theType;
                                      _insertemo(msg, Xemotion,Xtype);
                                    });

                                  },
                                ),
                                Dismissible(
                                  key: Key("4"),
                                  child: Ink(
                                    color: HexColor(obj.start(6,tone.hurt)),
                                    child: ListTile(
                                        title: Text("Hurt",
                                          style: TextStyle(fontFamily: 'Rubik',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        )
                                    ),
                                  ),
                                  onDismissed: (direction){
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    setState(() {
                                      obj.start(6,tone.hurt);
                                      Xemotion = obj.theEmotion;
                                      Xtype = obj.theType;
                                      _insertemo(msg, Xemotion,Xtype);
                                    });

                                  },
                                ),
                              ],
                            );
                          }
                      );
                    }),
                IconButton(
                    icon: Image.asset('assets/hushed_face.gif'),
                    iconSize: 40,
                    tooltip: 'Surprise',
                    onPressed: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (index){
                            return Wrap(
                children: [
                  Dismissible(
                    key: Key("0"),
                    child: Ink(
                      color: HexColor(obj.start(7,tone.startled)),
                      child: ListTile(
                          title: Text("Startled",
                            style: TextStyle(fontFamily: 'Rubik',
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          )
                      ),
                    ),
                    onDismissed: (direction) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      setState(() {
                        obj.start(7, tone.startled);
                        Xemotion = obj.theEmotion;
                        Xtype = obj.theType;
                        _insertemo(msg, Xemotion, Xtype);
                      });
                    },
                  ),
                  Dismissible(
                    key: Key("1"),
                    child: Ink(
                      color: HexColor(obj.start(7,tone.overwhelmed)),
                      child: ListTile(
                          title: Text("Overwhelmed",
                            style: TextStyle(fontFamily: 'Rubik',
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          )
                      ),
                    ),
                    onDismissed: (direction) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      setState(() {
                        obj.start(7, tone.overwhelmed);
                        Xemotion = obj.theEmotion;
                        Xtype = obj.theType;
                        _insertemo(msg, Xemotion, Xtype);
                      });
                    },
                  ),
                  Dismissible(
                    key: Key("2"),
                    child: Ink(
                      color: HexColor(obj.start(7,tone.confused)),
                      child: ListTile(
                          title: Text("Confused",
                            style: TextStyle(fontFamily: 'Rubik',
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          )
                      ),
                    ),
                    onDismissed: (direction) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      setState(() {
                        obj.start(7, tone.confused);
                        Xemotion = obj.theEmotion;
                        Xtype = obj.theType;
                        _insertemo(msg, Xemotion, Xtype);
                      });
                    },
                  ),
                  Dismissible(
                    key: Key("3"),
                    child: Ink(
                      color: HexColor(obj.start(7,tone.amazed)),
                      child: ListTile(
                          title: Text("Amazed",
                            style: TextStyle(fontFamily: 'Rubik',
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          )
                      ),
                    ),
                    onDismissed: (direction) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      setState(() {
                        obj.start(7, tone.amazed);
                        Xemotion = obj.theEmotion;
                        Xtype = obj.theType;
                        _insertemo(msg, Xemotion, Xtype);
                      });
                    },
                  ),
                  Dismissible(
                    key: Key("4"),
                    child: Ink(
                      color: HexColor(obj.start(7,tone.shocked)),
                      child: ListTile(
                          title: Text("Shocked",
                            style: TextStyle(fontFamily: 'Rubik',
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          )
                      ),
                    ),
                    onDismissed: (direction) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      setState(() {
                        obj.start(7, tone.shocked);
                        Xemotion = obj.theEmotion;
                        Xtype = obj.theType;
                        _insertemo(msg, Xemotion, Xtype);
                      });
                    },
                  ),
                ],
              );
                          }
                      );
                    }),
                IconButton(
                    icon: Image.asset('assets/smiling_face_with_heart_eyes.gif'),
                    iconSize: 40,
                    tooltip: 'Love',
                    onPressed: (){
                        showModalBottomSheet(
                            context: context,
                            builder: (index){
                            return Wrap(
                        children: [
                          Dismissible(
                            key: Key("0"),
                            child: Ink(
                              color: HexColor(obj.start(5,tone.accepted)),
                              child: ListTile(
                                  title: Text("Accepted",
                                    style: TextStyle(fontFamily: 'Rubik',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  )
                              ),
                            ),
                            onDismissed: (direction){
                              Navigator.pop(context);
                              Navigator.pop(context);
                              setState(() {
                                obj.start(5,tone.accepted);
                                Xemotion = obj.theEmotion;
                                Xtype = obj.theType;
                                _insertemo(msg, Xemotion,Xtype);
                              });

                            },
                          ),
                          Dismissible(
                            key: Key("1"),
                            child: Ink(
                              color: HexColor(obj.start(5,tone.gentle)),
                              child: ListTile(
                                  title: Text("Gentle",
                                    style: TextStyle(fontFamily: 'Rubik',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  )
                              ),
                            ),
                            onDismissed: (direction){
                              Navigator.pop(context);
                              Navigator.pop(context);
                              setState(() {
                                obj.start(5,tone.gentle);
                                Xemotion = obj.theEmotion;
                                Xtype = obj.theType;
                                _insertemo(msg, Xemotion,Xtype);
                              });

                            },
                          ),
                          Dismissible(
                            key: Key("2"),
                            child: Ink(
                              color: HexColor(obj.start(5,tone.affectionate)),
                              child: ListTile(
                                  title: Text("Affectionate",
                                    style: TextStyle(fontFamily: 'Rubik',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  )
                              ),
                            ),
                            onDismissed: (direction){
                              Navigator.pop(context);
                              Navigator.pop(context);
                              setState(() {
                                obj.start(5,tone.affectionate);
                                Xemotion = obj.theEmotion;
                                Xtype = obj.theType;
                                _insertemo(msg, Xemotion,Xtype);
                              });

                            },
                          ),
                          Dismissible(
                            key: Key("3"),
                            child: Ink(
                              color: HexColor(obj.start(5,tone.passionate)),
                              child: ListTile(
                                  title: Text("Passionate",
                                    style: TextStyle(fontFamily: 'Rubik',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  )
                              ),
                            ),
                            onDismissed: (direction){
                              Navigator.pop(context);
                              Navigator.pop(context);
                              setState(() {
                                obj.start(5,tone.passionate);
                                Xemotion = obj.theEmotion;
                                Xtype = obj.theType;
                                _insertemo(msg, Xemotion,Xtype);
                              });

                            },
                          ),
                          Dismissible(
                            key: Key("4"),
                            child: Ink(
                              color: HexColor(obj.start(5,tone.trusted)),
                              child: ListTile(
                                  title: Text("Trusted",
                                    style: TextStyle(fontFamily: 'Rubik',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  )
                              ),
                            ),
                            onDismissed: (direction){
                              Navigator.pop(context);
                              Navigator.pop(context);
                              setState(() {
                                obj.start(5,tone.trusted);
                                Xemotion = obj.theEmotion;
                                Xtype = obj.theType;
                                _insertemo(msg, Xemotion,Xtype);
                              });

                            },
                          ),
                          Dismissible(
                            key: Key("5"),
                            child: Ink(
                              color: HexColor(obj.start(5,tone.contentment)),
                              child: ListTile(
                                  title: Text("Contentment",
                                    style: TextStyle(fontFamily: 'Rubik',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  )
                              ),
                            ),
                            onDismissed: (direction){
                              Navigator.pop(context);
                              Navigator.pop(context);
                              setState(() {
                                obj.start(5,tone.contentment);
                                Xemotion = obj.theEmotion;
                                Xtype = obj.theType;
                                _insertemo(msg, Xemotion,Xtype);
                              });

                            },
                          ),
                        ],
                      );
                          }
                      );
                    }),
                IconButton(
                    icon: Image.asset('assets/face_with_steam_from_nose.gif'),
                    iconSize: 40,
                    tooltip: 'Anger',
                    onPressed: (){
                      showModalBottomSheet(
                            context: context,
                            builder: (index){
                      return Wrap(
                        children: [
                          Dismissible(
                            key: Key("0"),
                            child: Ink(
                              color: HexColor(obj.start(1,tone.annoyed)),
                              child: ListTile(
                                  title: Text("Annoyed",
                                    style: TextStyle(fontFamily: 'Rubik',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  )
                              ),
                            ),
                            onDismissed: (direction){
                              Navigator.pop(context);
                              Navigator.pop(context);
                              setState(() {
                                obj.start(1,tone.annoyed);
                                Xemotion = obj.theEmotion;
                                Xtype = obj.theType;
                                _insertemo(msg, Xemotion,Xtype);
                              });

                            },
                          ),
                          Dismissible(
                            key: Key("1"),
                            child: Ink(
                              color: HexColor(obj.start(1,tone.frustrated)),
                              child: ListTile(
                                  title: Text("Frustrated",
                                    style: TextStyle(fontFamily: 'Rubik',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  )
                              ),
                            ),
                            onDismissed: (direction){
                              Navigator.pop(context);
                              Navigator.pop(context);
                              setState(() {
                                obj.start(1,tone.frustrated);
                                Xemotion = obj.theEmotion;
                                Xtype = obj.theType;
                                _insertemo(msg, Xemotion,Xtype);
                              });

                            },
                          ),
                          Dismissible(
                            key: Key("2"),
                            child: Ink(
                              color: HexColor(obj.start(1,tone.offended)),
                              child: ListTile(
                                  title: Text("Offended",
                                    style: TextStyle(fontFamily: 'Rubik',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  )
                              ),
                            ),
                            onDismissed: (direction){
                              Navigator.pop(context);
                              Navigator.pop(context);
                              setState(() {
                                obj.start(1,tone.offended);
                                Xemotion = obj.theEmotion;
                                Xtype = obj.theType;
                                _insertemo(msg, Xemotion,Xtype);
                              });

                            },
                          ),
                          Dismissible(
                            key: Key("3"),
                            child: Ink(
                              color: HexColor(obj.start(1,tone.mad)),
                              child: ListTile(
                                  title: Text("Mad",
                                    style: TextStyle(fontFamily: 'Rubik',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  )
                              ),
                            ),
                            onDismissed: (direction){
                              Navigator.pop(context);
                              Navigator.pop(context);
                              setState(() {
                                obj.start(1,tone.mad);
                                Xemotion = obj.theEmotion;
                                Xtype = obj.theType;
                                _insertemo(msg, Xemotion,Xtype);
                              });

                            },
                          ),
                          Dismissible(
                            key: Key("4"),
                            child: Ink(
                              color: HexColor(obj.start(1,tone.threatened)),
                              child: ListTile(
                                  title: Text("Threatened",
                                    style: TextStyle(fontFamily: 'Rubik',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  )
                              ),
                            ),
                            onDismissed: (direction){
                              Navigator.pop(context);
                              Navigator.pop(context);
                              setState(() {
                                obj.start(1,tone.threatened);
                                Xemotion = obj.theEmotion;
                                Xtype = obj.theType;
                                _insertemo(msg,Xemotion,Xtype);
                              });

                            },
                          ),
                        ],
                      );
                          }
                          );
                    }),
                IconButton(
                    icon: Image.asset('assets/face_vomiting.gif'),
                    iconSize: 40,
                    tooltip: 'Disgust',
                    onPressed: (){
                      showModalBottomSheet(
                            context: context,
                            builder: (index){
                      return Wrap(
                        children: [
                          Dismissible(
                            key: Key("0"),
                            child: Ink(
                              color: HexColor(obj.start(2,tone.resentful)),
                              child: ListTile(
                                  title: Text("Resentful",
                                    style: TextStyle(fontFamily: 'Rubik',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  )
                              ),
                            ),
                            onDismissed: (direction){
                              Navigator.pop(context);
                              Navigator.pop(context);
                              setState(() {
                                obj.start(2,tone.resentful);
                                Xemotion = obj.theEmotion;
                                Xtype = obj.theType;
                                _insertemo(msg, Xemotion,Xtype);
                              });

                            },
                          ),
                          Dismissible(
                            key: Key("1"),
                            child: Ink(
                              color: HexColor(obj.start(2,tone.shameful)),
                              child: ListTile(
                                  title: Text("Shameful",
                                    style: TextStyle(fontFamily: 'Rubik',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  )
                              ),
                            ),
                            onDismissed: (direction){
                              Navigator.pop(context);
                              Navigator.pop(context);
                              setState(() {
                                obj.start(2,tone.shameful);
                                Xemotion = obj.theEmotion;
                                Xtype = obj.theType;
                                _insertemo(msg, Xemotion,Xtype);
                              });

                            },
                          ),
                          Dismissible(
                            key: Key("2"),
                            child: Ink(
                              color: HexColor(obj.start(2,tone.bitter)),
                              child: ListTile(
                                  title: Text("Bitter",
                                    style: TextStyle(fontFamily: 'Rubik',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  )
                              ),
                            ),
                            onDismissed: (direction){
                              Navigator.pop(context);
                              Navigator.pop(context);
                              setState(() {
                                obj.start(2,tone.bitter);
                                Xemotion = obj.theEmotion;
                                Xtype = obj.theType;
                                _insertemo(msg, Xemotion,Xtype);
                              });

                            },
                          ),
                          Dismissible(
                            key: Key("3"),
                            child: Ink(
                              color: HexColor(obj.start(2,tone.disappointed)),
                              child: ListTile(
                                  title: Text("Disappointed",
                                    style: TextStyle(fontFamily: 'Rubik',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  )
                              ),
                            ),
                            onDismissed: (direction){
                              Navigator.pop(context);
                              Navigator.pop(context);
                              setState(() {
                                obj.start(2,tone.disappointed);
                                Xemotion = obj.theEmotion;
                                Xtype = obj.theType;
                                _insertemo(msg, Xemotion,Xtype);
                              });

                            },
                          ),
                          Dismissible(
                            key: Key("4"),
                            child: Ink(
                              color: HexColor(obj.start(2,tone.averse)),
                              child: ListTile(
                                  title: Text("Averse",
                                    style: TextStyle(fontFamily: 'Rubik',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  )
                              ),
                            ),
                            onDismissed: (direction){
                              Navigator.pop(context);
                              Navigator.pop(context);
                              setState(() {
                                obj.start(2,tone.averse);
                                Xemotion = obj.theEmotion;
                                Xtype = obj.theType;
                                _insertemo(msg, Xemotion,Xtype);
                              });

                            },
                          ),
                          Dismissible(
                            key: Key("5"),
                            child: Ink(
                              color: HexColor(obj.start(2,tone.contempt)),
                              child: ListTile(
                                  title: Text("Contempt",
                                    style: TextStyle(fontFamily: 'Rubik',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  )
                              ),
                            ),
                            onDismissed: (direction){
                              Navigator.pop(context);
                              Navigator.pop(context);
                              setState(() {
                                obj.start(2,tone.contempt);
                                Xemotion = obj.theEmotion;
                                Xtype = obj.theType;
                                _insertemo(msg, Xemotion,Xtype);
                              });

                            },
                          ),
                        ],
                      );
                            }
                        );
                    }),
                IconButton(
                    icon: Image.asset('assets/face_screaming_in_fear.gif'),
                    iconSize: 40,
                    tooltip: 'Fear',
                    onPressed: (){
                        showModalBottomSheet(
                            context: context,
                            builder: (index){
                      return Wrap(
                        children: [
                          Dismissible(
                            key: Key("0"),
                            child: Ink(
                              color: HexColor(obj.start(3,tone.embarrassed)),
                              child: ListTile(
                                  title: Text("Embarrassed",
                                    style: TextStyle(fontFamily: 'Rubik',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  )
                              ),
                            ),
                            onDismissed: (direction){
                              Navigator.pop(context);
                              Navigator.pop(context);
                              setState(() {
                                obj.start(3,tone.embarrassed);
                                Xemotion = obj.theEmotion;
                                Xtype = obj.theType;
                                _insertemo(msg, Xemotion,Xtype);
                              });

                            },
                          ),
                          Dismissible(
                            key: Key("1"),
                            child: Ink(
                              color: HexColor(obj.start(3,tone.vulnerable)),
                              child: ListTile(
                                  title: Text("Vulnerable",
                                    style: TextStyle(fontFamily: 'Rubik',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  )
                              ),
                            ),
                            onDismissed: (direction){
                              Navigator.pop(context);
                              Navigator.pop(context);
                              setState(() {
                                obj.start(3,tone.vulnerable);
                                Xemotion = obj.theEmotion;
                                Xtype = obj.theType;
                                _insertemo(msg, Xemotion,Xtype);
                              });

                            },
                          ),
                          Dismissible(
                            key: Key("2"),
                            child: Ink(
                              color: HexColor(obj.start(3,tone.rejected)),
                              child: ListTile(
                                  title: Text("Rejected",
                                    style: TextStyle(fontFamily: 'Rubik',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  )
                              ),
                            ),
                            onDismissed: (direction){
                              Navigator.pop(context);
                              Navigator.pop(context);
                              setState(() {
                                obj.start(3,tone.rejected);
                                Xemotion = obj.theEmotion;
                                Xtype = obj.theType;
                                _insertemo(msg, Xemotion,Xtype);
                              });

                            },
                          ),
                          Dismissible(
                            key: Key("3"),
                            child: Ink(
                              color: HexColor(obj.start(3,tone.insecure)),
                              child: ListTile(
                                  title: Text("Insecure",
                                    style: TextStyle(fontFamily: 'Rubik',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  )
                              ),
                            ),
                            onDismissed: (direction){
                              Navigator.pop(context);
                              Navigator.pop(context);
                              setState(() {
                                obj.start(3,tone.insecure);
                                Xemotion = obj.theEmotion;
                                Xtype = obj.theType;
                                _insertemo(msg, Xemotion,Xtype);
                              });

                            },
                          ),
                          Dismissible(
                            key: Key("4"),
                            child: Ink(
                              color: HexColor(obj.start(3,tone.worried)),
                              child: ListTile(
                                  title: Text("Worried",
                                    style: TextStyle(fontFamily: 'Rubik',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  )
                              ),
                            ),
                            onDismissed: (direction){
                              Navigator.pop(context);
                              Navigator.pop(context);
                              setState(() {
                                obj.start(3,tone.worried);
                                Xemotion = obj.theEmotion;
                                Xtype = obj.theType;
                                _insertemo(msg, Xemotion,Xtype);
                              });

                            },
                          ),
                        ],
                      );
                            }
                            );
                    }),

              ],
            );
          });
    }


    i=0;

    }
  var dataus;

  Future<List> _insertemo(msg,Xemotion,Xtype) async {
      var url = await "$uml/my_store/updateemo.php";
      http.post(url, body: {
      "username": username,
      "emotion": Xemotion,
      "diary": msg,
      "type": Xtype
  });
  }
  // Future<List> _insertdiary(String m) async{
  //   print('insert diary');
  //   print(messageInsert.text);
  //       final res = await http.post("$uml/my_store/insertdiary.php", body: {
  //         "username": username,
  //         "diary" : messageInsert.text
  //       });
  // }

  void response(query) async {
    try {
      query = query.toString().replaceAll("\'", "\\\'");
      _insertmsg(query);
      // String a = "'";
      // print (x.replaceAll('\'', "\\\'") + "here");
      AuthGoogle authGoogle = await AuthGoogle(
          fileJson: "assets/newagent-akoy-6c17e9e97bf2.json")
          .build();
      Dialogflow dialogflow =
      Dialogflow(authGoogle: authGoogle, language: Language.english);
      AIResponse aiResponse = await dialogflow.detectIntent(query);
      String diary = aiResponse.queryResult.intent.displayName;
      print(diary);
      setState(() {
        messsages.insert(0, {
          "data": 0,
          "message": aiResponse.getListMessage()[0]["text"]["text"][0]
              .toString(),
        });
      });
      String ms = aiResponse.getListMessage()[0]["text"]["text"][0]
          .toString()
          .replaceAll("\'", "\\\'");
      if (diary == 'Diarycommand') {
        i = 1;
        print(i);
        Facade fuck = new Facade();
        fuck.start(1, tone.mad);
      }
      _insertai(ms);
    } catch (except){
      print(except);
    }
  }
  String _timeString;

  Future<List<dynamic>> _future;
  @override
  void initState(){
    _timeString = "${DateTime.now().hour.toString().padLeft(2, '0')} : ${DateTime.now().minute.toString().padLeft(2, '0')}";
    Timer.periodic(Duration(seconds:1), (Timer t)=>_getCurrentTime());
    super.initState();
    _future = _readmsg();
  }

  void _getCurrentTime()  {
    setState(() {
      _timeString = "${DateTime.now().hour.toString().padLeft(2, '0')} : ${DateTime.now().minute.toString().padLeft(2, '0')}";
    });
  }

  final messageInsert = TextEditingController();
  final msg = TextEditingController();
  List<Map> messsages = List();

  @override
  Widget build(BuildContext context){
    if(k==1){
      _readcountdiary();
      k=2;
    }
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
              child: Text("$name $_timeString", style: TextStyle(
                fontSize: 20, color: Colors.black,fontFamily: 'RobotoCondensed',fontWeight: FontWeight.bold,
              ),),
            ),
            FutureBuilder(
            future: _future, // the function to get your data from firebase or firestore
            builder : (BuildContext context, AsyncSnapshot snap){
              if(checkmsg==0){
               return Expanded(
                 child: SpinKitFadingCube(color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                      size: 50.0,duration: Duration(seconds: 1)),
               );
              }
           return Flexible(
                child: ListView.builder(

                    reverse: true,
                    itemCount: messsages.length,
                    itemBuilder: (context, index) => chat(
                        messsages[index]["message"].toString(),
                        messsages[index]["data"]))
           );

}
            ),
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
                    _readmsg();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => LineChartSample1()));
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
                        print(i);
                        response(messageInsert.text);
                        _insertdiary(messageInsert.text);
                        messageInsert.clear();
                      }
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                      // print (messsages);
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

          // data == 0 ? Container(
          //   height: 10,
          //   width: 10,
          // ) : Container(),

          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child:
            data == 1 ?
            ChatBubble(
                clipper: ChatBubbleClipper5(type: BubbleType.sendBubble),
                alignment: Alignment.topRight,
                margin: EdgeInsets.only(top: 8,right: 20),
                backGroundColor: Colors.blue,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  child: Text(
                    message,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
            )
                : ChatBubble(
                  clipper: ChatBubbleClipper5(type: BubbleType.receiverBubble),
                  backGroundColor: Color(0xffE7E7ED),
                  margin: EdgeInsets.only(top: 8,left: 20),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    child: Text(
                      message,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )
          ),
          // data == 1? Container(
          //   height: 10,
          //   width: 10,
          // ) : Container(),
        ],
      ),
    );
  }

}

// color: data == 0 ? Color.fromRGBO(23, 157, 139, 1) : Colors.blue,
// elevation: 0.0,
// child: Padding(
//   padding: EdgeInsets.only(top:2,left:0,right:10,bottom:2),
//   child: Row(
//     mainAxisSize: MainAxisSize.min,
//     children: <Widget>[
//       SizedBox(
//         width: 10.0,
//       ),
//       Flexible(
//           child: Container(
//             constraints: BoxConstraints(
//               maxWidth: MediaQuery.of(context).size.width * 0.7,
//             ),
//             child: Text(ป
//               message,
//               style: TextStyle(
//                   color: Colors.white, fontWeight: FontWeight.bold),
//             ),
//           ))
//     ],
//   ),
// )