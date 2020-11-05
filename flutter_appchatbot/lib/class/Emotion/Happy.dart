import 'package:flutter_appchatbot/class/Emotion.dart';
enum tone {
  confident,grateful,peaceful,excited,playful,relief,pride,satisfaction,triumph
}
class Happy extends Emotion{
  tone _category;
  Happy(tone category) : super.empty(){
    this._category = category;
    this.type = emotion.happy;
    if (_category == tone.confident) {
      this.colors = '#1b4332';
    }
    else if (_category == tone.grateful) {
      this.colors = '#2d6a4f';
    }
    else if (_category == tone.peaceful) {
      this.colors = '#40916c';
    }
    else if (_category == tone.excited) {
      this.colors = '#52b788';
    }
    else if (_category == tone.playful) {
      this.colors = '#74c69d';
    }
  }


  tone get category => _category;

  set category(tone value) {
    _category = value;
  }

  @override
  String CalculateColor() {

    // TODO: implement CalculateColor
    throw UnimplementedError();
  }

  @override
  EmotionDetail() {
    // TODO: implement EmotionDetail
    throw UnimplementedError();
  }

  @override
  EstimateEmotion() {
    // TODO: implement EstimateEmotion
    throw UnimplementedError();
  }


}