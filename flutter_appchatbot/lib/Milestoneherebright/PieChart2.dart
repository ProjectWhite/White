import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:flutter_appchatbot/Milestoneherebright/Indicator.dart';

class PieChartEmotion extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 290,
                width: 180.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(
                      18)),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff2c284c),
                      Color(0xff46426c),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  // color: Color.fromRGBO(220, 220, 220, 1),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: PieChart(
                    PieChartData(
                        pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                          setState(() {
                            if (pieTouchResponse.touchInput is FlLongPressEnd ||
                                pieTouchResponse.touchInput is FlPanEnd) {
                              touchedIndex = -1;
                            } else {
                              touchedIndex = pieTouchResponse.touchedSectionIndex;
                            }
                          });
                        }),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 5,
                        centerSpaceRadius: 30,
                        sections: showingSections()),
                  ),
                ),

              ),
            ],
          ),
          // Column(
          //   mainAxisSize: MainAxisSize.max,
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: const <Widget>[
          //     Indicator(
          //       color: Color(0xff0293ee),
          //       text: 'First',
          //       isSquare: true,
          //     ),
          //     SizedBox(
          //       height: 4,
          //     ),
          //     Indicator(
          //       color: Color(0xfff8b250),
          //       text: 'Second',
          //       isSquare: true,
          //     ),
          //     SizedBox(
          //       height: 4,
          //     ),
          //     Indicator(
          //       color: Color(0xff845bef),
          //       text: 'Third',
          //       isSquare: true,
          //     ),
          //     SizedBox(
          //       height: 4,
          //     ),
          //     Indicator(
          //       color: Color(0xff13d38e),
          //       text: 'Fourth',
          //       isSquare: true,
          //     ),
          //     SizedBox(
          //       height: 4,
          //     ),
          //     Indicator(
          //       color: Color(0xff13d38e),
          //       text: 'Five',
          //       isSquare: true,
          //     ),
          //     SizedBox(
          //       height: 4,
          //     ),
          //     Indicator(
          //       color: Color(0xff13d38e),
          //       text: 'Six',
          //       isSquare: true,
          //     ),
          //     SizedBox(
          //       height: 4,
          //     ),
          //     Indicator(
          //       color: Color(0xff13d38e),
          //       text: 'Seven',
          //       isSquare: true,
          //     ),
          //
          //     SizedBox(
          //       height: 18,
          //     ),
          //
          //   ],
          // ),

        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(7, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      switch (i) {
        case 0:
          return PieChartSectionData(
            // color: const Color(0xff0293ee),
            color: Colors.deepPurple[500],
            value: 40,
            title: '40',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            // color: const Color(0xfff8b250),
            color: Colors.indigo[500],
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            // color: const Color(0xff845bef),
            color: Colors.blue[500],
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            // color: const Color(0xff13d38e),
            color: Colors.green[500],
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 4:
          return PieChartSectionData(
            // color: const Color(0xff13d38e),
            color: Colors.yellow[500],
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 5:
          return PieChartSectionData(
            // color: const Color(0xff13d38e),
            color: Colors.orange[700],
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 6:
          return PieChartSectionData(
            // color: const Color(0xff13d38e),
            color: Colors.red[500],
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        default:
          return null;
      }
    });
  }
}