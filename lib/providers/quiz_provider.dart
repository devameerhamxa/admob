import 'package:flutter/foundation.dart';
import 'package:flutter_admob/models/question_model.dart';

class QuizProvider with ChangeNotifier {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _isQuizCompleted = false;

  final List<Question> _questions = [
    Question(
      question: "What is the capital of France?",
      options: ["London", "Berlin", "Paris", "Madrid"],
      correctAnswerIndex: 2,
    ),
    Question(
      question: "Which planet is known as the Red Planet?",
      options: ["Venus", "Mars", "Jupiter", "Saturn"],
      correctAnswerIndex: 1,
    ),
    Question(
      question: "What is 2 + 2 - 8 * 6 / 8 ?",
      options: ["3", "-2", "5", "-6"],
      correctAnswerIndex: 1,
    ),
    Question(
      question: "Who painted the Mona Lisa?",
      options: ["Van Gogh", "Picasso", "Da Vinci", "Monet"],
      correctAnswerIndex: 2,
    ),
    Question(
      question: "What is the largest ocean on Earth?",
      options: ["Atlantic", "Indian", "Arctic", "Pacific"],
      correctAnswerIndex: 3,
    ),
  ];

  // Getters
  int get currentQuestionIndex => _currentQuestionIndex;
  int get score => _score;
  bool get isQuizCompleted => _isQuizCompleted;
  List<Question> get questions => _questions;
  Question get currentQuestion => _questions[_currentQuestionIndex];
  int get totalQuestions => _questions.length;

  void answerQuestion(int selectedIndex) {
    if (selectedIndex == currentQuestion.correctAnswerIndex) {
      _score++;
    }

    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
    } else {
      _isQuizCompleted = true;
    }

    notifyListeners();
  }

  void resetQuiz() {
    _currentQuestionIndex = 0;
    _score = 0;
    _isQuizCompleted = false;
    notifyListeners();
  }
}
