import 'package:flutter_appchatbot/class/Emotion.dart';
class Love extends Emotion{
  tone category;

  Love(tone category) : super.empty(){
    super.category = category;
    this.type = emotion.love;
    this.mothercolors = '#FF5A91';
    if (category == tone.accepted) {
      this.colors = '#F0C9D6';
    }
    else if (category == tone.gentle) {
      this.colors = '#E0A6BA';
    }
    else if (category == tone.affectionate) {
      this.colors = '#CF7895';
    }
    else if (category == tone.passionate) {
      this.colors = '#E05885';
    }
    else if (category == tone.trusted) {
      this.colors = '#F74882';
    }
    else if (category == tone.contentment) {
      this.colors = '#B5003C';
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
    return 'assets/smiling_face_with_heart_eyes.gif';
  }


}