
import 'package:flutter_appchatbot/class/EmotionMet.dart';
enum emotion {
  happy,surprise,sad,anger,fear,love,disgust,fine
}
enum tone {
  fine,
  annoyed,frustrated,offended,mad,threatened,
  confident,grateful,peaceful,excited,playful,relief,pride,satisfaction,triumph,
  embarrassed,vulnerable,rejected,insecure,worried,
  accepted,gentle,affectionate,passionate,trusted,contentment,
  inadequate,uninterested,lonely,guilty,hurt,
  startled,overwhelmed,confused,amazed,shocked,
  resentful,shameful,bitter,disappointed,averse,contempt
}

abstract class Emotion implements EmotionMet{
  emotion _type;
  String _colors;
  String _mothercolors;
  tone _category;

  Emotion.empty(){
    _type = emotion.fine;
    _colors = '#FEF9EF';
    _category = tone.fine;
  }
  String get mothercolors => _mothercolors;

  set mothercolors(String value) {
    _mothercolors = value;
  }
  emotion get type {
    return _type;
  }

  set type(emotion value) {
    _type = value;
  }

  String get colors => _colors;

  set colors(String value) {
    _colors = value ;
  }

  tone get category => _category;

  set category(tone value) {
    _category = value;
  }

  String toString1() {
    return '$_type';
  }

  String toString2() {
    return '$_category';
  }
}