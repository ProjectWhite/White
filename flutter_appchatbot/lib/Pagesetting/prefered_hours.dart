import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreferedHoursPage extends StatefulWidget {
  @override
  _PreferedHoursPageState createState() => _PreferedHoursPageState();
}

class _PreferedHoursPageState extends State<PreferedHoursPage> {

  DateTime _setTime = DateTime.now();
  DateTime newTime;
  Duration initialtimer = new Duration();
  int selectitem = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Preferred Hours',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
        elevation: 15,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.blue[100],
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 25, left: 16, right: 16),
        height: MediaQuery.of(context).copyWith().size.height/3,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.time,
          initialDateTime: _setTime,
          onDateTimeChanged: (DateTime newtime){
            print(newTime);
            _setTime = newtime;
          },
        ),
      ),
    );
  }
}
