// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_quiz/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data/questions.dart';

class Question extends StatefulWidget {
  const Question(this.onSelectedAnwer, {super.key});
  final void Function(String) onSelectedAnwer;

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelectedAnwer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currenQuestion = questions[currentQuestionIndex];
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currenQuestion.text,
            style: GoogleFonts.lato(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 27),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          const SizedBox(
            height: 40,
          ),
          //[{1,2,3}4] =>[1,2,3,4]
          ...currenQuestion.getShuffedAnswer().map((e) {
            return Container(
              margin: const EdgeInsets.all(5),
              child: AnswerButton(
                answerText: e,
                onpressed: () {
                  answerQuestion(e);
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
