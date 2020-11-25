import 'dart:convert';
import 'dart:io';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appchatbot/DiaryNew/CustomDialog.dart';
import 'package:flutter_appchatbot/Milestoneherebright/Pages.dart';
import 'package:flutter_appchatbot/class/Emotion.dart';
import 'package:flutter_appchatbot/class/Emotion/Happy.dart';
import 'package:flutter_appchatbot/class/Facade.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_8.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../main.dart';
import 'recipe_model.dart';
import 'recipe_view.dart';
import 'package:url_launcher/url_launcher.dart';

class Diary extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Diary> {

  final messageInsert = TextEditingController();
  final msg = TextEditingController();
  final date = TextEditingController();
  final emo = TextEditingController();
  final type = TextEditingController();
  List<Map> messsages = List();
  int _check = 0;

  Future<List> _readdiary() async {
    final response = await http.post("$uml/my_store/readdiary.php", body: {
      "username": username,

    });

    var dataus;

    dataus = json.decode(response.body);

    print(dataus);
    print(dataus[0]['milestoneID']);

    for(j=0;;j++){
      try{
        //ignore exception
        if(dataus[j]["diary"]==null)break;
      }catch (Exception){
        print(Exception);
        break;
      }
      print(j);
      print(dataus[j]["diary"]);
      print(dataus[j]["date"]);
      msg.text = dataus[j]["diary"];
      date.text = dataus[j]["date"];
      emo.text = dataus[j]["emotion"];
      type.text = dataus[j]["type"];
      setState(() {
        messsages.insert(0,
            {"data": 1, "message": msg.text, "date": date.text,"emo": emo.text,"type": type.text});
      });
    }
    _check = 1;
    return dataus;
  }

  @override
  Widget build(BuildContext context) {
    if (k == 1) {
      _readdiary();
      k = 2;
    }
    int _currentIndex = 0;

    if (_check == 0) {
      return Container(
        color: Colors.white,
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
    else {
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
                child: Text("$name ${DateFormat("Hm").format(DateTime.now())}",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                  ),),
              ),
              Flexible(
                  child: ListView.builder(
                      reverse: true,
                      itemCount: messsages.length,
                      itemBuilder: (context, index) =>
                          chat(
                            messsages[index]["message"].toString(),
                            messsages[index]["date"].toString(),
                            messsages[index]["emo"].toString(),
                            messsages[index]["type"].toString(),
                          ))),
            ],
          ),
        ),
      );
    }
  }
  Widget chat(String message,String date,String emotionxx,String type) {
    // emotion x = EnumToString.fromString(emotion.values,emotionxx);
    tone tonefromstring(String value){
      return tone.values.firstWhere((e) => e.toString().split('.')[1]==value);
    }
    emotion emotionfromstring(String value){
      return emotion.values.firstWhere((e) => e.toString().split('.')[1]==value);
    }
    Facade obj = new Facade();
    obj.find(emotionfromstring(emotionxx),tonefromstring(type));
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
                  height: 150,
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
                    flex: 1,
                  ),

                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          message,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          children: [
                            Icon(Icons.date_range_outlined,
                              color: Colors.black,),
                            SizedBox(width: 10,),
                            Text('Date',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text(date,
                          style: TextStyle(
                            color: Colors.white,
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



// Widget _buildCard(String name, String price, String imgPath, bool added,
//     bool isFavorite, context) {
//   return Padding(
//       padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
//       child: InkWell(
//           onTap: () {
//           },
//           child: Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15.0),
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.grey.withOpacity(0.2),
//                         spreadRadius: 3.0,
//                         blurRadius: 5.0)
//                   ],
//                   color: Colors.white),
//               child: Column(children: [
//                 Padding(
//                     padding: EdgeInsets.all(5.0),
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           isFavorite
//                               ? Icon(Icons.favorite, color: Color(0xFFEF7532))
//                               : Icon(Icons.favorite_border,
//                               color: Color(0xFFEF7532))
//                         ])),
//                 Hero(
//                     tag: imgPath,
//                     child: Container(
//                         height: 75.0,
//                         width: 75.0,
//                         decoration: BoxDecoration(
//                             image: DecorationImage(
//                                 image: AssetImage(imgPath),
//                                 fit: BoxFit.contain)))),
//                 SizedBox(height: 7.0),
//                 Text(price,
//                     style: TextStyle(
//                         color: Color(0xFFCC8053),
//                         fontFamily: 'Varela',
//                         fontSize: 14.0)),
//                 Text(name,
//                     style: TextStyle(
//                         color: Color(0xFF575E67),
//                         fontFamily: 'Varela',
//                         fontSize: 14.0)),
//                 Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
//                 Padding(
//                     padding: EdgeInsets.only(left: 5.0, right: 5.0),
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           if (!added) ...[
//                             Icon(Icons.shopping_basket,
//                                 color: Color(0xFFD17E50), size: 12.0),
//                             Text('Add to cart',
//                                 style: TextStyle(
//                                     fontFamily: 'Varela',
//                                     color: Color(0xFFD17E50),
//                                     fontSize: 12.0))
//                           ],
//                           if (added) ...[
//                             Icon(Icons.remove_circle_outline,
//                                 color: Color(0xFFD17E50), size: 12.0),
//                             Text('3',
//                                 style: TextStyle(
//                                     fontFamily: 'Varela',
//                                     color: Color(0xFFD17E50),
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 12.0)),
//                             Icon(Icons.add_circle_outline,
//                                 color: Color(0xFFD17E50), size: 12.0),
//                           ]
//                         ]))
//               ]))));
// }
