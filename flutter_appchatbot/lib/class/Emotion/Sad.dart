import 'package:flutter_appchatbot/class/Emotion.dart';
class Sad extends Emotion{
  tone category;

  Sad(tone category) : super.empty(){
    super.category = category;
    this.mothercolors = '#3F37C9';
    this.type = emotion.sad;
    if (category == tone.inadequate) {
      this.colors = '#7771F5';
    }
    else if (category == tone.uninterested) {
      this.colors = '#5D57D4';
    }
    else if (category == tone.lonely) {
      this.colors = '#4F48E0';
    }
    else if (category == tone.guilty) {
      this.colors = '#554CFC';
    }
    else if (category == tone.hurt) {
      this.colors = '#312E69';
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