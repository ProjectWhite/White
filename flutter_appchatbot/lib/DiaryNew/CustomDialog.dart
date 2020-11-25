import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_appchatbot/DiaryNew/PageDiary.dart';
import 'package:flutter_appchatbot/Pages/testm.dart';
import 'package:flutter_appchatbot/class/Emotion.dart';
import 'package:flutter_appchatbot/class/Facade.dart';
import 'package:flutter_appchatbot/login/constants.dart';
import 'package:http/http.dart' as http;

import '../main.dart';


int l=0;

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText, date,emotions,type;


  CustomDialog({this.title, this.description, this.buttonText, this.date,this.emotions,this.type});



  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context){
    tone tonefromstring(String value){
      return tone.values.firstWhere((e) => e.toString().split('.')[1]==value);
    }
    emotion emotionfromstring(String value){
      return emotion.values.firstWhere((e) => e.toString().split('.')[1]==value);
    }
    Facade obj = new Facade();
    obj.find(emotionfromstring(emotions),tonefromstring(type));
    return Stack(
      children: [
        Container(
          padding:  EdgeInsets.only(top: 80, bottom: 16, right: 16, left: 16),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(17),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0.0, 10.0),
              )
            ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title.toUpperCase(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 4),
              Text(date, style: TextStyle(fontSize: 16),),
              SizedBox(height: 20,),
              Text(description, style: TextStyle(fontSize: 16),),
              SizedBox(height: 24,),
             Row(
               children: [
                 Align(
                   child: FlatButton(
                     child: Text(
                       'Delete',
                       textAlign: TextAlign.center,
                     ),
                     onPressed: () {
                       showDialog(
                           context: context,
                           builder: (context) {
                             return AlertDialog(
                               title: Text('Delete Diary'),
                               actions: <Widget>[
                                 Row(
                                   children: [
                                     Align(
                                       child: FlatButton(
                                         child: Text('Cancel',
                                           textAlign: TextAlign.left,),
                                         onPressed: () {
                                           Navigator.pop(context);
                                         },
                                       ),
                                     ),
                                     SizedBox(width: 6,),
                                     Align(
                                       child: FlatButton(
                                         child: Text(
                                           'Confirm',
                                           textAlign: TextAlign.center,
                                         ),
                                         onPressed: () async {
                                           var url = "$uml/my_store/deletediary.php";
                                           print(username);
                                           l=1;
                                           await http.post(url, body: {
                                             "username": username,
                                             "date": date,
                                           });
                                           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Nav(),),);
                                         },
                                       ),
                                     ),
                                   ],
                                 )
                               ],
                             );
                           });
                     },
                   ),
                 ),
                 SizedBox(width: 100),
                 Align(
                   child: FlatButton(
                     child: Text('Done'),
                     onPressed: () {
                       Navigator.pop(context);
                     },
                   ),
                 ),
               ],
             )
            ],
          ),
        ),
        Positioned(
          top: -12,
          left: 16,
          right: 16,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.transparent,
            child: Image.asset(obj.Emo),
          )
        )
      ],
    );
  }
}
// Center(
// child: ClipOval(
// child: Container(
// height: 100,
// width: 100,
// color: Colors.grey ,
// child: Image.asset(
// 'assets/face_with_steam_from_nose.gif',
// ),
// ),
// ),
// )