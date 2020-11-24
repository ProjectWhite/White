import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appchatbot/Pagechat/chatbot.dart';
import 'package:flutter_appchatbot/class/Emotion.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:async';
import 'indicator.dart';
import 'package:flutter_appchatbot/class/Facade.dart';
import 'package:flutter_appchatbot/Milestoneherebright/LineChart.dart';
import 'package:flutter_appchatbot/Pages/testm.dart';
import 'package:flutter_appchatbot/main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:math' as math;
import 'package:flutter_appchatbot/class/Facade.dart';


class Svt extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MilestonepageState();
}


class MilestonepageState extends State {
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = const Duration(milliseconds: 250);
  Facade facade = new Facade();

  var dataus;
  Future<List> _readdiary() async {
    print('read diary');
    final response = await http.post("$uml/my_store/readdiary.php", body: {
      "username": username,
    });

    dataus = json.decode(response.body);
  print(dataus);
// print(dataus[j]['diary'].toString());
    for(int i=0;;i++){
      try{
        //ignore exception
        if(dataus[i]['type']==null)
          break;
      }catch (Exception){
        print(Exception);
        break;
      }

      if(dataus[i]['type']=='tone.annoyed'||dataus[i]['type']=='tone.frustrated'||dataus[i]['type']=='tone.offended'
          ||dataus[i]['type']=='tone.mad'||dataus[i]['type']=='tone.threatened'){
        setState(() {
            append(0.8);
        });
      }
      else if(dataus[i]['type']=='tone.resentful'||dataus[i]['type']=='tone.shameful'||dataus[i]['type']=='tone.bitter'
          ||dataus[i]['type']=='tone.disappointed'||dataus[i]['type']=='tone.averse'||dataus[i]['type']=='tone.contempt'){
        setState(() {
          append(1.8);
        });
      }
      else if(dataus[i]['type']=='tone.embarrassed'||dataus[i]['type']=='tone.vulnerable' ||dataus[i]['type']=='tone.rejected'
          ||dataus[i]['type']=='tone.insecure'||dataus[i]['type']=='tone.worried'){
        setState(() {
            append(2.8);
        });
      }
      else if(dataus[i]['type']=='tone.confident'||dataus[i]['type']=='tone.grateful'||dataus[i]['type']=='tone.peaceful'
          ||dataus[i]['type']=='tone.excited' ||dataus[i]['type']=='tone.playful'||dataus[i]['type']=='tone.relief'
          ||dataus[i]['type']=='tone.pride' ||dataus[i]['type']=='tone.satisfaction'||dataus[i]['type']=='tone.triumph'){
        setState(() {
          append(3.8);
        });
      }
      else if(dataus[i]['type']=='tone.accepted'||dataus[i]['type']=='tone.gentle'||dataus[i]['type']=='tone.affectionate'
          ||dataus[i]['type']=='tone.passionate' ||dataus[i]['type']=='tone.trusted'||dataus[i]['type']=='tone.contentment'){
        setState(() {
          append(4.8);
        });
      }
      else if(dataus[i]['type']=='tone.inadequate'||dataus[i]['type']=='tone.uninterested'||dataus[i]['type']=='tone.lonely'
          ||dataus[i]['type']=='tone.guilty'||dataus[i]['type']=='tone.hurt'){
        setState(() {
          append(5.8);
        });
      }
      else if(dataus[i]['type']=='tone.startled'||dataus[i]['type']=='tone.overwhelmed'||dataus[i]['type']=='tone.confused'
          ||dataus[i]['type']=='tone.amazed'||dataus[i]['type']=='tone.shocked'){
        setState(() {
          append(6.8);
        });
      }
    }
    print(dataus[0]['type']);
    return dataus;
  }
  // void setColor(){
  //   Facade color1 = new Facade();
  //   color1.start(1,tone.annoyed);
  //   Facade color2 = new Facade();
  //   color1.start(1,tone.annoyed);
  //   Facade color3 = new Facade();
  //   color1.start(1,tone.annoyed);
  //   Facade color4 = new Facade();
  //   color1.start(1,tone.annoyed);
  //   Facade color5 = new Facade();
  //   color1.start(1,tone.annoyed);
  //   Facade color6 = new Facade();
  //   color1.start(1,tone.annoyed);
  //   Facade color7 = new Facade();
  //   color1.start(1,tone.annoyed);
  // }



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
  double count = 1;

