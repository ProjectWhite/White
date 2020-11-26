import 'package:flutter_appchatbot/class/Emotion.dart';
class Fear extends Emotion {
  tone category;

  Fear(tone category) : super.empty() {
    super.category = category;
    this.type = emotion.fear;
    this.mothercolors = '#7209B7';

    if (category == tone.embarrassed) {
      this.colors = '#A85ADB';
    }
    else if (category == tone.vulnerable) {
      this.colors = '#9C48D4';
    }
    else if (category == tone.rejected) {
      this.colors = '#9E36E3';
    }
    else if (category == tone.insecure) {
      this.colors = '#5A2280';
    }
    else if (category == tone.worried) {
      this.colors = '#4B186E';
    }
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
    return 'assets/face_screaming_in_fear.gif';
  }
}