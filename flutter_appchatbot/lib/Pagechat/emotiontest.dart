import 'package:flutter/material.dart';
import 'package:flutter_appchatbot/class/Emotion.dart';
import 'package:flutter_appchatbot/class/Emotion/Happy.dart';
class Emotiontest extends StatefulWidget {
  @override
  _EmotiontestState createState() => _EmotiontestState();
}

class _EmotiontestState extends State<Emotiontest> {
  @override
  Widget build(BuildContext context) {
    Happy x = Happy(tone.confident);
    print(x.type);
    return Scaffold(
    );
  }
}