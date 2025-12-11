import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz.dart';
import 'package:quiz_app/ui/widgets/app_button.dart';

class ResultScreen extends StatelessWidget {
  final VoidCallback onRestart;
  final VoidCallback onReturn;
  final Quiz quiz;

  const ResultScreen({
    super.key,
    required this.onRestart,
    required this.onReturn,
    required this.quiz,
  });

  @override
  Widget build(BuildContext context) {
    final totalQuestion = quiz.questions.length;
    final score = quiz.getScore();

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "You answered $score on $totalQuestion!",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),

            SizedBox(height: 50),

            Expanded(
              child: ListView.separated(
                itemCount: totalQuestion,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 30),
                itemBuilder: (context, index) {
                  final List<Color> colors = [
                    Colors.lightGreen,
                    Colors.red,
                    Colors.orange,
                  ];
                  final color = colors[index % colors.length];
                  final question = quiz.questions[index];
                  final answer = quiz.answers[index];

                  return Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: color,
                            foregroundColor: Colors.white,
                            child: Text(
                              "${index + 1}",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),

                          SizedBox(width: 10),

                          Text(
                            question.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 60),
                        child: Column(
                          children: question.choices.map((choice) {
                            final bool isSelected =
                                choice == answer.answerChoice;
                            final bool isCorrect =
                                choice == question.goodChoice;

                            return Row(
                              children: [
                                Icon(isCorrect ? Icons.check : null),

                                SizedBox(width: 10),

                                Text(
                                  choice,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: isSelected ? color : Colors.black,
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            Column(
              children: [
                AppButton("Restart Quiz", onTap: onRestart),

                SizedBox(height: 20),

                AppButton("Return Home", onTap: onReturn),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
