
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter_appchatbot/class/EmotionMet.dart';
enum emotion {
  happy,surprise,sad,anger,fear,love,disgust,fine
}
enum tone {
  fine,
  annoyed,frustrated,offended,mad,threatened, //anger
  confident,grateful,peaceful,excited,playful,relief,pride,satisfaction,triumph, //happy
  embarrassed,vulnerable,rejected,insecure,worried, //fear
  accepted,gentle,affectionate,passionate,trusted,contentment, //love
  inadequate,uninterested,lonely,guilty,hurt, //sad
  startled,overwhelmed,confused,amazed,shocked, //surprise
  resentful,shameful,bitter,disappointed,averse,contempt //disgust
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
    // return '$_type';
    return EnumToString.convertToString(this._type);
  }

  String toString2() {
    // return '$_category';
    return EnumToString.convertToString(this._category);
  }

}