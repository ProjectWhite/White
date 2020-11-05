import 'package:flutter_appchatbot/class/Emotion.dart';
enum tone {
  accepted,gentle,affectionate,passionate,trusted,pride,contentment
}
class Love extends Emotion{
  tone _category;

  Love(tone category) : super.empty(){
    this._category = category;
    this.type = emotion.love;
    if (_category == tone.accepted) {
      this.colors = '#1b4332';
    }
    else if (_category == tone.gentle) {
      this.colors = '#2d6a4f';
    }
    else if (_category == tone.affectionate) {
      this.colors = '#40916c';
    }
    else if (_category == tone.passionate) {
      this.colors = '#52b788';
    }
    else if (_category == tone.trusted) {
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