import 'package:flutter_appchatbot/class/Emotion.dart';
class Sad extends Emotion{
  tone category;

  Sad(tone category) : super.empty(){
    super.category = category;
    this.type = emotion.sad;
    if (category == tone.inadequate) {
      this.colors = '#1b4332';
    }
    else if (category == tone.uninterested) {
      this.colors = '#2d6a4f';
    }
    else if (category == tone.lonely) {
      this.colors = '#40916c';
    }
    else if (category == tone.guilty) {
      this.colors = '#52b788';
    }
    else if (category == tone.hurt) {
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