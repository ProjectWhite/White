import 'package:flutter_appchatbot/class/Emotion.dart';

class Anger extends Emotion{
  tone category;

  Anger(tone category) : super.empty(){
    super.category = category;
    this.type = emotion.anger;
    this.mothercolors = '#B40000';
    if (category == tone.annoyed) {
      this.colors = '#994242';
    }
    else if (category == tone.frustrated) {
      this.colors = '#DB4B4B';
    }
    else if (category == tone.offended) {
      this.colors = '#D42C2C';
    }
    else if (category == tone.mad) {
      this.colors = '#AB1B1B';
    }
    else if (category == tone.threatened) {
      this.colors = '#9E1919';
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
    return 'assets/face_with_steam_from_nose.gif';
  }


}