import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var _counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Current Count: $_counter"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _counter--;
                        });
                      },
                      child: Text("Pass"),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _counter++;
                        });
                      },
                      child: Text("Answered"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Question {
  bool _answered = false;
  final String _questionText;
  String? _answerText;

  bool get isAnswered => _answered;
  String get questionText => _questionText;
  String? get answerText => _answerText;

  Question(this._questionText);
  void answer(String answer) {
    if (!_answered) {
      _answerText = answer;
      _answered = true;
    }
  }
}

class QuestionsList {
  var questions = <Question>{};

  QuestionsList(Set<Question>? questions) {
    if (questions != null) {
      this.questions.addAll(questions);
    }
  }

  Question getRandomQuestion() {
    final random = Random();
    Question randomQuestion;
    do {
      randomQuestion = questions.toList()[random.nextInt(questions.length)];
    } while (randomQuestion.isAnswered);

    return randomQuestion;
  }
}
