// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_appchatbot/class/Emotion/Anger.dart';
// import 'package:flutter_appchatbot/Milestoneherebright/Indicator.dart';
//
// class PieChartSample1 extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => PieChartSample1State();
// }
//
// class PieChartSample1State extends State {
//   int touchedIndex;
//
//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 1.3,
//       child: Card(
//         color: Colors.white,
//         child: Column(
//           children: <Widget>[
//             const SizedBox(
//               height: 28,
//             ),
//             Row(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 Indicator(
//                   color: const Color(0xff0293ee),
//                   text: 'Happy',
//                   isSquare: false,
//                   size: touchedIndex == 0 ? 18 : 16,
//                   textColor: touchedIndex == 0 ? Colors.black : Colors.grey,
//                 ),
//                 Indicator(
//                   color: const Color(0xfff8b250),
//                   text: '',
//                   isSquare: false,
//                   size: touchedIndex == 1 ? 18 : 16,
//                   textColor: touchedIndex == 1 ? Colors.black : Colors.grey,
//                 ),
//                 Indicator(
//                   color: const Color(0xff845bef),
//                   text: 'Three',
//                   isSquare: false,
//                   size: touchedIndex == 2 ? 18 : 16,
//                   textColor: touchedIndex == 2 ? Colors.black : Colors.grey,
//                 ),
//                 Indicator(
//                   color: const Color(0xff13d38e),
//                   text: 'Four',
//                   isSquare: false,
//                   size: touchedIndex == 3 ? 18 : 16,
//                   textColor: touchedIndex == 3 ? Colors.black : Colors.grey,
//                 ),
//                 Indicator(
//                   color: const Color(0xff13d38e),
//                   text: 'Five',
//                   isSquare: false,
//                   size: touchedIndex == 4 ? 18 : 16,
//                   textColor: touchedIndex == 4 ? Colors.black : Colors.grey,
//                 ),
//                 Indicator(
//                   color: const Color(0xff13d38e),
//                   text: 'Six',
//                   isSquare: false,
//                   size: touchedIndex == 5 ? 18 : 16,
//                   textColor: touchedIndex == 5 ? Colors.black : Colors.grey,
//                 ),
//                 Indicator(
//                   color: const Color(0xff13d38e),
//                   text: 'Seven',
//                   isSquare: false,
//                   size: touchedIndex == 6 ? 18 : 16,
//                   textColor: touchedIndex == 6 ? Colors.black : Colors.grey,
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 18,
//             ),
//             Expanded(
//               child: AspectRatio(
//                 aspectRatio: 1,
//                 child: PieChart(
//                   PieChartData(
//                       pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
//                         setState(() {
//                           if (pieTouchResponse.touchInput is FlLongPressEnd ||
//                               pieTouchResponse.touchInput is FlPanEnd) {
//                             touchedIndex = -1;
//                           } else {
//                             touchedIndex = pieTouchResponse.touchedSectionIndex;
//                           }
//                         });
//                       }),
//                       startDegreeOffset: 180,
//                       borderData: FlBorderData(
//                         show: false,
//                       ),
//                       sectionsSpace: 12,
//                       centerSpaceRadius: 0,
//                       sections: showingSections()),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   List<PieChartSectionData> showingSections() {
//     return List.generate(
//       7,
//           (i) {
//         final isTouched = i == touchedIndex;
//         final double opacity = isTouched ? 1 : 0.6;
//         switch (i) {
//           case 0:
//             return PieChartSectionData(
//               color: Colors.red.withOpacity(opacity),
//               value: 25,
//               title: '1',
//               radius: 80,
//               titleStyle: TextStyle(
//                   fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff044d7c)),
//               titlePositionPercentageOffset: 0.55,
//             );
//           case 1:
//             return PieChartSectionData(
//               color: const Color(0xfff8b250).withOpacity(opacity),
//               value: 15,
//               title: '2',
//               radius: 65,
//               titleStyle: TextStyle(
//                   fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff90672d)),
//               titlePositionPercentageOffset: 0.55,
//             );
//           case 2:
//             return PieChartSectionData(
//               color: const Color(0xff845bef).withOpacity(opacity),
//               value: 20,
//               title: '3',
//               radius: 60,
//               titleStyle: TextStyle(
//                   fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff4c3788)),
//               titlePositionPercentageOffset: 0.6,
//             );
//           case 3:
//             return PieChartSectionData(
//               color: const Color(0xff13d38e).withOpacity(opacity),
//               value: 15,
//               title: '4',
//               radius: 70,
//               titleStyle: TextStyle(
//                   fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff0c7f55)),
//               titlePositionPercentageOffset: 0.55,
//             );
//           case 4:
//             return PieChartSectionData(
//               color: const Color(0xff13d38e).withOpacity(opacity),
//               value: 10,
//               title: '5',
//               radius: 70,
//               titleStyle: TextStyle(
//                   fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff0c7f55)),
//               titlePositionPercentageOffset: 0.55,
//             );
//           case 5:
//             return PieChartSectionData(
//               color: const Color(0xff13d38e).withOpacity(opacity),
//               value: 20,
//               title: '6',
//               radius: 70,
//               titleStyle: TextStyle(
//                   fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff0c7f55)),
//               titlePositionPercentageOffset: 0.55,
//             );
//           case 6:
//             return PieChartSectionData(
//               color: const Color(0xff13d38e).withOpacity(opacity),
//               value: 20,
//               title: '7',
//               radius: 70,
//               titleStyle: TextStyle(
//                   fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff0c7f55)),
//               titlePositionPercentageOffset: 0.55,
//             );
//           default:
//             return null;
//         }
//       },
//     );
//   }
// }