import 'package:flutter/material.dart';

class Option {
  Icon icon;
  String title;
  String subtitle;

  Option({this.icon, this.title, this.subtitle});
}

final options = [
  Option(
    icon: Icon(Icons.question_answer, size: 40.0),
    title: 'Question One ',
    subtitle: 'You just ......',
  ),
  Option(
    icon: Icon(Icons.question_answer, size: 40.0),
    title: 'Question Two',
    subtitle: 'You just ......',
  ),
  Option(
    icon: Icon(Icons.question_answer_outlined, size: 40.0),
    title: 'Question Three',
    subtitle: 'You just ......',
  ),
  Option(
    icon: Icon(Icons.question_answer_outlined, size: 40.0),
    title: 'Question Four',
    subtitle: 'You just ......',
  ),
  Option(
    icon: Icon(Icons.question_answer_outlined, size: 40.0),
    title: 'Question Five',
    subtitle: 'You just ......',
  ),

];