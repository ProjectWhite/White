import 'dart:ui';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter_appchatbot/Milestoneherebright/bartest.dart';
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


class Showmilestone extends StatefulWidget {
  Showmilestone({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() => MilestonepageState();
}


class MilestonepageState extends State {
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = const Duration(milliseconds: 250);
  Facade facade = new Facade();

  Choice _selectedChoice = choices[4]; // The app's "state".

  void _select(Choice choice) {
    setState(() { // Causes the app to rebuild with the new _selectedChoice.
      _selectedChoice = choice;
    });
  }


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
        if(dataus[i]['type']==null&&dataus[i+1]['type']==null)
          break;
      }catch (Exception){
        print(Exception);
        break;
      }

      if(dataus[i]['type']=='annoyed'||dataus[i]['type']=='frustrated'||dataus[i]['type']=='offended'
          ||dataus[i]['type']=='mad'||dataus[i]['type']=='threatened'){
        setState(() {
            append(1);
        });
      }
      else if(dataus[i]['type']=='resentful'||dataus[i]['type']=='shameful'||dataus[i]['type']=='bitter'
          ||dataus[i]['type']=='disappointed'||dataus[i]['type']=='averse'||dataus[i]['type']=='contempt'){
        setState(() {
          append(2);
        });
      }
      else if(dataus[i]['type']=='embarrassed'||dataus[i]['type']=='vulnerable' ||dataus[i]['type']=='rejected'
          ||dataus[i]['type']=='insecure'||dataus[i]['type']=='worried'){
        setState(() {
            append(3);
        });
      }
      else if(dataus[i]['type']=='confident'||dataus[i]['type']=='grateful'||dataus[i]['type']=='peaceful'
          ||dataus[i]['type']=='excited' ||dataus[i]['type']=='playful'||dataus[i]['type']=='relief'
          ||dataus[i]['type']=='pride' ||dataus[i]['type']=='satisfaction'||dataus[i]['type']=='triumph'){
        setState(() {
          append(4);
        });
      }
      else if(dataus[i]['type']=='accepted'||dataus[i]['type']=='gentle'||dataus[i]['type']=='affectionate'
          ||dataus[i]['type']=='passionate' ||dataus[i]['type']=='trusted'||dataus[i]['type']=='contentment'){
        setState(() {
          append(5);
        });
      }
      else if(dataus[i]['type']=='inadequate'||dataus[i]['type']=='uninterested'||dataus[i]['type']=='lonely'
          ||dataus[i]['type']=='guilty'||dataus[i]['type']=='hurt'){
        setState(() {
          append(6);
        });
      }
      else if(dataus[i]['type']=='startled'||dataus[i]['type']=='overwhelmed'||dataus[i]['type']=='confused'
          ||dataus[i]['type']=='amazed'||dataus[i]['type']=='shocked'){
        setState(() {
          append(7);
        });
      }
    }
    print(dataus[0]['type']);
    return dataus;
  }


  void push0(){
    setState(() {
      touchedIndex = 0 ;
      _selectedChoice = choices[0];
    });
  }
  void push1(){
    setState(() {
      touchedIndex = 1 ;
      _selectedChoice = choices[1];
    });
  }
  void push2(){
    setState(() {
      touchedIndex = 2 ;
      _selectedChoice = choices[2];
    });
  }
  void push3(){
    setState(() {
      touchedIndex = 3 ;
      _selectedChoice = choices[3];
    });
  }
  void push4(){
    setState(() {
      touchedIndex = 4 ;
      _selectedChoice = choices[4];
    });
  }
  void push5(){
    setState(() {
      touchedIndex = 5 ;
      _selectedChoice = choices[5];
    });
  }
  void push6(){
    setState(() {
      touchedIndex = 6 ;
      _selectedChoice = choices[6];
    });
  }
  double count = 1;
  double delc= 9;
  List<FlSpot> allSpots = [
    FlSpot(0, 0.0),
  ];

  void append(double x){
      allSpots.add(FlSpot(count,x));
      count ++;
      if(delc!= 0){
        delc--;
      }
  }

  Future<List<dynamic>> _future;
  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
   _future = _readcountdiary();
  }


  var dataus2;
  double dPie=1;
  String dPieShow = 'No Data';
  int aoy=0;
  String angertext,disgusttext,feartext,happytext,lovetext,sadtext,surprisetext;
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
        if(dataus2[i]['emotion']==null&&dataus[i+1]['type']==null) {
          break;
        }
      }catch (Exception){
        print(Exception);
        break;
      }
      if(dataus2[i]['emotion']=='anger'){
        setState(() {
          countAnger = double.parse(dataus2[i]['count(emotion)']);

        });
      }
      else if(dataus2[i]['emotion']=='disgust'){
        setState(() {
          countDisgust = double.parse(dataus2[i]['count(emotion)']);

        });
      }
      else if(dataus2[i]['emotion']=='fear'){
        setState(() {
          countFear = double.parse(dataus2[i]['count(emotion)']);
        });
      }
      else if(dataus2[i]['emotion']=='happy'){
        setState(() {
          countHappy = double.parse(dataus2[i]['count(emotion)']);
        });
      }
      else if(dataus2[i]['emotion']=='love'){
        setState(() {
          countLove = double.parse(dataus2[i]['count(emotion)']);
        });
      }
      else if(dataus2[i]['emotion']=='sad'){
        setState(() {
          countSad = double.parse(dataus2[i]['count(emotion)']);
        });
      }
      else if(dataus2[i]['emotion']=='surprise'){
        setState(() {
          countSurprise = double.parse(dataus2[i]['count(emotion)']);
        });
      }
    }
    countAllEmo = countAnger+countDisgust+countFear+countHappy+countLove+countSad+countSurprise;
    angertext = ((countAnger/countAllEmo)*100).toStringAsFixed(0)+'%';
    disgusttext = ((countDisgust/countAllEmo)*100).toStringAsFixed(0)+'%';
    feartext = ((countFear/countAllEmo)*100).toStringAsFixed(0)+'%';
    happytext = ((countHappy/countAllEmo)*100).toStringAsFixed(0)+'%';
    lovetext = ((countLove/countAllEmo)*100).toStringAsFixed(0)+'%';
    sadtext = ((countSad/countAllEmo)*100).toStringAsFixed(0)+'%';
    surprisetext = ((countSurprise/countAllEmo)*100).toStringAsFixed(0)+'%';
    if(countAllEmo>0){
      setState(() {
        dPie = 0;
        dPieShow = '';
      });
    }
    if(countAllEmo<=0){
      setState(() {
        aoy=1;
      });
    }
    if(countAnger==0){
      setState(() {
        angertext = '';

      });
    }
    if(countDisgust==0){
      setState(() {
        disgusttext = '';

      });
    }
    if(countFear==0){
      setState(() {
        feartext = '';

      });
    }
    if(countHappy==0){
      setState(() {
        happytext = '';

      });
    }
    if(countLove==0){
      setState(() {
        lovetext = '';

      });
    }
    if(countSad==0){
      setState(() {
        sadtext = '';

      });
    }
    if(countSurprise==0){
      setState(() {
        surprisetext = '';

      });
    }
    print(countAllEmo);
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
     addaoy(){
       return SpinKitRotatingCircle(color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
            size: 80.0,duration: Duration(seconds: 1));
    }
    return FutureBuilder(
        future: _future, // the function to get your data from firebase or firestore
        builder : (BuildContext context, AsyncSnapshot snap){


         if(dPie == 1){
           dPie=2;
            return
              SpinKitRotatingCircle(color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                    size: 80.0,duration: Duration(seconds: 1));
          }
          //---------------------------------------------------------------------------------------------------------
          //---------------------------------------------------------------------------------------------------------
          //---------------------------------------------------------------------------------------------------------


          // else if(snap.data == null){
          //   return SpinKitRotatingCircle(color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
          //     size: 80.0,duration: Duration(seconds: 3));
          // }

          //---------------------------------------------------------------------------------------------------------
          //---------------------------------------------------------------------------------------------------------
          //---------------------------------------------------------------------------------------------------------

          if(dPie==2){
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
                              width: 50*(count+delc),
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
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                                            child: Column(

                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,

                                              children: <Widget>[
                                                Text(
                                                  'Line Chart',
                                                  style: TextStyle(
                                                      color: const Color(0xff72d8bf),
                                                      fontSize: 24,
                                                      fontWeight: FontWeight.bold),
                                                ),

                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
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
                                      // IconButton(
                                      //   icon: Icon(
                                      //     Icons.refresh,
                                      //     color: Colors.white.withOpacity(isShowingMainData ? 1.0 : 0.5),
                                      //   ),
                                      //   onPressed: () {
                                      //     setState(() {
                                      //       isShowingMainData =! isShowingMainData;
                                      //     });
                                      //   },
                                      // )
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
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                                    child: Column(

                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,

                                      children: <Widget>[
                                        Text(
                                          'Emotions',
                                          style: TextStyle(
                                              color: const Color(0xff72d8bf),
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          'Pie Chart',
                                          style: TextStyle(
                                              color: const Color(0xff379982),
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                    ],
                                ),
                                  ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      AspectRatio(
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
                              child: Container(

                                child: ChoiceCard(choice: _selectedChoice),
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
                                            color: HexColor(facade.ecolorget(5)),
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
                                            color: HexColor(facade.ecolorget(3)),
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
                                            color: HexColor(facade.ecolorget(6)),
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
                                            color: HexColor(facade.ecolorget(2)),
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
                                            color: HexColor(facade.ecolorget(4)),
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
                                            color: HexColor(facade.ecolorget(7)),
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
                                            color: HexColor(facade.ecolorget(1)),
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
          return  Scaffold(
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
                          width: 50*(count+delc),
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
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                                        child: Column(

                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,

                                          children: <Widget>[
                                            Text(
                                              'Line Chart',
                                              style: TextStyle(
                                                  color: const Color(0xff72d8bf),
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold),
                                            ),

                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
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
                                  // IconButton(
                                  //   icon: Icon(
                                  //     Icons.refresh,
                                  //     color: Colors.white.withOpacity(isShowingMainData ? 1.0 : 0.5),
                                  //   ),
                                  //   onPressed: () {
                                  //     setState(() {
                                  //       isShowingMainData =! isShowingMainData;
                                  //     });
                                  //   },
                                  // )
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
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                                      child: Column(

                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,

                                        children: <Widget>[
                                          Text(
                                            'Emotions',
                                            style: TextStyle(
                                                color: const Color(0xff72d8bf),
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            'Pie Chart',
                                            style: TextStyle(
                                                color: const Color(0xff379982),
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    AspectRatio(
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
                            child: ChoiceCard(choice: _selectedChoice),
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
                            SizedBox(height: 16.67,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(12.53175,0,0,0),
                                      child: Container(
                                        child: FlatButton(onPressed: () {
                                          push0();
                                        },
                                          child: Text('Love',style: TextStyle(
                                              color: Colors.white.withOpacity(touchedIndex == 0 ? 0.2:1),
                                              fontSize: touchedIndex == 0 ? 12 : 12
                                          ),),
                                        ),
                                        height: touchedIndex == 0 ? 25 : 25,
                                        width: touchedIndex == 0 ? 80 : 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(
                                              7)),
                                          color: HexColor(facade.ecolorget(5)).withOpacity(touchedIndex == 0 ? 0.2:1),
                                          // color: Color.fromRGBO(220, 220, 220, 1),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 55,),
                                  ],
                                ),
                                // Row(
                                //   children: [
                                //     SizedBox(height: 34,),
                                //     Container(
                                //       child: Text('',style: TextStyle(
                                //           color: Colors.white,
                                //           fontSize: touchedIndex == 0 ? 14 : 10
                                //       ),),
                                //     ),
                                //   ],
                                // ),
                                SizedBox(width: 12.53175,),
                                Column(
                                  children: [
                                    Container(
                                      child: FlatButton(onPressed: () {
                                        push1();
                                      },
                                        child: Text('Fear',style: TextStyle(
                                            color: Colors.white.withOpacity(touchedIndex == 1 ? 0.2:1),
                                            fontSize: touchedIndex == 1 ? 12 : 12
                                        ),),
                                      ),
                                      height: touchedIndex == 1 ? 25 : 25,
                                      width: touchedIndex == 1 ? 80 : 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(
                                            7)),
                                        color: HexColor(facade.ecolorget(3)).withOpacity(touchedIndex == 1 ? 0.2:1),
                                        // color: Color.fromRGBO(220, 220, 220, 1),
                                      ),
                                    ),
                                  ],

                                ),
                                SizedBox(width: 12.53175,),
                                Column(
                                  children: [
                                    Container(
                                      child: FlatButton(onPressed: () {
                                        push2();
                                      },
                                        child: Text('Sad',style: TextStyle(
                                            color: Colors.white.withOpacity(touchedIndex == 2 ? 0.2:1),
                                            fontSize: touchedIndex == 2 ? 12 : 12
                                        ),),
                                      ),
                                      height: touchedIndex == 2 ? 25 : 25,
                                      width: touchedIndex == 2 ? 80 : 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(
                                            7)),
                                        color: HexColor(facade.ecolorget(6)).withOpacity(touchedIndex == 2 ? 0.2:1),
                                        // color: Color.fromRGBO(220, 220, 220, 1),
                                      ),
                                    ),

                                  ],
                                ),

                                SizedBox(width: 12.53175),
                                Column(
                                  children: [
                                    Container(
                                      child: FlatButton(onPressed: () {
                                        push3();
                                      },
                                        child: Text('Disgust',style: TextStyle(
                                            color: Colors.white.withOpacity(touchedIndex == 3 ? 0.2:1),
                                            fontSize: touchedIndex == 3 ? 12 : 12
                                        ),),
                                      ),
                                      height: touchedIndex == 3 ? 25 : 25,
                                      width: touchedIndex == 3 ? 80 : 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(
                                            7)),
                                        color: HexColor(facade.ecolorget(2)).withOpacity(touchedIndex == 3 ? 0.2:1),
                                        // color: Color.fromRGBO(220, 220, 220, 1),
                                      ),
                                    ),

                                  ],
                                ),
                                SizedBox(width: 12.53175,),
                              ],
                            ),
                            SizedBox(height: 16.67,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width: 12.53175+46.265875,),
                                Column(
                                  children: [
                                    Container(
                                      child: FlatButton(onPressed: () {
                                        push4();
                                      },
                                        child: Text('Happy',style: TextStyle(
                                            color: Colors.white.withOpacity(touchedIndex == 4 ? 0.2:1),
                                            fontSize: touchedIndex == 4 ? 12 : 12
                                        ),),
                                      ),
                                      height: touchedIndex == 4 ? 25 : 25,
                                      width: touchedIndex == 4 ? 80 : 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(
                                            7)),
                                        color: HexColor(facade.ecolorget(4)).withOpacity(touchedIndex == 4 ? 0.2:1),
                                        // color: Color.fromRGBO(220, 220, 220, 1),
                                      ),
                                    ),

                                  ],
                                ),
                                SizedBox(width: 12.53175,),
                                Column(
                                  children: [
                                    Container(
                                      child: FlatButton(onPressed: () {
                                        push5();
                                      },
                                        child: Text('Surprise',style: TextStyle(
                                            color: Colors.white.withOpacity(touchedIndex == 5 ? 0.2:1),
                                            fontSize: touchedIndex == 5 ? 12 : 12
                                        ),),
                                      ),
                                      height: touchedIndex == 5 ? 25 : 25,
                                      width: touchedIndex == 5 ? 80 : 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(
                                            7)),
                                        color: HexColor(facade.ecolorget(7)).withOpacity(touchedIndex == 5 ? 0.2:1),
                                        // color: Color.fromRGBO(220, 220, 220, 1),
                                      ),
                                    ),

                                  ],
                                ),

                                SizedBox(width: 12.53175,),
                                Column(
                                  children: [
                                    Container(
                                      child: FlatButton(onPressed: () {
                                        push6();
                                      },
                                        child: Text('Angry',style: TextStyle(
                                            color: Colors.white.withOpacity(touchedIndex == 6 ? 0.2:1),
                                            fontSize: touchedIndex == 6 ? 12 : 12
                                        ),),
                                      ),
                                      height: touchedIndex == 6 ? 25 : 25,
                                      width: touchedIndex == 6 ? 80 : 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(
                                            7)),
                                        color: HexColor(facade.ecolorget(1)).withOpacity(touchedIndex == 6 ? 0.2:1),
                                        // color: Color.fromRGBO(220, 220, 220, 1),
                                      ),
                                    ),

                                  ],
                                ),
                                SizedBox(width: 12.53175,),



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
    );
  }

//---------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------

  LineChartData sampleData1() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.red.withOpacity(0.8),
        ),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: false,
      ),
      gridData: FlGridData(
        show: true,drawHorizontalLine: true,horizontalInterval: 0.99857142857
      ),

      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 20,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff72719b),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          margin: 10,
          // getTitles: (value) {
          //   // switch (value.toInt()) {
          //   //   case 0:
          //   //     return 'S';
          //   //   case 1:
          //   //     return 'O';
          //   //   case 2:
          //   //     return 'D';
          //   // }
          //   for(int o = 0 ;o<2;o++){
          //     return 'b';
          //   }
          //   return 'a';
          // },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff75729e),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          margin: 10,
          reservedSize: 67,
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'Angry';
              case 2:
                return 'Disgust';
              case 3:
                return 'Fear';
              case 4:
                return 'Happy';
              case 5:
                return 'Love';
              case 6:
                return 'Sad';
              case 7:
                return 'Surprise';
            }
            return '';
          },
        ),
        rightTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff75729e),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          margin: 10,
          reservedSize: 67,
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'Angry';
              case 2:
                return 'Disgust';
              case 3:
                return 'Fear';
              case 4:
                return 'Happy';
              case 5:
                return 'Love';
              case 6:
                return 'Sad';
              case 7:
                return 'Surprise';
            }
            return '';
          },
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
      maxX: count+delc,
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
        Colors.white,
      ],
      barWidth: 1,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: true,
      ),
      belowBarData: BarAreaData(
        show: true,
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
        show: true,
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
                return 'Area';
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
      maxX: 30+count,
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
    return List.generate(8, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      switch (i) {
        case 0:
          return PieChartSectionData(
            // color: const Color(0xff13d38e),
            color: HexColor(facade.ecolorget(5)),
            value: countLove.toDouble(),
            title: lovetext,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            // color: const Color(0xff845bef),
            color: HexColor(facade.ecolorget(3)),
            value: countFear.toDouble(),
            title: feartext,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            // color: const Color(0xff13d38e),
            color: HexColor(facade.ecolorget(6)),
            value: countSad.toDouble(),
            title: sadtext,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            // color: const Color(0xfff8b250),
            color: HexColor(facade.ecolorget(2)),
            value: countDisgust.toDouble(),
            title: disgusttext,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 4:
          return PieChartSectionData(
            // color: const Color(0xff13d38e),
            color: HexColor(facade.ecolorget(4)),
            value: countHappy.toDouble(),
            title: happytext,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );

        case 5:
          return PieChartSectionData(
            // color: const Color(0xff13d38e),
            color: HexColor(facade.ecolorget(7)),
            value: countSurprise.toDouble(),
            title: surprisetext,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 6:
          return PieChartSectionData(
            // color: const Color(0xff0293ee),
            color: HexColor(facade.ecolorget(1)),
            value: countAnger.toDouble(),
            title: angertext,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        default:
          return
            PieChartSectionData(
            // color: const Color(0xff13d38e),
            color: HexColor(facade.ecolorget(2)),
            value: dPie,
            title: dPieShow,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
      }
    });
  }


}


class Choice {
  const Choice({ this.title, this.icon });
  final String title;
  final IconData icon;
}

const List<Choice> choices = <Choice>[
  Choice(title: 'Love', icon: Icons.directions_car),
  Choice(title: 'Fear', icon: Icons.directions_bike),
  Choice(title: 'Sad', icon: Icons.directions_boat),
  Choice(title: 'Disgust', icon: Icons.directions_bus),
  Choice(title: 'Happy', icon: Icons.directions_railway),
  Choice(title: 'Surprise', icon: Icons.directions_walk),
  Choice(title: 'Angry', icon: Icons.directions_ferry),
];

class ChoiceCard extends StatefulWidget {

  const ChoiceCard({ Key key, this.choice }) : super(key: key);

  final Choice choice;
  static const List<Color> availableColors = [
    Colors.purpleAccent,
    Colors.yellow,
    Colors.lightBlue,
    Colors.orange,
    Colors.pink,
    Colors.redAccent,
  ];

  @override
  _ChoiceCardState createState() => _ChoiceCardState();
}

final Color barBackgroundColor = const Color(0xff72d8bf);
final Duration animDuration = const Duration(milliseconds: 250);

int touchedIndex;

bool isPlaying = false;


class _ChoiceCardState extends State<ChoiceCard> {

  double countangry1=0,countangry2=0,countangry3=0,countangry4=0,countangry5=0;
  double counthappy1=0,counthappy2=0,counthappy3=0,counthappy4=0,counthappy5=0,counthappy6=0,counthappy7=0,counthappy8=0,counthappy9=0;
  double countfear1=0,countfear2=0,countfear3=0,countfear4=0,countfear5=0;
  double countlove1=0,countlove2=0,countlove3=0,countlove4=0,countlove5=0,countlove6=0;
  double countsad1=0,countsad2=0,countsad3=0,countsad4=0,countsad5=0;
  double countsur1=0,countsur2=0,countsur3=0,countsur4=0,countsur5=0;
  double countdis1=0,countdis2=0,countdis3=0,countdis4=0,countdis5=0,countdis6=0;

  var dataus;
  Future<List> _countdiary() async {
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
        if(dataus[i]['type']==null&&dataus[i+1]['type']==null)
          break;
      }catch (Exception){
        print(Exception);
        break;
      }

      if(dataus[i]['type']=='annoyed'){
        setState(() {
          countangry1++;
        });
      }
      else if(dataus[i]['type']=='frustrated'){
        setState(() {
          countangry2++;
        });
      }
      else if(dataus[i]['type']=='offended'){
        setState(() {
          countangry3++;
        });
      }
      else if(dataus[i]['type']=='mad'){
        setState(() {
          countangry4++;
        });
      }
      else if(dataus[i]['type']=='threatened'){
        setState(() {
          countangry5++;
        });
      }
      else if(dataus[i]['type']=='resentful'){
        setState(() {
          countdis1++;
        });
      }
      else if(dataus[i]['type']=='shameful'){
        setState(() {
          countdis2++;
        });
      }
      else if(dataus[i]['type']=='bitter'){
        setState(() {
          countdis3++;
        });
      }
      else if(dataus[i]['type']=='disappointed'){
        setState(() {
          countdis4++;
        });
      }
      else if(dataus[i]['type']=='averse'){
        setState(() {
          countdis5++;
        });
      }
      else if(dataus[i]['type']=='contempt'){
        setState(() {
          countdis6++;
        });
      }
      else if(dataus[i]['type']=='embarrassed'){
        setState(() {
          countfear1++;
        });
      }
      else if(dataus[i]['type']=='vulnerable'){
        setState(() {
          countfear2++;
        });
      }
      else if(dataus[i]['type']=='rejected'){
        setState(() {
          countfear3++;
        });
      }
      else if(dataus[i]['type']=='insecure'){
        setState(() {
          countfear4++;
        });
      }
      else if(dataus[i]['type']=='worried'){
        setState(() {
          countfear5++;
        });
      }

      else if(dataus[i]['type']=='confident'){
        setState(() {
          counthappy1++;
        });
      }
      else if(dataus[i]['type']=='grateful'){
        setState(() {
          counthappy2++;
        });
      }
      else if(dataus[i]['type']=='peaceful'){
        setState(() {
          counthappy3++;
        });
      }
      else if(dataus[i]['type']=='excited'){
        setState(() {
          counthappy4++;
        });
      }
      else if(dataus[i]['type']=='playful'){
        setState(() {
          counthappy5++;
        });
      }
      else if(dataus[i]['type']=='relief'){
        setState(() {
          counthappy6++;
        });
      }
      else if(dataus[i]['type']=='pride'){
        setState(() {
          counthappy7++;
        });
      }
      else if(dataus[i]['type']=='satisfaction'){
        setState(() {
          counthappy8++;
        });
      }
      else if(dataus[i]['type']=='triumph'){
        setState(() {
          counthappy9++;
        });
      }
      else if(dataus[i]['type']=='accepted'){
        setState(() {
          countlove1++;
        });
      }
      else if(dataus[i]['type']=='gentle'){
        setState(() {
          countlove2++;
        });
      }
      else if(dataus[i]['type']=='affectionate'){
        setState(() {
          countlove3++;
        });
      }
      else if(dataus[i]['type']=='passionate'){
        setState(() {
          countlove4++;
        });
      }
      else if(dataus[i]['type']=='trusted'){
        setState(() {
          countlove5++;
        });
      }
      else if(dataus[i]['type']=='contentment'){
        setState(() {
          countlove6++;
        });
      }
      else if(dataus[i]['type']=='inadequate'){
        setState(() {
          countsad1++;
        });
      }
      else if(dataus[i]['type']=='uninterested'){
        setState(() {
          countsad2++;
        });
      }
      else if(dataus[i]['type']=='lonely'){
        setState(() {
          countsad3++;
        });
      }
      else if(dataus[i]['type']=='guilty'){
        setState(() {
          countsad4++;
        });
      }
      else if(dataus[i]['type']=='hurt'){
        setState(() {
          countsad5++;
        });
      }
      else if(dataus[i]['type']=='startled'){
        setState(() {
          countsur1++;
        });
      }
      else if(dataus[i]['type']=='overwhelmed'){
        setState(() {
          countsur2++;
        });
      }
      else if(dataus[i]['type']=='confused'){
        setState(() {
          countsur3++;
        });
      }
      else if(dataus[i]['type']=='amazed'){
        setState(() {
          countsur4++;
        });
      }
      else if(dataus[i]['type']=='shocked'){
        setState(() {
          countsur5++;
        });
      }
    }

    print(dataus[0]['type']);
    return dataus;
  }
  Choice _selectedChoice = choices[0];
  void _select(Choice choice) {
    setState(() { // Causes the app to rebuild with the new _selectedChoice.
      _selectedChoice = choice;
    });
  }
  int k=1;
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .headline4;
    if (k == 1) {
      _countdiary();
      k++;
    }
    if (widget.choice.title == 'Love') {
      return Container(
        height: 300,
        width: 188.5,
        child: AspectRatio(
          aspectRatio: 1,
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
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                  Padding(
                  padding: const EdgeInsets.fromLTRB(8,0,8,0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                      Text(
                        widget.choice.title,
                        style: TextStyle(
                            color: const Color(0xff72d8bf),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Bar Chart',
                        style: TextStyle(
                            color: const Color(0xff379982),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                   ),
                  ),
                      const SizedBox(
                          height: 20,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: BarChart(
                            isPlaying ? 0 : mainBarData1(),
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

              ],
            ),
          ),
        ),
      );
    }
    if (widget.choice.title == 'Fear') {
      return Container(
        height: 300,
        width: 188.5,
        child: AspectRatio(
          aspectRatio: 1,
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
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8,0,8,0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text(
                              widget.choice.title,
                              style: TextStyle(
                                  color: const Color(0xff72d8bf),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Bar Chart',
                              style: TextStyle(
                                  color: const Color(0xff379982),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                          height: 20,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0),
                          child: BarChart(
                            isPlaying ? 0 : mainBarData2(),
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

              ],
            ),
          ),
        ),
      );
    }
    if (widget.choice.title == 'Sad') {
      return Container(
        height: 300,
        width: 188.5,
        child: AspectRatio(
          aspectRatio: 1,
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
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8,0,8,0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text(
                              widget.choice.title,
                              style: TextStyle(
                                  color: const Color(0xff72d8bf),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Bar Chart',
                              style: TextStyle(
                                  color: const Color(0xff379982),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                          height: 20,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0),
                          child: BarChart(
                            isPlaying ? 0 : mainBarData3(),
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

              ],
            ),
          ),
        ),
      );
    }
    if (widget.choice.title == 'Disgust') {
      return Container(
        height: 300,
        width: 188.5,
        child: AspectRatio(
          aspectRatio: 1,
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
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8,0,8,0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text(
                              widget.choice.title,
                              style: TextStyle(
                                  color: const Color(0xff72d8bf),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Bar Chart',
                              style: TextStyle(
                                  color: const Color(0xff379982),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                          height: 20,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0),
                          child: BarChart(
                            isPlaying ? 0 : mainBarData4(),
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

              ],
            ),
          ),
        ),
      );
    }
    if (widget.choice.title == 'Happy') {
      return Container(
        height: 300,
        width: 188.5,
        child: AspectRatio(
          aspectRatio: 1,
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
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8,0,8,0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text(
                              widget.choice.title,
                              style: TextStyle(
                                  color: const Color(0xff72d8bf),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Bar Chart',
                              style: TextStyle(
                                  color: const Color(0xff379982),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0),
                          child: BarChart(
                            isPlaying ? 0 : mainBarData5(),
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

              ],
            ),
          ),
        ),
      );
    }
    if (widget.choice.title == 'Surprise') {
      return Container(
        height: 300,
        width: 188.5,
        child: AspectRatio(
          aspectRatio: 1,
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
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8,0,8,0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text(
                              widget.choice.title,
                              style: TextStyle(
                                  color: const Color(0xff72d8bf),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Bar Chart',
                              style: TextStyle(
                                  color: const Color(0xff379982),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                          height: 20,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0),
                          child: BarChart(
                            isPlaying ? 0 : mainBarData6(),
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

              ],
            ),
          ),
        ),
      );
    }
    if (widget.choice.title == 'Angry') {
      return Container(
        height: 300,
        width: 188.5,
        child: AspectRatio(
          aspectRatio: 1,
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
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8,0,8,0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text(
                              widget.choice.title,
                              style: TextStyle(
                                  color: const Color(0xff72d8bf),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Bar Chart',
                              style: TextStyle(
                                  color: const Color(0xff379982),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                          height: 20,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0),
                          child: BarChart(
                            isPlaying ? 0 : mainBarData7(),
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

              ],
            ),
          ),
        ),
      );
    }
  }



  BarChartGroupData makeGroupData(int x,
      double y, {
        bool isTouched = false,
        Color barColor = Colors.white,
        double width = 10,
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

  List<BarChartGroupData> showingGroups1() =>
      List.generate(6, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, countlove1, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, countlove2, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, countlove3, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, countlove4, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, countlove5, isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, countlove6, isTouched: i == touchedIndex);
          default:
            return null;
        }
      });

  List<BarChartGroupData> showingGroups2() =>
      List.generate(5, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, countfear1, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, countfear2, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, countfear3, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, countfear4, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, countfear5, isTouched: i == touchedIndex);
          default:
            return null;
        }
      });

  List<BarChartGroupData> showingGroups3() =>
      List.generate(5, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, countsad1, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, countsad2, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, countsad3, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, countsad4, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, countsad5, isTouched: i == touchedIndex);
          default:
            return null;
        }
      });

  List<BarChartGroupData> showingGroups4() =>
      List.generate(6, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, countdis1, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, countdis2, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, countdis3, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, countdis4, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, countdis5, isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, countdis6, isTouched: i == touchedIndex);
          default:
            return null;
        }
      });

  List<BarChartGroupData> showingGroups5() =>
      List.generate(9, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, counthappy1, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, counthappy2, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, counthappy3, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, counthappy4, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, counthappy5, isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, counthappy6, isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, counthappy7, isTouched: i == touchedIndex);
          case 7:
            return makeGroupData(7, counthappy8, isTouched: i == touchedIndex);
          case 8:
            return makeGroupData(8, counthappy9, isTouched: i == touchedIndex);
          default:
            return null;
        }
      });

  List<BarChartGroupData> showingGroups6() =>
      List.generate(5, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, countsur1, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, countsur2, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, countsur3, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, countsur4, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, countsur5, isTouched: i == touchedIndex);
          default:
            return null;
        }
      });

  List<BarChartGroupData> showingGroups7() =>
      List.generate(5, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, countangry1, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, countangry2, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, countangry3, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, countangry4, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, countangry5, isTouched: i == touchedIndex);
          default:
            return null;
        }
      });

  BarChartData mainBarData1() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x.toInt()) {
                case 0:
                  weekDay = 'Accepted';
                  break;
                case 1:
                  weekDay = 'Gentle';
                  break;
                case 2:
                  weekDay = 'Affectionate';
                  break;
                case 3:
                  weekDay = 'Passionate';
                  break;
                case 4:
                  weekDay = 'Trusted';
                  break;
                case 5:
                  weekDay = 'Contentment';
                  break;
                  break;
              }
              return BarTooltipItem(
                  weekDay + '\n' + (rod.y - 1).toString(),
                  TextStyle(color: Colors.yellow));
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
          const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
          margin: 10,
          reservedSize: 40,
          rotateAngle: 90,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return '  Accepted';
              case 1:
                return 'Gentle';
              case 2:
                return '    Affectionate';
              case 3:
                return '    Passionate';
              case 4:
                return ' Trusted';
              case 5:
                return '    Contentment';
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
      barGroups: showingGroups1(),
    );
  }

  BarChartData mainBarData2() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x.toInt()) {
                case 0:
                  weekDay = 'Embarrassed';
                  break;
                case 1:
                  weekDay = 'Vulnerable';
                  break;
                case 2:
                  weekDay = 'Rejected';
                  break;
                case 3:
                  weekDay = 'Insecure';
                  break;
                case 4:
                  weekDay = 'Worried';
                  break;
              }
              return BarTooltipItem(
                  weekDay + '\n' + (rod.y - 1).toString(),
                  TextStyle(color: Colors.yellow));
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
          const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
          margin: 10,
          reservedSize: 40,
          rotateAngle: 90,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return '    Embarrassed';
              case 1:
                return '   Vulnerable';
              case 2:
                return ' Rejected';
              case 3:
                return ' Insecure';
              case 4:
                return 'Worried';
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
      barGroups: showingGroups2(),
    );
  }

  BarChartData mainBarData3() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x.toInt()) {
                case 0:
                  weekDay = 'Inadequate';
                  break;
                case 1:
                  weekDay = 'Uninterested';
                  break;
                case 2:
                  weekDay = 'Lonely';
                  break;
                case 3:
                  weekDay = 'Guilty';
                  break;
                case 4:
                  weekDay = 'Hurt';
                  break;
              }
              return BarTooltipItem(
                  weekDay + '\n' + (rod.y - 1).toString(),
                  TextStyle(color: Colors.yellow));
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
          const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
          margin: 10,
          reservedSize: 45,
          rotateAngle: 90,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return '     Inadequate';
              case 1:
                return '      Uninterested';
              case 2:
                return '  Lonely';
              case 3:
                return ' Guilty';
              case 4:
                return 'Hurt';
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
      barGroups: showingGroups3(),
    );
  }

  BarChartData mainBarData4() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x.toInt()) {
                case 0:
                  weekDay = 'Resentful';
                  break;
                case 1:
                  weekDay = 'Shameful';
                  break;
                case 2:
                  weekDay = 'Bitter';
                  break;
                case 3:
                  weekDay = 'Disappointed';
                  break;
                case 4:
                  weekDay = 'Averse';
                  break;
                case 5:
                  weekDay = 'Contempt';
                  break;
              }
              return BarTooltipItem(
                  weekDay + '\n' + (rod.y - 1).toString(),
                  TextStyle(color: Colors.yellow));
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
          const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
          margin: 10,
          reservedSize: 35,
          rotateAngle: 90,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return '  Resentful ';
              case 1:
                return '  Shameful';
              case 2:
                return 'Bitter';
              case 3:
                return '  Disappoint  ';
              case 4:
                return 'Averse  ';
              case 5:
                return '  Contempt';
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
      barGroups: showingGroups4(),
    );
  }

  BarChartData mainBarData5() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x.toInt()) {
                case 0:
                  weekDay = 'Confident';
                  break;
                case 1:
                  weekDay = 'Grateful';
                  break;
                case 2:
                  weekDay = 'Peaceful';
                  break;
                case 3:
                  weekDay = 'Excited';
                  break;
                case 4:
                  weekDay = 'Playful';
                  break;
                case 5:
                  weekDay = 'Relief';
                  break;
                case 6:
                  weekDay = 'Pride';
                  break;
                case 7:
                  weekDay = 'Satisfaction';
                  break;
                case 8:
                  weekDay = 'Triumph';
                  break;
              }
              return BarTooltipItem(
                  weekDay + '\n' + (rod.y - 1).toString(),
                  TextStyle(color: Colors.yellow));
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
          const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
          margin: 10,
          reservedSize: 35,
          rotateAngle: 90,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return '   Confident';
              case 1:
                return '  Grateful';
              case 2:
                return '  Peaceful ';
              case 3:
                return ' Excited';
              case 4:
                return ' Playful';
              case 5:
                return 'Relief';
              case 6:
                return 'Pride';
              case 7:
                return '    Satisfaction';
              case 8:
                return ' Triumph  ';
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
      barGroups: showingGroups5(),
    );
  }

  BarChartData mainBarData6() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x.toInt()) {
                case 0:
                  weekDay = 'Startled';
                  break;
                case 1:
                  weekDay = 'Overwhelmed';
                  break;
                case 2:
                  weekDay = 'Confused';
                  break;
                case 3:
                  weekDay = 'Amazed';
                  break;
                case 4:
                  weekDay = 'Shocked';
                  break;
              }
              return BarTooltipItem(
                  weekDay + '\n' + (rod.y - 1).toString(),
                  TextStyle(color: Colors.yellow));
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
          const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
          margin: 10,
          reservedSize: 40,
          rotateAngle: 90,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'Startled  ';
              case 1:
                return '   Overwhelmed  ';
              case 2:
                return ' Confused ';
              case 3:
                return 'Amazed  ';
              case 4:
                return ' Shocked';
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
      barGroups: showingGroups6(),
    );
  }

  BarChartData mainBarData7() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x.toInt()) {
                case 0:
                  weekDay = 'Annoyed';
                  break;
                case 1:
                  weekDay = 'Frustrated';
                  break;
                case 2:
                  weekDay = 'Offended';
                  break;
                case 3:
                  weekDay = 'Mad';
                  break;
                case 4:
                  weekDay = 'Threatened';
                  break;
              }
              return BarTooltipItem(
                  weekDay + '\n' + (rod.y - 1).toString(),
                  TextStyle(color: Colors.yellow));
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
          const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
          margin: 10,
          reservedSize: 40,
          rotateAngle: 90,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return '   Annoyed';
              case 1:
                return '    Frustrated';
              case 2:
                return '   Offended ';
              case 3:
                return 'Mad ';
              case 4:
                return '   Threatened    ';
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
      barGroups: showingGroups7(),
    );
  }

}