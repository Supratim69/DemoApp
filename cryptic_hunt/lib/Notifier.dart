import 'package:cryptic_hunt/data/ExampleData.dart';
import 'package:flutter/material.dart';

class QuestionProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  List<String> _currentQuestion = Questions;
  String get currentQuestion => _currentQuestion[_currentIndex];

  void nextQuestion() {
    if (_currentIndex < Questions.length - 1) {
      _currentIndex++;
      notifyListeners();
    }
  }

  void previousQuestion() {
    if (_currentIndex > 0) {
      _currentIndex--;
      notifyListeners();
    }
  }
}
