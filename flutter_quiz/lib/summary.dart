import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  const Summary(this.summaryData,{super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ 
        ...summaryData.map((e) => Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor:
                              e['user_answer'] == e['correct_answer']
                                  ? Colors.blueGrey
                                  : Colors.red[300],
                          child: Text(
                            ((e['question_index'] as int) + 1).toString(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          e['question'].toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          e['correct_answer'].toString(),
                          style: const TextStyle(
                            color: Color.fromARGB(85, 255, 255, 255),
                          ),
                        ),
                        Text(
                          e['user_answer'].toString(),
                          style: const TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
        ),
        )
      ],
    );
      
      
  
      }
      }
            
