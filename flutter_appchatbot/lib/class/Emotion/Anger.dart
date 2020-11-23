import 'package:flutter_appchatbot/class/Emotion.dart';

class Anger extends Emotion{
  tone category;

  Anger(tone category) : super.empty(){
    super.category = category;
    this.type = emotion.anger;
    this.mothercolors = '#B40000';
    if (category == tone.annoyed) {
      this.colors = '#1b4332';
    }
    else if (category == tone.frustrated) {
      this.colors = '#2d6a4f';
    }
    else if (category == tone.offended) {
      this.colors = '#40916c';
    }
    else if (category == tone.mad) {
      this.colors = '#52b788';
    }
    else if (category == tone.threatened) {
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