import 'package:flutter_appchatbot/class/Emotion.dart';
enum tone {
  inadequate,uninterested,lonely,guilty,hurt
}
class Sad extends Emotion{
  tone _category;

  Sad(tone category) : super.empty(){
    this._category = category;
    this.type = emotion.sad;
    if (_category == tone.inadequate) {
      this.colors = '#1b4332';
    }
    else if (_category == tone.uninterested) {
      this.colors = '#2d6a4f';
    }
    else if (_category == tone.lonely) {
      this.colors = '#40916c';
    }
    else if (_category == tone.guilty) {
      this.colors = '#52b788';
    }
    else if (_category == tone.hurt) {
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