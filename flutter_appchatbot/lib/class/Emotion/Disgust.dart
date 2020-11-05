import 'package:flutter_appchatbot/class/Emotion.dart';
enum tone {
  resentful,shameful,bitter,disappointed,averse,contempt
}
class Disgust extends Emotion{
  tone _category;

  Disgust(tone category) : super.empty(){
    this._category = category;
    this.type = emotion.disgust;
    if (_category == tone.resentful) {
      this.colors = '#1b4332';
    }
    else if (_category == tone.shameful) {
      this.colors = '#2d6a4f';
    }
    else if (_category == tone.bitter) {
      this.colors = '#40916c';
    }
    else if (_category == tone.disappointed) {
      this.colors = '#52b788';
    }
    else if (_category == tone.averse) {
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