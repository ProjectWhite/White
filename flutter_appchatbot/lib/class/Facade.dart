import 'package:flutter_appchatbot/class/Emotion.dart';
import 'package:flutter_appchatbot/class/Emotion/Anger.dart';
import 'package:flutter_appchatbot/class/Emotion/Happy.dart';
class Facade {
  void start(int type,tone categoryin) {
    if (type==1) {
      Anger x = new Anger(categoryin);
      print(x.type);
    }
    if (type==2){
      Happy y = new Happy(categoryin);
      print(y.category);
    }
  }
}