import 'package:flutter_appchatbot/class/Emotion.dart';

class Anger extends Emotion{
  tone _category;

  Anger(tone category) : super.empty(){
    this._category = category;
    this.type = emotion.anger;
    this.mothercolors = '#B40000';
    if (_category == tone.annoyed) {
      this.colors = '#1b4332';
    }
    else if (_category == tone.frustrated) {
      this.colors = '#2d6a4f';
    }
    else if (_category == tone.offended) {
      this.colors = '#40916c';
    }
    else if (_category == tone.mad) {
      this.colors = '#52b788';
    }
    else if (_category == tone.threatened) {
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