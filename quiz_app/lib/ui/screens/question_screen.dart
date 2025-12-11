import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz.dart';
import 'package:quiz_app/ui/widgets/app_button.dart';

class QuestionScreen extends StatefulWidget {
  final Quiz quiz;
  final VoidCallback onFinishQuiz;

  const QuestionScreen({
    super.key,
    required this.quiz,
    required this.onFinishQuiz,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int questionIndex = 0;

  void selectedChoice(String choice) {
    final question = widget.quiz.questions[questionIndex];

    widget.quiz.addAnswer(Answer(answerChoice: choice, question: question));

    if (questionIndex < widget.quiz.questions.length - 1) {
      setState(() {
        questionIndex++;
      });
    } else {
      widget.onFinishQuiz();
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.quiz.questions[questionIndex];

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Center(
              child: Text(
                currentQuestion.title,
                style: TextStyle(color: Colors.white, fontSize: 36),
              ),
            ),

            const SizedBox(height: 50),

            Expanded(
              child: ListView.separated(
                itemCount: currentQuestion.choices.length,
                itemBuilder: (context, index) {
                  final choices = currentQuestion.choices[index];
                  return AppButton(
                    choices,
                    onTap: () => selectedChoice(choices),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
