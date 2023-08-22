import 'package:cryptic_hunt/data/ExampleData.dart';
import 'package:flutter/material.dart';

class QuestionProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  List<String> _currentQuestion = Questions;
  String get currentQuestion => _currentQuestion[currentIndex];

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

  var _currentSolvers = Solvers;
  int get currentSolvers => _currentSolvers[_currentIndex].length;

  firstBlood() {
    if (currentSolvers == 0) {
      return const SizedBox(
        height: 20,
        width: 20,
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(5))),
        ),
      );
    } else {
      return Text("Teams Solved : ${currentSolvers}");
    }
  }
}
