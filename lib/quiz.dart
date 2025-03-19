import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/questionscreen.dart';
import 'package:quizapp/start_screen.dart';
import 'package:quizapp/results_screen.dart';

//quiz page dart
class Quiz extends StatefulWidget{
  const Quiz({super.key});


  @override
  //added states so we can change the landing page to this one
  State<Quiz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = []; 
      activeScreen = 'start-screen'; 
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length){
      
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

   @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = Questionscreen(
        onSelectAnswer: chooseAnswer,
        );
    }

    if (activeScreen == 'results-screen') {
      screenWidget =  ResultsScreen(chosenAnswers: selectedAnswers, onRestart: restartQuiz,);
    }

     
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors:[
            Color.fromARGB(255, 82, 44, 146),
            Color.fromARGB(255, 103, 28, 232)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
            )
          ),
        child: screenWidget,         
      ),
    );
  }
}