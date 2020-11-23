import 'package:flutter_appchatbot/class/Emotion.dart';
import 'package:flutter_appchatbot/class/Emotion/Anger.dart';
import 'package:flutter_appchatbot/class/Emotion/Disgust.dart';
import 'package:flutter_appchatbot/class/Emotion/Fear.dart';
import 'package:flutter_appchatbot/class/Emotion/Happy.dart';
import 'package:flutter_appchatbot/class/Emotion/Love.dart';
import 'package:flutter_appchatbot/class/Emotion/Sad.dart';
import 'package:flutter_appchatbot/class/Emotion/Surprise.dart';

class Facade {
  String theEmotion;
  String theType;
  void start(int type,tone categoryin) {
    if (type==1) {
      Anger x = new Anger(categoryin);
      theEmotion = x.toString1();
      theType = x.toString2();
    }
    if (type==2){
      Disgust x = new Disgust(categoryin);
      theEmotion = x.toString1();
      theType = x.toString2();
    }
    if (type==3){
      Fear x = new Fear(categoryin);
      theEmotion = x.toString1();
      theType = x.toString2();
    }
    if (type==4){
      Happy x = new Happy(categoryin);
      theEmotion = x.toString1();
      theType = x.toString2();
    }
    if (type==5){
      Love x = new Love(categoryin);
      theEmotion = x.toString1();
      theType = x.toString2();
    }
    if (type==6){
      Sad x = new Sad(categoryin);
      theEmotion = x.toString1();
      theType = x.toString2();
    }
    if (type==7){
      Surprise x = new Surprise(categoryin);
      theEmotion = x.toString1();
      theType = x.toString2();
    }

  }
}