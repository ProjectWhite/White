import 'package:flutter_appchatbot/class/Emotion.dart';
class Disgust extends Emotion{
  tone category;

  Disgust(tone category) : super.empty(){
    super.category = category;
    this.mothercolors = '#007A00';
    this.type = emotion.disgust;
    if (category == tone.resentful) {
      this.colors = '#23A123';
    }
    else if (category == tone.shameful) {
      this.colors = '#3FA63F';
    }
    else if (category == tone.bitter) {
      this.colors = '#35B835';
    }
    else if (category == tone.disappointed) {
      this.colors = '#16B516';
    }
    else if (category == tone.averse) {
      this.colors = '#306E30';
    }
    else if (category == tone.contempt) {
      this.colors = '#034503';
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


}