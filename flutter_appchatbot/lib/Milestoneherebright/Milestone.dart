import 'package:flutter/material.dart';
import 'package:flutter_appchatbot/Milestoneherebright/Milestonelite.dart';
import 'package:flutter_appchatbot/Milestoneherebright/Pages.dart';
import 'package:flutter_appchatbot/Pagechat/chatbot.dart';
import 'package:flutter_appchatbot/main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_appchatbot/class/Emotion/Anger.dart';
// import 'package:flutter_appchatbot/class/Emotion/Disgust.dart';
// import 'package:flutter_appchatbot/class/Emotion/Fear.dart';
// import 'package:flutter_appchatbot/class/Emotion/Happy.dart';
// import 'package:flutter_appchatbot/class/Emotion/Love.dart';
// import 'package:flutter_appchatbot/class/Emotion/Sad.dart';
// import 'package:flutter_appchatbot/class/Emotion/Surprise.dart';
import 'package:hexcolor/hexcolor.dart';

class Milestone extends StatefulWidget {
  @override
  _MilestoneState createState() => _MilestoneState();
}



class _MilestoneState extends State<Milestone> {
  @override
  final angry = Colors.red;
  final PageController ctrl = PageController();
   int counter=5;


  String msg='';
  var dataus;
  Future<List> _readdiary() async {
    final response = await http.post("$uml/my_store/readdiary.php", body: {
      "username": username,
    });

    dataus = json.decode(response.body);

    print(dataus);
    print(dataus[0]['text']);

    return dataus;
  }

  Future<List> _insertdiary() async{
    for(int i=0;;i++){
      if(dataus[i]['text']==null)break;
      else{
        counter++;
        print(dataus[i]['username']);
        print(dataus[i]['text']);
        print(dataus[i]['date']);
        final res = await http.post("$uml/my_store/insertdiary.php", body: {
          "username": username,
          "date" : dataus[i]['date'],
          "diary" : dataus[i]['text']
        });
      }
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Milestone View'),
        centerTitle: true,
        backgroundColor: Colors.red[500],
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: ctrl,
        children: [

          Container(
            decoration: BoxDecoration(
              color: Colors.black, //อยากใส่รูปพื้นหลัง แต่งงทำไมใส่ไม่ได้
              image: DecorationImage(image: AssetImage("assets/Wallpaper.png"), fit: BoxFit.cover), //ไม่ขึ้นอิสัส
            ),

            child: PageView.builder(itemBuilder: (context, position){
              return AddPages1();
            },itemCount: counter,
            ),
            ),

        ],
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}


class AddPages1 extends StatefulWidget {
  @override
  _AddPages1State createState() => _AddPages1State();
}

class _AddPages1State extends State<AddPages1> {
  @override
  // Anger x = new Anger(tone.annoyed);
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0,0,0,40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('11/11/2020',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        letterSpacing: 2,
                        color: Colors.black,
                      ),),
                    ],
                  ),
                ),
                Container(
                  height: 500,
                  width: 300,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(
                      15)),
                  color: Colors.white,
                  // color: Color.fromRGBO(220, 220, 220, 1),
                ),
    ),
                // ConstrainedBox(
                //   constraints: BoxConstraints(
                //     minWidth: 350,
                //     minHeight: 550,
                //     maxWidth: double.infinity,
                //     maxHeight: double.infinity,
                //   ),
                //   child: Container(
                //       color: Colors.grey[900],
                //       width: 10,
                //       height: 10,
                //       child: Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Text('YourDiary',
                //         style: TextStyle(
                //           color: Colors.white,
                //         ),),
                //       ),
                //   ),
                // )
              ],
            ),
          ),
      ],
    );
  }
}


// child: Text('Your Diary',style: TextStyle(
// fontSize: 15,
// fontWeight: FontWeight.w500,
// letterSpacing: 1
// ),),





