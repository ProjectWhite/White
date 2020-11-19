import 'package:flutter_appchatbot/class/Emotion.dart';
import 'package:flutter_appchatbot/class/Emotion/Anger.dart';
import 'package:flutter_appchatbot/class/Emotion/Disgust.dart';
import 'package:flutter_appchatbot/class/Emotion/Fear.dart';
import 'package:flutter_appchatbot/class/Emotion/Happy.dart';
import 'package:flutter_appchatbot/class/Emotion/Love.dart';
import 'package:flutter_appchatbot/class/Emotion/Sad.dart';
import 'package:flutter_appchatbot/class/Emotion/Surprise.dart';

class Facade {
  void start(int type,tone categoryin) {
    if (type==1) {
      Anger x = new Anger(categoryin);
    }
    if (type==2){
      Disgust x = new Disgust(categoryin);
    }
    if (type==3){
      Fear x = new Fear(categoryin);
    }
    if (type==4){
      Happy x = new Happy(categoryin);
    }
    if (type==5){
      Love x = new Love(categoryin);
    }
    if (type==6){
      Sad x = new Sad(categoryin);
    }
    if (type==7){
      Surprise x = new Surprise(categoryin);
    }

  }
}