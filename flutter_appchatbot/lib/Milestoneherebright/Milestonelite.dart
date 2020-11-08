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
        backgroundColor: Colors.deepOrange,
        actions: [
          FlatButton.icon(onPressed:() {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Milestone()));
          }, icon: Icon(Icons.zoom_in), label: Text('Zoom In')),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black, //อยากใส่รูปพื้นหลัง แต่งงทำไมใส่ไม่ได้
          image: DecorationImage(image: AssetImage("assets/Wallpaper.png"), fit: BoxFit.cover), //ไม่ขึ้นอิสัส
        ),
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
          padding: const EdgeInsets.fromLTRB(10,0,0,0),
          child: Container(
            height: 40,
            width: 200,

            child: Column(
              children: [
                Text('20/19/2000',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                  ),),
              ],
            ),
          ),
        ),
        Container(
          child: CircleAvatar(
            radius: 80,
            child: Text('test'),
            backgroundColor: HexColor(x.colors),
          ),
        ),
      ],
    );
  }
}


