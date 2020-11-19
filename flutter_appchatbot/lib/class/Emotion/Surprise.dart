import 'package:flutter_appchatbot/class/Emotion.dart';
class Surprise extends Emotion{
  tone _category;

  Surprise(tone category) : super.empty(){
    this._category = category;
    this.type = emotion.surprise;
    if (_category == tone.startled) {
      this.colors = '#1b4332';
    }
    else if (_category == tone.overwhelmed) {
      this.colors = '#2d6a4f';
    }
    else if (_category == tone.confused) {
      this.colors = '#40916c';
    }
    else if (_category == tone.amazed) {
      this.colors = '#52b788';
    }
    else if (_category == tone.shocked) {
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