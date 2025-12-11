import 'package:flutter/material.dart';
import 'package:quiz_app/data/quiz_mock_repository.dart';
import 'package:quiz_app/ui/screens/question_screen.dart';
import 'package:quiz_app/ui/screens/result_screen.dart';
import 'package:quiz_app/ui/screens/welcome_screen.dart';

enum Screens { welcome, question, result }

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  Screens currentScreen = Screens.welcome;

  void goToQuestionScreen() {
    setState(() {
      currentScreen = Screens.question;
    });
  }

  void goToResultScreen() {
    setState(() {
      currentScreen = Screens.result;
    });
  }

  void backToQuestion() {
    setState(() {
      currentScreen = Screens.question;
      quizData.answers.clear();
    });
  }

  void backToHome() {
    setState(() {
      currentScreen = Screens.welcome;
      quizData.answers.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget homeWidget;

    switch (currentScreen) {
      case Screens.welcome:
        homeWidget = WelcomeScreen(onStart: goToQuestionScreen);
        break;
      case Screens.question:
        homeWidget = QuestionScreen(
          quiz: quizData,
          onFinishQuiz: goToResultScreen,
          key: UniqueKey(),
        );
        break;
      case Screens.result:
        homeWidget = ResultScreen(
          onRestart: backToQuestion,
          onReturn: backToHome,
          quiz: quizData,
        );
        break;
    }

    return MaterialApp(debugShowCheckedModeBanner: false, home: homeWidget);
  }
}
