import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_appchatbot/main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_appchatbot/Milestoneherebright/LineChart.dart';
import 'package:flutter_appchatbot/Milestoneherebright/Milestone.dart';
import 'package:flutter_appchatbot/Milestoneherebright/PieChart2.dart';
import 'package:flutter_appchatbot/Milestoneherebright/ScrollViewTest.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_appchatbot/class/Emotion/Anger.dart';
import 'package:flutter_appchatbot/Milestoneherebright/Graph.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_appchatbot/Milestoneherebright/BarChart.dart';
import 'dart:convert';

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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
      InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => Milestone()
          )
          );
        },
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.fromLTRB(12,0,0,0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 5,
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,10,0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 296,
                          width: 180,
                          child: BarChartEmotion(),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(
                                18)),
                            color: Colors.white,
                            // color: Color.fromRGBO(220, 220, 220, 1),

                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   width: 10,
              // ),
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
                gradient: LinearGradient(
                  colors: [

                    Color(0xff2c274c),
                    Color(0xff46426c),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                // color: Color.fromRGBO(220, 220, 220, 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
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
                            SizedBox(width: 50,),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(height: 34,),
                            Container(
                              child: Text('Anger',style: TextStyle(
                                  color: Colors.white
                              ),),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8,8,0,0),
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(
                                      7)),
                                  color: Colors.indigo[500],
                                  // color: Color.fromRGBO(220, 220, 220, 1),
                                ),
                              ),
                            ),
                            SizedBox(width: 50,),
                          ],
                        ),

                        Row(
                          children: [
                            SizedBox(height: 34,),
                            Container(
                              child: Text('Disgust',style: TextStyle(
                                  color: Colors.white
                              ),),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8,8,0,0),
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(
                                      7)),
                                  color: Colors.blue[500],
                                  // color: Color.fromRGBO(220, 220, 220, 1),
                                ),
                              ),
                            ),
                            SizedBox(width: 50,),
                          ],
                        ),

                        Row(
                          children: [
                            SizedBox(height: 34,),
                            Container(
                              child: Text('Fear',style: TextStyle(
                                  color: Colors.white
                              ),),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8,8,0,0),
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(
                                      7)),
                                  color: Colors.green[500],
                                  // color: Color.fromRGBO(220, 220, 220, 1),
                                ),
                              ),
                            ),
                            SizedBox(width: 50,),
                          ],
                        ),

                        Row(
                          children: [
                            SizedBox(height: 34,),
                            Container(
                              child: Text('Happy',style: TextStyle(
                                  color: Colors.white
                              ),),
                            ),
                          ],
                        ),
                      ],
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                        Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8,8,0,0),
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    7)),
                                color: Colors.yellow[500],
                                // color: Color.fromRGBO(220, 220, 220, 1),
                              ),
                            ),
                          ),
                          SizedBox(width: 50,),
                        ],
                      ),

                      Row(
                        children: [
                          SizedBox(height: 34,),
                          Container(
                            child: Text('Love',style: TextStyle(
                                color: Colors.white
                            ),),
                          ),
                        ],
                      ),
                    SizedBox(width: 7,),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8,8,0,0),
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    7)),
                                color: Colors.orange[500],
                                // color: Color.fromRGBO(220, 220, 220, 1),
                              ),
                            ),
                          ),
                          SizedBox(width: 50,),
                        ],
                      ),

                      Row(
                        children: [
                          SizedBox(height: 34,),
                          Container(
                            child: Text('Sad',style: TextStyle(
                                color: Colors.white
                            ),),
                          ),
                        ],
                      ),
                      SizedBox(width: 24,),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8,8,0,0),
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    7)),
                                color: Colors.red[500],
                                // color: Color.fromRGBO(220, 220, 220, 1),
                              ),
                            ),
                          ),
                          SizedBox(width: 50,),
                        ],
                      ),

                      Row(
                        children: [
                          SizedBox(height: 34,),
                          Container(
                            child: Text('Surprise',style: TextStyle(
                                color: Colors.white
                            ),),
                          ),
                        ],
                      ),


                    ],
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


