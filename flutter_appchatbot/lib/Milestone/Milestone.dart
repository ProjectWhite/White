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
  int counter=5;
  String msg='';
  var dataus;
  var dataus2;

  Future<List> _readcountdiary() async{
    final response = await http.post("$uml/my_store/countdiary.php", body: {
      "username": username,
    });
    dataus2 = json.decode(response.body);

    print(dataus2);
    print(dataus2[0]['MILESTONE_EMOTION']);
    print(dataus2[0]['count(MILESTONE_EMOTION)']);

    return dataus2;
  }

  // Future<List> _readdiary() async {
  //   final response = await http.post("$uml/my_store/readdiary.php", body: {
  //     "username": username,
  //   });
  //   dataus = json.decode(response.body);
  //
  //   print(dataus);
  //   print(dataus[0]['text']);
  //
  //   return dataus;
  // }

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
              color: Colors.black,
              image: DecorationImage(image: AssetImage("assets/Wallpaper.png"), fit: BoxFit.cover),
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
                )),
              ],
            ),
          ),
      ],
    );
  }
}