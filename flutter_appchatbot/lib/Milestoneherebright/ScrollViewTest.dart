import 'package:flutter/material.dart';
import 'package:flutter_appchatbot/class/Emotion/Anger.dart';

class Svt extends StatefulWidget {
  @override
  _SvtState createState() => _SvtState();
}

class _SvtState extends State<Svt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(

              height: 300,
              width: 500,
              child: Center(
                child: Text('Scroll'),
              ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(
                18)),
            color: Colors.red,
          ),
            ),
          ],
        ),
      ),
    );
  }
}
