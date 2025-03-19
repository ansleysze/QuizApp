import 'package:flutter/material.dart';
import 'package:quizapp/answer_button.dart';
import 'package:quizapp/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class Questionscreen extends StatefulWidget {
  const Questionscreen({super.key,required this.onSelectAnswer,});

  final void Function(String answer) onSelectAnswer;

  @override
  State<Questionscreen> createState() {
    return _QuestionsscreenState();
  }
}

class _QuestionsscreenState extends State<Questionscreen> {

  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    }); 
  
  }


  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions [currentQuestionIndex];

    return  SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Text
          (
            currentQuestion.text, 
            style: GoogleFonts.playfairDisplay(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none
                
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ...currentQuestion.getShuffledAnswers().map((answer) {
            return AnswerButton(
              answerTest: answer, onTap: (){
                  answerQuestion(answer);
              },
            );
          })
        ],),
      ),
    );
  }
}
