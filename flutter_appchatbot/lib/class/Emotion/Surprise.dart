import 'package:flutter_appchatbot/class/Emotion.dart';
class Surprise extends Emotion{
  tone category;

  Surprise(tone category) : super.empty(){
    super.category = category;
    this.type = emotion.surprise;
    this.mothercolors = '#FF4800';
    if (category == tone.startled) {
      this.colors = '#F76D36';
    }
    else if (category == tone.overwhelmed) {
      this.colors = '#FC5A19';
    }
    else if (category == tone.confused) {
      this.colors = '#DB480D';
    }
    else if (category == tone.amazed) {
      this.colors = '#873312';
    }
    else if (category == tone.shocked) {
      this.colors = '#A6593A';
    }
  }


  @override
  EmotionDetail() {
    // TODO: implement EmotionDetail
    throw UnimplementedError();
  }

  @override
  Emotioncolor() {
    // TODO: implement Emotioncolor
    return '$mothercolors';
    throw UnimplementedError();
  }

  @override
  Typecolor() {
    // TODO: implement Typecolor
    return '$colors';
    throw UnimplementedError();
  }
  @override
  String EmotionAmi() {
    // TODO: implement EmotionAmi
    return 'assets/hushed_face.gif';
  }


}