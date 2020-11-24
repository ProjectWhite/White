import 'package:flutter_appchatbot/class/Emotion.dart';
class Happy extends Emotion{
  tone category;
  Happy(tone category) : super.empty(){
    super.category = category;
    this.mothercolors = '#FFB600';
    this.type = emotion.happy;
    if (category == tone.confident) {
      this.colors = '#E3AC22';
    }
    else if (category == tone.grateful) {
      this.colors = '#B88A16';
    }
    else if (category == tone.peaceful) {
      this.colors = '#D9B762';
    }
    else if (category == tone.excited) {
      this.colors = '#DBA00B';
    }
    else if (category == tone.playful) {
      this.colors = '#967111';
    }
    else if (category == tone.relief) {
      this.colors = '#E0B546';
    }
    else if (category == tone.pride) {
      this.colors = '#8C7438';
    }
    else if (category == tone.satisfaction) {
      this.colors = '#FAB70C';
    }
    else if (category == tone.triumph) {
      this.colors = '#FCC53A';
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