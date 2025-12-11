import 'package:quiz_app/model/quiz.dart';

Quiz quizData = Quiz(
  questions: [
    Question(
      title: "Who is the best teacher?",
      choices: ["Ronan", "Hongly", "Leangsiv"],
      goodChoice: "Ronan",
    ),
    Question(
      title: "What is the best color?",
      choices: ["Blue", "Red", "Green"],
      goodChoice: "Blue",
    ),
    Question(
      title: "Which is the best SE group?",
      choices: ["G1", "G2", "G3", "G4"],
      goodChoice: "G2",
    ),
  ],
);
