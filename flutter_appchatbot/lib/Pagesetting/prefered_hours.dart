import 'package:flutter/material.dart';

class PreferedHoursPage extends StatefulWidget {
  @override
  _PreferedHoursPageState createState() => _PreferedHoursPageState();
}

class _PreferedHoursPageState extends State<PreferedHoursPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        elevation: 15,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blue[100],
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
