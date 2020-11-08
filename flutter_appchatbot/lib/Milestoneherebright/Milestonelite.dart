import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_appchatbot/Milestoneherebright/Milestone.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_appchatbot/class/Emotion/Anger.dart';
class MileStoneLite extends StatefulWidget {
  @override
  _MileStoneLiteState createState() => _MileStoneLiteState();
}

class _MileStoneLiteState extends State<MileStoneLite> {
  static int frank=10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(
        title: Text('MileStone Lite View'),
        centerTitle: true,
        backgroundColor: Colors.amber,
        actions: [
          FlatButton.icon(onPressed:() {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Milestone()));
          }, icon: Icon(Icons.zoom_in), label: Text('Zoom In')),
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
  Anger x = new Anger(tone.annoyed);
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            height: 80,
            width: 5,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            height: 20,
            width: 100,
            color: Colors.white,
            child: Column(
              children: [
                Text('20/19/2000',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.white
                  ),),
              ],
            ),
          ),
        ),
        Container(
          child: CircleAvatar(
            radius: 50,
            child: Text('test'),
            backgroundColor: HexColor(x.colors),
          ),
        ),
      ],
    );
  }
}


