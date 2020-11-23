import 'package:flutter_appchatbot/class/Emotion.dart';
class Surprise extends Emotion{
  tone category;

  Surprise(tone category) : super.empty(){
    super.category = category;
    this.type = emotion.surprise;
    if (category == tone.startled) {
      this.colors = '#1b4332';
    }
    else if (category == tone.overwhelmed) {
      this.colors = '#2d6a4f';
    }
    else if (category == tone.confused) {
      this.colors = '#40916c';
    }
    else if (category == tone.amazed) {
      this.colors = '#52b788';
    }
    else if (category == tone.shocked) {
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