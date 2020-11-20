import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appchatbot/Pagechat/chatbot.dart';
import 'package:flutter_appchatbot/class/Emotion.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:async';
import 'indicator.dart';
import 'package:flutter_appchatbot/class/Facade.dart';

class Svt extends StatefulWidget {
  final List<Color> availableColors = [
    Colors.purpleAccent,
    Colors.yellow,
    Colors.lightBlue,
    Colors.orange,
    Colors.pink,
    Colors.redAccent,
  ];
  @override
  State<StatefulWidget> createState() => PieChartSample1State();
}

class PieChartSample1State extends State {
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = const Duration(milliseconds: 250);

  void setColor(){
    Facade color1 = new Facade();
    color1.start(1,tone.annoyed);
    Facade color2 = new Facade();
    color1.start(1,tone.annoyed);
    Facade color3 = new Facade();
    color1.start(1,tone.annoyed);
    Facade color4 = new Facade();
    color1.start(1,tone.annoyed);
    Facade color5 = new Facade();
    color1.start(1,tone.annoyed);
    Facade color6 = new Facade();
    color1.start(1,tone.annoyed);
    Facade color7 = new Facade();
    color1.start(1,tone.annoyed);





  }


  void push0(){
    setState(() {
      touchedIndex = 0 ;
    });
  }
  void push1(){
    setState(() {
      touchedIndex = 1 ;
    });
  }
  void push2(){
    setState(() {
      touchedIndex = 2 ;
    });
  }
  void push3(){
    setState(() {
      touchedIndex = 3 ;
    });
  }
  void push4(){
    setState(() {
      touchedIndex = 4 ;
    });
  }
  void push5(){
    setState(() {
      touchedIndex = 5 ;
    });
  }
  void push6(){
    setState(() {
      touchedIndex = 6 ;
    });
  }
  int touchedIndex;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Column(
      children: [
        Row(
          children: [
            Container(
              height: 300,
              width: 190,
              child: AspectRatio(
                aspectRatio: 1.3,
                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[

                      // Padding(
                      //   padding: const EdgeInsets.all(20.0),
                      //   child: Row(
                      //     mainAxisSize: MainAxisSize.max,
                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //     children: <Widget>[
                      //       Indicator(
                      //         color: const Color(0xff0293ee),
                      //         text: 'One',
                      //         isSquare: false,
                      //         size: touchedIndex == 0 ? 18 : 16,
                      //         textColor: touchedIndex == 0 ? Colors.black : Colors.grey,
                      //       ),
                      //       Indicator(
                      //         color: const Color(0xfff8b250),
                      //         text: 'Two',
                      //         isSquare: false,
                      //         size: touchedIndex == 1 ? 18 : 16,
                      //         textColor: touchedIndex == 1 ? Colors.black : Colors.grey,
                      //       ),
                      //       Indicator(
                      //         color: const Color(0xff845bef),
                      //         text: 'Three',
                      //         isSquare: false,
                      //         size: touchedIndex == 2 ? 18 : 16,
                      //         textColor: touchedIndex == 2 ? Colors.black : Colors.grey,
                      //       ),
                      //       Indicator(
                      //         color: const Color(0xff13d38e),
                      //         text: 'Four',
                      //         isSquare: false,
                      //         size: touchedIndex == 3 ? 18 : 16,
                      //         textColor: touchedIndex == 3 ? Colors.black : Colors.grey,
                      //       ),
                      //       Text(
                      //         'frank',
                      //         style: TextStyle(
                      //           fontSize: touchedIndex == 2 ? 18 : 16,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      Expanded(
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
                                startDegreeOffset: 180,
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                sectionsSpace: 12,
                                centerSpaceRadius: 0,
                                sections: showingSections()),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        Container(
        height: 300,
        width: 200,
        child: AspectRatio(
        aspectRatio: 1,
        child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),

        child: Container(
        height: 50,
        width: 50,
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
        child: Stack(
        children: <Widget>[
        Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
        Text(
        'Push to see Emo Colors',
        style: TextStyle(
        color: const Color(0xff72d8bf), fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
        height: 4,
        ),
        Text(
        'Bar Chart',
        style: TextStyle(
        color: const Color(0xff379982), fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
        height: 38,
        ),
        Expanded(
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: BarChart(
        isPlaying ? randomData() : mainBarData(),
        swapAnimationDuration: animDuration,
        ),
        ),
        ),
        const SizedBox(
        height: 12,
        ),
        ],
        ),
        ),
        Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
        alignment: Alignment.topRight,
        child: IconButton(
        icon: Icon(
        isPlaying ? Icons.pause : Icons.play_arrow,
        color: Colors.red ,
        ),
        onPressed: () {
        setState(() {
        isPlaying = !isPlaying;
        if (isPlaying) {
        refreshState();
        }
        });
        },
        ),
        ),
        )
        ],
        ),
        ),
        ),
        ),
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
                            child: FlatButton(onPressed: () {
                              push0();
                            },
                            ),
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

                              color: Colors.white,
                            fontSize: touchedIndex == 0 ? 14 : 10
                          ),),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8,8,0,0),
                          child: Container(
                            child: FlatButton(onPressed: () {
                              push1();
                            },),
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
                              color: Colors.white,
                              fontSize: touchedIndex == 1 ? 14 : 10
                          ),),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8,8,0,0),
                          child: Container(
                            child: FlatButton(onPressed: () {
                              push2();
                            },
                            ),
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
                              color: Colors.white,
                              fontSize: touchedIndex == 2 ? 14 : 10
                          ),),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8,8,0,0),
                          child: Container(
                            child: FlatButton(onPressed: () {
                              push3();
                            },
                            ),
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
                            color: Colors.white,
                              fontSize: touchedIndex == 3 ? 14 : 10

                          ),
                          ),
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
                            child: FlatButton(onPressed: () {
                              push4();
                            },
                            ),
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
                              color: Colors.white,
                              fontSize: touchedIndex == 4 ? 14 : 10
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
                            child: FlatButton(onPressed: () {
                              push5();
                            },
                            ),
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
                        SizedBox(width: 48,),
                      ],
                    ),

                    Row(
                      children: [
                        SizedBox(height: 34,),
                        Container(
                          child: Text('Sad',style: TextStyle(
                              color: Colors.white,
                              fontSize: touchedIndex == 5 ? 14 : 10
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
                            child: FlatButton(onPressed: () {
                              push6();
                            },
                            ),
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
                        SizedBox(width: 34,),
                      ],
                    ),

                    Row(
                      children: [
                        SizedBox(height: 36,),
                        Container(
                          child: Text('Surprise',style: TextStyle(
                              color: Colors.white,
                              fontSize: touchedIndex == 6 ? 14 : 10
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
    );
  }



  List<PieChartSectionData> showingSections() {
    return List.generate(
      7,
          (i) {
        final isTouched = i == touchedIndex;
        final double opacity = isTouched ? 1 : 0.6;
        switch (i) {
          case 0:
            return PieChartSectionData(
              color: const Color(0xff0293ee).withOpacity(opacity),
              value: touchedIndex == 2 ? 18 : 16,
              title: '1',
              radius: 80,
              titleStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff044d7c)),
              titlePositionPercentageOffset: 0.55,
            );
          case 1:
            return PieChartSectionData(
              color: const Color(0xfff8b250).withOpacity(opacity),
              value: 25,
              title: '2',
              radius: 65,
              titleStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff90672d)),
              titlePositionPercentageOffset: 0.55,
            );
          case 2:
            return PieChartSectionData(
              color: const Color(0xff845bef).withOpacity(opacity),
              value: 25,
              title: '3',
              radius: 60,
              titleStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff4c3788)),
              titlePositionPercentageOffset: 0.6,
            );
          case 3:
            return PieChartSectionData(
              color: const Color(0xff13d38e).withOpacity(opacity),
              value: 25,
              title: '4',
              radius: 70,
              titleStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff0c7f55)),
              titlePositionPercentageOffset: 0.55,
            );
          case 4:
            return PieChartSectionData(
              color: const Color(0xff13d38e).withOpacity(opacity),
              value: 25,
              title: '5',
              radius: 70,
              titleStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff0c7f55)),
              titlePositionPercentageOffset: 0.55,
            );
          case 5:
            return PieChartSectionData(
              color: const Color(0xff13d38e).withOpacity(opacity),
              value: 25,
              title: '6',
              radius: 70,
              titleStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff0c7f55)),
              titlePositionPercentageOffset: 0.55,
            );
          case 6:
            return PieChartSectionData(
              color: const Color(0xff13d38e).withOpacity(opacity),
              value: 25,
              title: '7',
              radius: 70,
              titleStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff0c7f55)),
              titlePositionPercentageOffset: 0.55,
            );
          default:
            return null;
        }
      },
    );
  }

  BarChartGroupData makeGroupData(
      int x,
      double y, {
        bool isTouched = false,
        Color barColor = Colors.white,
        double width = 15,
        List<int> showTooltips = const [],
      }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          colors: isTouched ? [Colors.yellow] : [barColor],
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 20,
            colors: [barBackgroundColor],
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
    switch (i) {
      case 0:
        return makeGroupData(0, 5, isTouched: i == touchedIndex);
      case 1:
        return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
      case 2:
        return makeGroupData(2, 5, isTouched: i == touchedIndex);
      case 3:
        return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
      case 4:
        return makeGroupData(4, 9, isTouched: i == touchedIndex);
      case 5:
        return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
      case 6:
        return makeGroupData(6, 6.5, isTouched: i == touchedIndex);
      default:
        return null;
    }
  });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x.toInt()) {
                case 0:
                  weekDay = 'Anger';
                  break;
                case 1:
                  weekDay = 'Disgust';
                  break;
                case 2:
                  weekDay = 'Fear';
                  break;
                case 3:
                  weekDay = 'Happy';
                  break;
                case 4:
                  weekDay = 'Love';
                  break;
                case 5:
                  weekDay = 'Sad';
                  break;
                case 6:
                  weekDay = 'Surprise';
                  break;
              }
              return BarTooltipItem(
                  weekDay + '\n' + (rod.y - 1).toString(), TextStyle(color: Colors.yellow));
            }),
        touchCallback: (barTouchResponse) {
          setState(() {
            if (barTouchResponse.spot != null &&
                barTouchResponse.touchInput is! FlPanEnd &&
                barTouchResponse.touchInput is! FlLongPressEnd) {
              touchedIndex = barTouchResponse.spot.touchedBarGroupIndex;
            } else {
              touchedIndex = -1;
            }
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) =>
          const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          margin: 16,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'A';
              case 1:
                return 'D';
              case 2:
                return 'F';
              case 3:
                return 'H';
              case 4:
                return 'L';
              case 5:
                return 'S';
              case 6:
                return 'Sur';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
    );
  }

  BarChartData randomData() {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) =>
          const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          margin: 16,
          getTitles: (double value) {

            switch (value.toInt()) {
              case 0:
                return 'A';
              case 1:
                return 'D';
              case 2:
                return 'F';
              case 3:
                return 'H';
              case 4:
                return 'L';
              case 5:
                return 'S';
              case 6:
                return 'Sur';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0,5/*เยดแม่แทนได้*/,barColor: Colors.deepPurple[500]);
          case 1:
            return makeGroupData(1,6.5,barColor: Colors.indigo[500]);
          case 2:
            return makeGroupData(2,5,barColor: Colors.blue[500]);
          case 3:
            return makeGroupData(3,7.5,barColor: Colors.green[500]);
          case 4:
            return makeGroupData(4,9,barColor: Colors.yellow[500]);
          case 5:
            return makeGroupData(5,11.5,barColor: Colors.orange[500]);
          case 6:
            return makeGroupData(6,6.5,barColor: Colors.red[500]);
          default:
            return null;
        }
      }),

    );
  }
  // makeGroupData(3, Random().nextInt(15).toDouble() + 6,
  // barColor: widget.availableColors[Random().nextInt(widget.availableColors.length)])
  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(animDuration + const Duration(milliseconds: 50));
    if (isPlaying) {
      refreshState();
    }
  }
}
