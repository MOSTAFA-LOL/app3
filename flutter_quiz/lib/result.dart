// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable, non_constant_identifier_names, unused_import

import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/summary.dart';

class Result extends StatelessWidget {
  const Result(this.selectedAnswers, this.restart, {super.key,});

  final List<String> selectedAnswers;
  final void Function() restart;

  get _summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var numOfCorrectAnwsers = _summaryData
        .where((element) => element['user_answar'] == element['correct_answar'])
        .length;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ('you answared $numOfCorrectAnwsers out of ${questions.length} questions correctly!'),
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Summary(_summaryData),
            const SizedBox(
              height: 40,
            ),
            TextButton.icon(
                onPressed: restart,
                icon: const Icon(
                  Icons.restart_alt_outlined,
                  color: Color.fromARGB(255, 247, 245, 245),
                ),
                label: const Text(
                  'Restart Quiz!',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 247, 245, 245),
                    fontWeight: FontWeight.bold,
                  ),
                ))
          ]),
    );
  }
}
