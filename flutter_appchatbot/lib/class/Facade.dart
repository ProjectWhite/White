import 'package:flutter_appchatbot/class/Emotion.dart';
import 'package:flutter_appchatbot/class/Emotion/Anger.dart';
import 'package:flutter_appchatbot/class/Emotion/Disgust.dart';
import 'package:flutter_appchatbot/class/Emotion/Fear.dart';
import 'package:flutter_appchatbot/class/Emotion/Happy.dart';
import 'package:flutter_appchatbot/class/Emotion/Love.dart';
import 'package:flutter_appchatbot/class/Emotion/Sad.dart';
import 'package:flutter_appchatbot/class/Emotion/Surprise.dart';

class Facade {
  String theEmotion;
  String theType;
  String typecolor;
  String Emo;
  String start(int type,tone categoryin) {
    if (type == 1) {
      Anger x = new Anger(categoryin);
      theEmotion = x.toString1();
      theType = x.toString2();
      return x.Typecolor();
    }
    if (type == 2) {
      Disgust x = new Disgust(categoryin);
      theEmotion = x.toString1();
      theType = x.toString2();
      return x.Typecolor();
    }
    if (type == 3) {
      Fear x = new Fear(categoryin);
      theEmotion = x.toString1();
      theType = x.toString2();
      return x.Typecolor();
    }
    if (type == 4) {
      Happy x = new Happy(categoryin);
      theEmotion = x.toString1();
      theType = x.toString2();
      return x.Typecolor();
    }
    if (type == 5) {
      Love x = new Love(categoryin);
      theEmotion = x.toString1();
      theType = x.toString2();
      return x.Typecolor();
    }
    if (type == 6){
      Sad x = new Sad(categoryin);
      theEmotion = x.toString1();
      theType = x.toString2();
      return x.Typecolor();
    }
    if (type == 7){
      Surprise x = new Surprise(categoryin);
      theEmotion = x.toString1();
      theType = x.toString2();
      return x.Typecolor();
    }
  }

  String find(emotion emotionin,tone categoryin) {
    if (emotionin == emotion.anger) {
      Anger x = new Anger(categoryin);
      Emo = x.EmotionAmi();
      return x.Typecolor();
    }
    if (emotionin == emotion.disgust) {
      Disgust x = new Disgust(categoryin);
      Emo = x.EmotionAmi();
      return x.Typecolor();
    }
    if (emotionin == emotion.fear) {
      Fear x = new Fear(categoryin);
      Emo = x.EmotionAmi();
      return x.Typecolor();
    }
    if (emotionin == emotion.happy) {
      Happy x = new Happy(categoryin);
      Emo = x.EmotionAmi();
      return x.Typecolor();
    }
    if (emotionin == emotion.love) {
      Love x = new Love(categoryin);
      Emo = x.EmotionAmi();
      return x.Typecolor();
    }
    if (emotionin == emotion.sad) {
      Sad x = new Sad(categoryin);
      Emo = x.EmotionAmi();
      return x.Typecolor();
    }
    if (emotionin == emotion.surprise) {
      Surprise x = new Surprise(categoryin);
      Emo = x.EmotionAmi();
      return x.Typecolor();
    }
    if (emotionin == emotion.fine) {
      Emotion x = new Happy(categoryin);
      Emo = x.EmotionAmi();
      return x.Typecolor();
    }
  }

  String ecolorget(int type) {
    if (type == 1) {
      Anger x = new Anger(tone.fine);
      return x.Emotioncolor();
    }
    if (type == 2){
      Disgust x = new Disgust(tone.fine);
      return x.Emotioncolor();
    }
    if (type == 3){
      Fear x = new Fear(tone.fine);
      return x.Emotioncolor();
    }
    if (type == 4){
      Happy x = new Happy(tone.fine);
      return x.Emotioncolor();
    }
    if (type == 5){
      Love x = new Love(tone.fine);
      return x.Emotioncolor();
    }
    if (type == 6){
      Sad x = new Sad(tone.fine);
      return x.Emotioncolor();
    }
    if (type == 7) {
      Surprise x = new Surprise(tone.fine);
      return x.Emotioncolor();
    }
  }
}