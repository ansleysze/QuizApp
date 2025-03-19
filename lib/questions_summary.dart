import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                children: [
                  Container(
                    width: 30,  // Circle size
                    height: 30, // Circle size
                    alignment: Alignment.center, // Centers the number inside
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue, // Background color of the circle
                    ),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10), 
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, 
                      children: [
                        Text(
                          data['question'] as String,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,decoration: TextDecoration.none,color: Colors.white),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Your Answer: ${data['user_answer']}',
                          style: const TextStyle(fontSize: 20, color: Colors.red,decoration: TextDecoration.none),
                        ),
                        Text(
                          'Correct Answer: ${data['correct_answer']}',
                          style: const TextStyle(fontSize: 20, color: Colors.green,decoration: TextDecoration.none),
                          
                        ),
                        const SizedBox(height: 10), 
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
