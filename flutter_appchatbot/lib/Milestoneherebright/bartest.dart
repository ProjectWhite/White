import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:fl_chart/fl_chart.dart';
import 'dart:ui';
import 'package:flutter_appchatbot/Pagechat/chatbot.dart';
import 'package:flutter_appchatbot/main.dart';
import 'dart:convert';
import '../main.dart';

class Bar7z extends StatefulWidget {
  Bar7z({Key key, this.title}) : super(key: key);

  final String title;


  @override
  _Bar7zState createState() => _Bar7zState();
}

class _Bar7zState extends State<Bar7z> {



  Choice _selectedChoice = choices[0]; // The app's "state".

  void _select(Choice choice) {
    setState(() { // Causes the app to rebuild with the new _selectedChoice.
      _selectedChoice = choice;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text('Select Tone'),
          //   ],
          // ),
          Container(
              height: 300,
              width: 188.5,
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
              child: Wrap(
                children: [
                  ChoiceCard(choice: _selectedChoice),
                  // PopupMenuButton<Choice>(
                  //   icon: Icon(Icons.settings),
                  //   onSelected: _select,
                  //   itemBuilder: (BuildContext context) {
                  //     return choices.map((Choice choice) {
                  //       return PopupMenuItem<Choice>(
                  //         value: choice,
                  //         child: Text(choice.title),
                  //       );
                  //     }).toList();
                  //   },
                  // ),
                ],
              )
          ),
        ],
      ),
    );
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
    final TextStyle textStyle = Theme.of(context).textTheme.headline4;
    if(k==1){
      _countdiary();
      k++;
    }
    if(widget.choice.title=='Love'){
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
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        widget.choice.title,
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
    if(widget.choice.title=='Fear'){
      return Container(
        height: 300,
        width: 188.5,
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
                          widget.choice.title,
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
        ),
      );
    }
    if(widget.choice.title=='Sad'){
      return Container(
        height: 300,
        width: 188.5,
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
                          widget.choice.title,
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
        ),
      );
    }
    if(widget.choice.title=='Disgust'){
      return Container(
        height: 300,
        width: 188.5,
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
                          widget.choice.title,
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
        ),
      );
    }
    if(widget.choice.title=='Happy'){
      return Container(
        height: 300,
        width: 188.5,
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
                          widget.choice.title,
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
        ),
      );
    }
    if(widget.choice.title=='Surprise'){
      return Container(
        height: 300,
        width: 188.5,
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
                          widget.choice.title,
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
        ),
      );
    }
    if(widget.choice.title=='Angry'){
      return Container(
        height: 300,
        width: 188.5,
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
                          widget.choice.title,
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
        ),
      );
    }

  }
  BarChartGroupData makeGroupData(
      int x,
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

  List<BarChartGroupData> showingGroups1() => List.generate(6, (i) {
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

  List<BarChartGroupData> showingGroups2() => List.generate(5, (i) {
    switch (i) {
      case 0:
        return makeGroupData(0, countfear1, isTouched: i == touchedIndex);
      case 1:
        return makeGroupData(1,countfear2, isTouched: i == touchedIndex);
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

  List<BarChartGroupData> showingGroups3() => List.generate(5, (i) {
    switch (i) {
      case 0:
        return makeGroupData(0, countsad1, isTouched: i == touchedIndex);
      case 1:
        return makeGroupData(1,countsad2, isTouched: i == touchedIndex);
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

  List<BarChartGroupData> showingGroups4() => List.generate(6, (i) {
    switch (i) {
      case 0:
        return makeGroupData(0, countdis1, isTouched: i == touchedIndex);
      case 1:
        return makeGroupData(1,countdis2, isTouched: i == touchedIndex);
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

  List<BarChartGroupData> showingGroups5() => List.generate(9, (i) {
    switch (i) {
      case 0:
        return makeGroupData(0, counthappy1, isTouched: i == touchedIndex);
      case 1:
        return makeGroupData(1,counthappy2, isTouched: i == touchedIndex);
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

  List<BarChartGroupData> showingGroups6() => List.generate(5, (i) {
    switch (i) {
      case 0:
        return makeGroupData(0, countsur1, isTouched: i == touchedIndex);
      case 1:
        return makeGroupData(1,countsur2, isTouched: i == touchedIndex);
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

  List<BarChartGroupData> showingGroups7() => List.generate(5, (i) {
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
                return 'G';
              case 2:
                return 'A';
              case 3:
                return 'P';
              case 4:
                return 'T';
              case 5:
                return 'C';
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
                return 'E';
              case 1:
                return 'V';
              case 2:
                return 'R';
              case 3:
                return 'I';
              case 4:
                return 'W';
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
                return 'I';
              case 1:
                return 'U';
              case 2:
                return 'L';
              case 3:
                return 'G';
              case 4:
                return 'H';
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
                return 'R';
              case 1:
                return 'S';
              case 2:
                return 'B';
              case 3:
                return 'D';
              case 4:
                return 'A';
              case 5:
                return 'C';
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
                return 'C';
              case 1:
                return 'G';
              case 2:
                return 'P';
              case 3:
                return 'E';
              case 4:
                return 'P';
              case 5:
                return 'R';
              case 6:
                return 'P';
              case 7:
                return 'S';
              case 8:
                return 'T';
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
                return 'S';
              case 1:
                return 'O';
              case 2:
                return 'C';
              case 3:
                return 'A';
              case 4:
                return 'S';
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
                return 'F';
              case 2:
                return 'O';
              case 3:
                return 'M';
              case 4:
                return 'T';
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

