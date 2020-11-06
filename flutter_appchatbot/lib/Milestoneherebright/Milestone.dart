import 'package:flutter/material.dart';
import 'package:flutter_appchatbot/main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Milestone extends StatefulWidget {
  @override
  _MilestoneState createState() => _MilestoneState();
}

class _MilestoneState extends State<Milestone> {
  @override
  final angry = Colors.red;
  final PageController ctrl = PageController();

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
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: ctrl,
        children: [
          Container(
            child: new PageView.builder(itemBuilder: (context, position){
              return AddPages();
            },itemCount: 3,
            ),
            ),
        ],
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}

class AddPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
          child: CircleAvatar(
            radius: 50,
            child: Text('test5'),
          ),
        );
  }
}


