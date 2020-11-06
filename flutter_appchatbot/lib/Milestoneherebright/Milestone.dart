import 'package:flutter/material.dart';
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
   int counter=0;

  AddCounter(){
    counter++;
  }


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
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Text('Milestone Lite Version'),
        centerTitle: true,
        backgroundColor: Colors.amber,
        actions: [
          Container(child: FlatButton.icon(
            onPressed: () {
              AddCounter();
              print(counter);
              AddPages1();
            },
            icon: Icon(Icons.add),
            label: Text('Add'),
          ),
          ),
          Container(child: FlatButton.icon(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => super.widget));
              print('$counter');
            },
            icon: Icon(Icons.add),
            label: Text('Re'),
          ),
          ),
        ],
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: ctrl,
        children: [

          Container(
            child: PageView.builder(itemBuilder: (context, position){
              return AddPages1();
            },itemCount: counter+1,
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
  Anger x = new Anger(tone.annoyed);
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
    Container(
    child: CircleAvatar(
    radius: 200,
      backgroundColor: HexColor(x.colors),
    ),
    ),
    ],
    );
  }
}





