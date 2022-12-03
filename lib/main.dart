import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'question': 'Ist ein Zebra schwarz oder weiß?',
      'answers': [
        {'text': 'schwarz', 'score': 25},
        {'text': 'weiß', 'score': 0}
      ]
    },
    {
      'question': 'Wie alt ist die Sphinx?',
      'answers': [
        {'text': '4000 Jahre', 'score': 0},
        {'text': '6000 Jahre', 'score': 0},
        {'text': 'über 8000 Jahre', 'score': 25}
      ]
    },
    {
      'question': 'Wer waren die Langobarden?',
      'answers': [
        {'text': 'Ameisenbären', 'score': 0},
        {'text': 'Indogermaner', 'score': 25},
        {'text': 'Griechische Historiker', 'score': 0}
      ]
    },
    {
      'question': 'Was sind die ersten 3 Werte von Pi?',
      'answers': [
        {'text': '3,12', 'score': 0},
        {'text': '3,14', 'score': 25},
        {'text': '3,44', 'score': 0}
      ]
    }
  ];

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Quiz APP")),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
