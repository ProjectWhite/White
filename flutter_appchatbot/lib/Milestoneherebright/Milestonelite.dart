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
      body: Column(

        children: [
          SizedBox(
            height: 30,
          ),
      InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => Milestone())),
         child: Padding(
           padding: const EdgeInsets.fromLTRB(10,0,0,0),
           child: SingleChildScrollView(
             scrollDirection: Axis.horizontal,
             child: Container(
              height: 250,
              width: 1000,
              child: LineChartEmotion(),
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
            height: 10,
          ),
          Row(

            children: [
              SizedBox(
                width: 12,
              ),
              Container(

                height: 290,
                width: 180,
                child: PieChartEmotion(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(
                      18)),

                  // color: Color.fromRGBO(220, 220, 220, 1),

                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 290,
                width: 180,
                child: BarChartEmotion(),
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
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0,12,12,0),
            child: Container(
              height: 100,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(
                    18)),
                color: Colors.black,
                // color: Color.fromRGBO(220, 220, 220, 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8,8,0,0),
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(
                              7)),
                          color: Colors.deepPurple[500],
                          // color: Color.fromRGBO(220, 220, 220, 1),
                        ),
                      ),
                    ),

                  ],
              ),
            ),
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

// class AddMileStone extends StatelessWidget {
//   @override
//   Anger x = new Anger(tone.annoyed);
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10),
//           child: Container(
//             height: 80,
//             width: 5,
//             color: Colors.black,
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.fromLTRB(10,0,0,0),
//           child: Container(
//             height: 40,
//             width: 200,
//
//             child: Column(
//               children: [
//                 Text('20/19/2000',
//                   style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                   ),),
//               ],
//             ),
//           ),
//         ),
//         Container(
//           child: CircleAvatar(
//             radius: 80,
//             child: Text('test'),
//             backgroundColor: HexColor(x.colors),
//           ),
//         ),
//       ],
//     );
//   }
// }


