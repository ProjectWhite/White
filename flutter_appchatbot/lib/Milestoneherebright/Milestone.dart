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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Date',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),
                ),
                CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 100,
                  child: Center(
                    child: Text('angry',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Date',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),
                ),
                CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 100,
                  child: Center(
                    child: Text('happy',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Date',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),
                ),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 100,
                  child: Center(
                    child: Text('sad',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
