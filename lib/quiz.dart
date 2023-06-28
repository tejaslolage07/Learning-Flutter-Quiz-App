import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen; // Here, the pointer to
  // // the switchScreen widget is passed: without parantheses because if parantheses
  // // are added, the function would get executed everytime the current line of code
  // // is executed. We instead want to execute the function when the button is pressed
  // // inside StartScreen.

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  // Instead of storing the whole function value for which we are compelled to write an init method, we can use an identifier for the functions:
  var activeScreen = 'start-screen';
  List<String> selectedAnswers =
      []; // We can append the selected answers to this list with final.

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length < questions.length) {
      setState(() {
        activeScreen = 'questions-screen';
      });
    } else {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final Widget screenWidget = activeScreen == 'start-screen'
    //     ? StartScreen(switchScreen)
    //     : const QuestionsScreen();
    Widget screenWidget = StartScreen(switchScreen);

    void restartQuiz() {
      setState(() {
        selectedAnswers = [];
        activeScreen = 'questions-screen';
      });
    }

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    } else if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        selectedAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 72, 0, 196),
                Color.fromARGB(255, 127, 93, 187)
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
