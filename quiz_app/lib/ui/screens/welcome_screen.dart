import 'package:flutter/material.dart';
import 'package:quiz_app/ui/widgets/app_button.dart';

const quizLogo = "assets/quiz-logo.png";

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onStart;

  const WelcomeScreen({super.key, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(quizLogo, width: 400, height: 400),
            AppButton("Start Quiz", onTap: onStart),
          ],
        ),
      ),
    );
  }
}
