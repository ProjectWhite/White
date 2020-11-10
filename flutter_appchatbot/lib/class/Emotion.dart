
import 'package:flutter_appchatbot/class/EmotionMet.dart';
enum emotion {
  happy,surprise,sad,anger,fear,love,disgust,fine
}
abstract class Emotion implements EmotionMet{
  emotion _type;
  String _colors;
  String _mothercolors;

  Emotion.empty(){
    _type = emotion.fine;
    _colors = '#FFFFFFF';
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
}