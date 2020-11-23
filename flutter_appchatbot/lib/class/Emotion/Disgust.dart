import 'package:flutter_appchatbot/class/Emotion.dart';
class Disgust extends Emotion{
  tone category;

  Disgust(tone category) : super.empty(){
    super.category = category;
    this.mothercolors = 'gggg';
    this.type = emotion.disgust;
    if (category == tone.resentful) {
      this.colors = '#1b4332';
    }
    else if (category == tone.shameful) {
      this.colors = '#2d6a4f';
    }
    else if (category == tone.bitter) {
      this.colors = '#40916c';
    }
    else if (category == tone.disappointed) {
      this.colors = '#52b788';
    }
    else if (category == tone.averse) {
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