import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_appchatbot/Milestoneherebright/Milestone.dart';

class MileStoneLite extends StatefulWidget {
  @override
  _MileStoneLiteState createState() => _MileStoneLiteState();
}

class _MileStoneLiteState extends State<MileStoneLite> {
  static int frank=10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar:  AppBar(
        title: Text('MileStone Lite View'),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.zoom_in), onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Milestone()));
          }),
        ],
      ),
      body: Container(
        child: new ListView.builder(itemBuilder: (_,int index) => AddMileStone(),
        itemCount: frank,
        ),
      ),
    );
  }
}

class AddMileStone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            height: 80,
            width: 5,
            color: Colors.black,),
        ),
        Container(
          child: CircleAvatar(
            radius: 50,
            child: Text('test'),

          ),
        ),
      ],
    );
  }
}


