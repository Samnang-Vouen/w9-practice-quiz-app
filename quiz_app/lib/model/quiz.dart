import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Question {
  final String id;
  final String title;
  final List<String> choices;
  final String goodChoice;

  Question({
    required this.title,
    required this.choices,
    required this.goodChoice,
  }) : id = uuid.v4();
}

class Answer {
  final String id;
  final String answerChoice;
  final Question question;

  Answer({required this.answerChoice, required this.question}) : id = uuid.v4();

  bool isGood() {
    return answerChoice == question.goodChoice;
  }
}

class Quiz {
  final String id;
  final List<Question> questions;
  final List<Answer> answers = [];

  Quiz({required this.questions}) : id = uuid.v4();

  void addAnswer(Answer answer) {
    answers.add(answer);
  }

  int getScore() {
    int totalScore = 0;

    for (Answer answer in answers) {
      if (answer.isGood()) {
        totalScore++;
      }
    }
    return totalScore;
  }
}
