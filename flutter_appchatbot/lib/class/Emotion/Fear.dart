import 'package:flutter_appchatbot/class/Emotion.dart';
class Fear extends Emotion{
  tone category;

  Fear(tone category) : super.empty(){
    super.category = category;
    this.type = emotion.fear;
    if (category == tone.embarrassed) {
      this.colors = '#1b4332';
    }
    else if (category == tone.vulnerable) {
      this.colors = '#2d6a4f';
    }
    else if (category == tone.rejected) {
      this.colors = '#40916c';
    }
    else if (category == tone.insecure) {
      this.colors = '#52b788';
    }
    else if (category == tone.worried) {
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