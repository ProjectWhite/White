import 'package:flutter/material.dart';

class Milestone extends StatefulWidget {
  @override
  _MilestoneState createState() => _MilestoneState();
}

class _MilestoneState extends State<Milestone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Text('Milestone Lite Version'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Text('Test'),
    );
  }
}
