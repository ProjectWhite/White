import 'package:flutter_appchatbot/class/Emotion.dart';
class Love extends Emotion{
  tone category;

  Love(tone category) : super.empty(){
    super.category = category;
    this.type = emotion.love;
    if (category == tone.accepted) {
      this.colors = '#1b4332';
    }
    else if (category == tone.gentle) {
      this.colors = '#2d6a4f';
    }
    else if (category == tone.affectionate) {
      this.colors = '#40916c';
    }
    else if (category == tone.passionate) {
      this.colors = '#52b788';
    }
    else if (category == tone.trusted) {
      this.colors = '#74c69d';
    }
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