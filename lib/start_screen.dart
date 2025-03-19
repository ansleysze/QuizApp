import 'package:flutter/material.dart';
//starting screen or landing page

class StartScreen extends StatelessWidget {

  const StartScreen(this.startQuiz ,{super.key});

  final void Function() startQuiz;
  //call startquiz void to build and if called again will change page

  @override
  Widget build(context) {
    return  Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.7,
            child: Image.asset('assets/images/quiz-logo.png', width: 300,color: Colors.yellow,)),
          const SizedBox(height: 80),
          const Text(
            'QuizApp',
            style: TextStyle(
              color: Colors.white,           
              fontSize: 24,
              decoration: TextDecoration.none
            ),
            ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed:startQuiz,
              style: OutlinedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 255, 255, 255)
            ),
            icon: const Icon(Icons.arrow_right_alt_sharp),
            label: const Text("Start Quiz"))
        ],
      ),
    );
  }
}