  List<FlSpot> allSpots = [
    FlSpot(0, 0),
  ];

  void append(double x){
      allSpots.add(FlSpot(count,x));
      count ++;
  }

  Future<List<dynamic>> _future;
  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
   _future = _readcountdiary();
  }


  var dataus2;
  Future<List> _readcountdiary() async{
    print('count diary');
    final response = await http.post("$uml/my_store/countdiary.php", body: {
      "username": username,
    });
    dataus2 = json.decode(response.body);

    print(dataus2);
    print(dataus2[0]['emotion']);
    for(int i=0;i<7;i++){
      try{
        //ignore exception
        if(dataus2[i]['emotion']==null) {
          break;
        }
      }catch (Exception){
        print(Exception);
        break;
      }
      if(dataus2[i]['emotion']=='emotion.anger'){
        setState(() {
          countAnger = double.parse(dataus2[i]['count(emotion)']);

        });
      }
      else if(dataus2[i]['emotion']=='emotion.disgust'){
        setState(() {
          countDisgust = double.parse(dataus2[i]['count(emotion)']);

        });
      }
      else if(dataus2[i]['emotion']=='emotion.fear'){
        setState(() {
          countFear = double.parse(dataus2[i]['count(emotion)']);
        });
      }
      else if(dataus2[i]['emotion']=='emotion.happy'){
        setState(() {
          countHappy = double.parse(dataus2[i]['count(emotion)']);
        });
      }
      else if(dataus2[i]['emotion']=='emotion.love'){
        setState(() {
          countLove = double.parse(dataus2[i]['count(emotion)']);
        });
      }
      else if(dataus2[i]['emotion']=='emotion.sad'){
        setState(() {
          countSad = double.parse(dataus2[i]['count(emotion)']);
        });
      }
      else if(dataus2[i]['emotion']=='emotion.surprise'){
        setState(() {
          countSurprise = double.parse(dataus2[i]['count(emotion)']);
        });
      }
    }
    // var countHappy = double.parse(dataus2[2]['count(emotion)']);
    countAllEmo = countAnger+countDisgust+countFear+countHappy+countLove+countSad+countSurprise;
    return dataus2;
  }
  int j=1;

  double countAnger = 0; //ตัวนับจำนวนโกรฑ = dataus[0]['Emotion'] //test
  double countDisgust = 0; //ตัวนับจำนวนขยะแขยง
  double countFear = 0; //ตัวนับจำนวนกลัว
  double countHappy  = 0;//ตัวนับจำนวนมีความสุข
  double countLove = 0; //ตัวนับจำนวนรัก
  double countSad = 0; //ตัวนับจำนวนเศร้า
  double countSurprise = 0; //ตัวนับจำนวนตกใจ
  double countAllEmo = 0;
  int touchedIndex;
  bool isPlaying = false;
  bool isShowingMainData;

  @override
  Widget build(BuildContext context) {
    if(j==1){
      _readdiary();
      j++;
    }
    return FutureBuilder(
        future: _future, // the function to get your data from firebase or firestore
        builder : (BuildContext context, AsyncSnapshot snap){
          if(snap.data == null){
            return SpinKitRotatingCircle(color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
              size: 100.0);
          }
          else{
            return Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      SizedBox(height: 50,),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5,0,0,0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                              height: 300,
                              width: 50*count,
                              child: AspectRatio(
                                aspectRatio: 1.23,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(18)),
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xff2c274c),
                                        Color(0xff46426c),
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                  child: Stack(
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: <Widget>[
                                          const SizedBox(
                                            height: 57,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(right: 16.0, left: 6.0),
                                              child: LineChart(
                                                isShowingMainData ? sampleData1() : sampleData2(),
                                                swapAnimationDuration: const Duration(milliseconds: 250),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.refresh,
                                          color: Colors.white.withOpacity(isShowingMainData ? 1.0 : 0.5),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            isShowingMainData =! isShowingMainData;
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5,10,0,0),
                            child: Container(
                              height: 300,
                              width: 188.5,

                              child: AspectRatio(
                                aspectRatio: 1.3,
                                child: Container(
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
                                  child: Column(
                                    children: <Widget>[
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
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5,),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,10,5,0),
                            child: Container(
                              height: 300,
                              width: 188.5,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(18)),
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
                                            Text('Change Color',
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
                        padding: const EdgeInsets.fromLTRB(5,10,5,0),
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
                            children: [
                              SizedBox(height: 15,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(20,0,0,0),
                                        child: Container(
                                          child: FlatButton(onPressed: () {
                                            push0();
                                          },
                                          ),
                                          height: touchedIndex == 0 ? 10 : 25,
                                          width: touchedIndex == 0 ? 10 : 25,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(
                                                7)),
                                            color: Colors.deepPurple[500],
                                            // color: Color.fromRGBO(220, 220, 220, 1),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 55,),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(height: 34,),
                                      Container(
                                        child: Text('Love',style: TextStyle(
                                            color: Colors.white,
                                            fontSize: touchedIndex == 0 ? 14 : 10
                                        ),),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 32,),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                        child: Container(
                                          child: FlatButton(onPressed: () {
                                            push1();
                                          },),
                                          height: touchedIndex == 1 ? 10 : 25,
                                          width: touchedIndex == 1 ? 10 : 25,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(
                                                7)),
                                            color: Colors.indigo[500],
                                            // color: Color.fromRGBO(220, 220, 220, 1),
                                          ),
                                        ),
                                      ),
                                    ],

                                  ),
                                  SizedBox(width: 5,),
                                  Row(
                                    children: [
                                      SizedBox(height: 34,),
                                      Container(
                                        child: Text('Fear',style: TextStyle(
                                            color: Colors.white,
                                            fontSize: touchedIndex == 1 ? 14 : 10
                                        ),),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 35,),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                        child: Container(
                                          child: FlatButton(onPressed: () {
                                            push2();
                                          },
                                          ),
                                          height: touchedIndex == 2 ? 10 : 25,
                                          width: touchedIndex == 2 ? 10 : 25,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(
                                                7)),
                                            color: Colors.blue[500],
                                            // color: Color.fromRGBO(220, 220, 220, 1),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(width: 5,),
                                  Row(
                                    children: [
                                      SizedBox(height: 34,),
                                      Container(
                                        child: Text('Sad',style: TextStyle(
                                            color: Colors.white,
                                            fontSize: touchedIndex == 2 ? 14 : 10
                                        ),),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 20,),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                        child: Container(
                                          child: FlatButton(onPressed: () {
                                            push3();
                                          },
                                          ),
                                          height: touchedIndex == 3 ? 10 : 25,
                                          width: touchedIndex == 3 ? 10 : 25,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(
                                                7)),
                                            color: Colors.green[500],
                                            // color: Color.fromRGBO(220, 220, 220, 1),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(width: 5,),
                                  Row(
                                    children: [
                                      SizedBox(height: 34,),
                                      Container(
                                        child: Text('Disgust',style: TextStyle(
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
                                  SizedBox(width: 19,),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(8,8,0,0),
                                        child: Container(
                                          child: FlatButton(onPressed: () {
                                            push4();
                                          },
                                          ),
                                          height: touchedIndex == 4 ? 10 : 25,
                                          width: touchedIndex == 4 ? 10 : 25,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(
                                                7)),
                                            color: Colors.yellow[500],
                                            // color: Color.fromRGBO(220, 220, 220, 1),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(width: 5,),
                                  Row(
                                    children: [
                                      SizedBox(height: 50,),
                                      Container(
                                        child: Text('Happy',style: TextStyle(
                                            color: Colors.white,
                                            fontSize: touchedIndex == 4 ? 14 : 10
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
                                            push5();
                                          },
                                          ),
                                          height: touchedIndex == 5 ? 10 : 25,
                                          width: touchedIndex == 5 ? 10 : 25,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(
                                                7)),
                                            color: Colors.orange[500],
                                            // color: Color.fromRGBO(220, 220, 220, 1),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(width: 5,),
                                  Row(
                                    children: [
                                      SizedBox(height: 50,),
                                      Container(
                                        child: Text('Surprise',style: TextStyle(
                                            color: Colors.white,
                                            fontSize: touchedIndex == 5 ? 14 : 10
                                        ),),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 18,),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(8,8,0,0),
                                        child: Container(
                                          child: FlatButton(onPressed: () {
                                            push6();
                                          },
                                          ),
                                          height: touchedIndex == 6 ? 10 : 25,
                                          width: touchedIndex == 6 ? 10 : 25,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(
                                                7)),
                                            color: Colors.red[500],
                                            // color: Color.fromRGBO(220, 220, 220, 1),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(width: 5,),
                                  Row(
                                    children: [
                                      SizedBox(height: 50,),
                                      Container(
                                        child: Text('Angry',style: TextStyle(
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
                ),
              ),
            );

          }
        }
    );
  }


  LineChartData sampleData1() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: false,
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff72719b),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          margin: 10,
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return 'S';
              case 1:
                return 'O';
              case 2:
                return 'D';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff75729e),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'A';
              case 2:
                return 'D';
              case 3:
                return 'F';
              case 4:
                return 'H';
              case 5:
                return 'L';
              case 6:
                return 'S';
              case 7:
                return 'Sur';
            }
            return '';
          },
          margin: 10,
          reservedSize: 25,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(
            color: Color(0xff4e4965),
            width: 4,
          ),
          left: BorderSide(
            color: Colors.transparent,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      minX: 0,
      maxX: count,
      maxY: 7,
      minY: 0,
      lineBarsData: linesBarData1(),
    );
  }

  List<LineChartBarData> linesBarData1() {

    final LineChartBarData lineChartBarData3 = LineChartBarData(
      spots: allSpots,
      isCurved: true,
      colors: const [
        Color(0xff27b6fc),
      ],
      barWidth: 1,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: true,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    return [
      lineChartBarData3,
    ];
  }

  LineChartData sampleData2() {
    return LineChartData(
      lineTouchData: LineTouchData(
        enabled: false,
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff72719b),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          margin: 10,
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'SEPT';
              case 7:
                return 'OCT';
              case 12:
                return 'DEC';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff75729e),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'N';
              case 2:
                return 'O';
              case 3:
                return 'I';
              case 4:
                return 'T';
              case 5:
                return 'O';
              case 6:
                return 'M';
              case 7:
                return 'E ';
            }
            return '';
          },
          margin: 10,
          reservedSize: 25,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: const Border(
            bottom: BorderSide(
              color: Color(0xff4e4965),
              width: 4,
            ),
            left: BorderSide(
              color: Colors.transparent,
            ),
            right: BorderSide(
              color: Colors.transparent,
            ),
            top: BorderSide(
              color: Colors.transparent,
            ),
          )),
      minX: 0,
      maxX: 50,
      maxY: 7,
      minY: 0,
      lineBarsData: linesBarData2(),
    );
  }

  List<LineChartBarData> linesBarData2() {
    return [

      LineChartBarData(
        spots: allSpots,

        isCurved: true,
        curveSmoothness: 0,
        colors: const [
          Color(0x4427b6fc),
        ],
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: true,
        ),
        belowBarData: BarAreaData(
          show: true,
        ),
      ),
    ];
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(7, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      // try{
      //   var countHappy = double.parse(dataus2[2]['count(emotion)']);
      // }catch (e){
      //   var countHappy =0.0;
      // }
      switch (i) {
        case 0:
          return PieChartSectionData(
            // color: const Color(0xff13d38e),
            color: HexColor(facade.ecolorget(5)),
            value: countLove.toDouble(),
            title: countLove.toString(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            // color: const Color(0xff845bef),
            color: HexColor(facade.ecolorget(3)),
            value: countFear.toDouble(),
            title: countFear.toString(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            // color: const Color(0xff13d38e),
            color: HexColor(facade.ecolorget(6)),
            value: countSad.toDouble(),
            title: countSad.toString().substring(0,3),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            // color: const Color(0xfff8b250),
            color: HexColor(facade.ecolorget(2)),
            value: countDisgust.toDouble(),
            title: countDisgust.toString(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 4:
          return PieChartSectionData(
            // color: const Color(0xff13d38e),
            color: HexColor(facade.ecolorget(4)),
            value: countHappy.toDouble(),
            title: countHappy.toString(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );

        case 5:
          return PieChartSectionData(
            // color: const Color(0xff13d38e),
            color: HexColor(facade.ecolorget(7)),
            value: countSurprise.toDouble(),
            title: countSurprise.toString(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 6:
          return PieChartSectionData(
            // color: const Color(0xff0293ee),
            color: HexColor(facade.ecolorget(1)),
            value: countAnger.toDouble(),
            title: countAnger.toString(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        default:
          return PieChartSectionData(
            // color: const Color(0xff13d38e),
            color: HexColor(facade.ecolorget(1)),
            value: 1,
            title: 'No data',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
      }
    });
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
        return makeGroupData(0, countLove, isTouched: i == touchedIndex);
      case 1:
        return makeGroupData(1, countFear, isTouched: i == touchedIndex);
      case 2:
        return makeGroupData(2, countSad, isTouched: i == touchedIndex);
      case 3:
        return makeGroupData(3, countDisgust, isTouched: i == touchedIndex);
      case 4:
        return makeGroupData(4, countHappy, isTouched: i == touchedIndex);
      case 5:
        return makeGroupData(5, countSurprise, isTouched: i == touchedIndex);
      case 6:
        return makeGroupData(6, countAnger, isTouched: i == touchedIndex);
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
              String emotionShow;
              String emocolor;
              switch (group.x.toInt()) {
                case 0:
                  emotionShow = 'Love';
                  break;
                case 1:
                  emotionShow = 'Fear';
                  break;
                case 2:
                  emotionShow = 'Sad';
                  break;
                case 3:
                  emotionShow = 'Disgust';
                  break;
                case 4:
                  emotionShow = 'Happy';
                  break;
                case 5:
                  emotionShow = 'Surprise';
                  break;
                case 6:
                  emotionShow = 'Angry';
                  break;
              }
              return BarTooltipItem(
              emotionShow + '\n' + (rod.y - 1).toString(), TextStyle(color: Colors.yellow[500]));
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
                return 'L';
              case 1:
                return 'F';
              case 2:
                return 'S';
              case 3:
                return 'D';
              case 4:
                return 'H';
              case 5:
                return 'Sur';
              case 6:
                return 'A';
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
            return makeGroupData(0,countLove,barColor: Colors.deepPurple[500]);
          case 1:
            return makeGroupData(1,countFear,barColor: Colors.indigo[500]);
          case 2:
            return makeGroupData(2,countSad,barColor: Colors.blue[500]);
          case 3:
            return makeGroupData(3,countDisgust,barColor: Colors.green[500]);
          case 4:
            return makeGroupData(4,countHappy,barColor: Colors.yellow[500]);
          case 5:
            return makeGroupData(5,countSurprise,barColor: Colors.orange[500]);
          case 6:
            return makeGroupData(6,countAnger,barColor: Colors.red[500]);
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

