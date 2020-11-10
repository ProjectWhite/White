import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_appchatbot/Milestoneherebright/LineChart.dart';
import 'package:flutter_appchatbot/Milestoneherebright/Milestone.dart';
import 'package:flutter_appchatbot/Milestoneherebright/PieChart2.dart';
import 'package:flutter_appchatbot/Milestoneherebright/ScrollViewTest.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_appchatbot/class/Emotion/Anger.dart';
import 'package:flutter_appchatbot/Milestoneherebright/Graph.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_appchatbot/Milestoneherebright/BarChart.dart';
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
      body: Column(

        children: [
          SizedBox(
            height: 20,
          ),
      InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => Milestone())),
         child: Padding(
           padding: const EdgeInsets.fromLTRB(10.0,0,0,0),
           child: SingleChildScrollView(
             scrollDirection: Axis.horizontal,
             child: Container(
              height: 250,
              width: 1000,
              child: LineChartSample1(),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(
                    15)),
                color: Colors.white,
                // color: Color.fromRGBO(220, 220, 220, 1),
              ),
            ),
           ),
         ),
      ),
          SizedBox(
            height: 20,
          ),
          Row(

            children: [
              SizedBox(
                width: 10,
              ),
              Container(

                height: 290,
                width: 180,
                child: PieChartSample2(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(
                      18)),

                  // color: Color.fromRGBO(220, 220, 220, 1),

                ),
              ),
              Container(
                height: 300,
                width: 192  ,
                child: BarChartSample1(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(
                      18)),
                  color: Colors.white,
                  // color: Color.fromRGBO(220, 220, 220, 1),

                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),

      // Container(
      //   decoration: BoxDecoration(
      //     color: Colors.black, //อยากใส่รูปพื้นหลัง แต่งงทำไมใส่ไม่ได้
      //     image: DecorationImage(image: AssetImage("assets/Wallpaper.png"), fit: BoxFit.cover), //ไม่ขึ้นอิสัส
      //   ),
      //   child: new ListView.builder(itemBuilder: (_,int index) => PieChartSample1(),
      //   itemCount: frank,
      //   ),
      // ),
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


