// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(  { 
    super.key, required this.answerText, required this.onpressed});

  final String answerText;
  final void Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(onPressed: onpressed,
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.deepPurple[900],
      padding: EdgeInsets.symmetric(vertical: 10,
      horizontal: 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))
    ),
    child:  Text(answerText));
  }
}
