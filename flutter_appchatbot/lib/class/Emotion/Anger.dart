import 'package:flutter_appchatbot/class/Emotion.dart';

class Anger extends Emotion{
  tone category;

  Anger(tone category) : super.empty(){
    super.category = category;
    this.type = emotion.anger;
    this.mothercolors = '#B40000';
    if (category == tone.annoyed) {
      this.colors = '#DB4B4B';
    }
    else if (category == tone.frustrated) {
      this.colors = '#994242';
    }
    else if (category == tone.offended) {
      this.colors = '#D42C2C';
    }
    else if (category == tone.mad) {
      this.colors = '#D11313';
    }
    else if (category == tone.threatened) {
      this.colors = '#A10202';
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