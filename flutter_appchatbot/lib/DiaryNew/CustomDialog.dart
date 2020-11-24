import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_appchatbot/login/constants.dart';

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText, Color;


  CustomDialog({this.title, this.description, this.buttonText, this.Color});



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
    return Stack(
      children: [
        Container(
          padding:  EdgeInsets.only(top: 100, bottom: 16, right: 16, left: 16),
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
              SizedBox(height: 24),
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
                       Navigator.pop(context);
                     },
                   ),
                 ),
                 SizedBox(width: 6,),
                 Align(
                   child: FlatButton(
                     child: Text('Edit',),
                     onPressed: () {
                       Navigator.pop(context);
                     },
                   ),
                 ),
                 SizedBox(width: 10),
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
            child: Image.asset('assets/face_with_steam_from_nose.gif'),
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