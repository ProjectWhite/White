import 'package:flutter_appchatbot/class/Emotion.dart';
class Fear extends Emotion{
  tone _category;

  Fear(tone category) : super.empty(){
    this._category = category;
    this.type = emotion.fear;
    if (_category == tone.embarrassed) {
      this.colors = '#1b4332';
    }
    else if (_category == tone.vulnerable) {
      this.colors = '#2d6a4f';
    }
    else if (_category == tone.rejected) {
      this.colors = '#40916c';
    }
    else if (_category == tone.insecure) {
      this.colors = '#52b788';
    }
    else if (_category == tone.worried) {
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