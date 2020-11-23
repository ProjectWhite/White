import 'package:flutter_appchatbot/class/Emotion.dart';
class Happy extends Emotion{
  tone category;
  Happy(tone category) : super.empty(){
    super.category = category;
    this.type = emotion.happy;
    if (category == tone.confident) {
      this.colors = '#1b4332';
    }
    else if (category == tone.grateful) {
      this.colors = '#2d6a4f';
    }
    else if (category == tone.peaceful) {
      this.colors = '#40916c';
    }
    else if (category == tone.excited) {
      this.colors = '#52b788';
    }
    else if (category == tone.playful) {
      this.colors = '#74c69d';
    }
    else if (category == tone.relief) {
      this.colors = '#74c69d';
    }
    else if (category == tone.pride) {
      this.colors = '#74c69d';
    }
    else if (category == tone.satisfaction) {
      this.colors = '#74c69d';
    }
    else if (category == tone.triumph) {
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