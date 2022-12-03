import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

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

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('Antwort gewählt!');
  }

  var questions = [
    {
      'question': 'Ist ein Zebra schwarz oder weiß?',
      'answers': ['schwarz', 'weiß']
    },
    {
      'question': 'Wie alt ist die Sphinx?',
      'answers': ['4000 Jahre', '6000 Jahre', 'über 8000 Jahre']
    },
    {
      'question': 'Wer waren die Langobarden?',
      'answers': ['Ameisenbären', 'Indogermaner', 'Griechische Historiker']
    },
    {
      'question': 'Was sind die ersten 3 Werte von Pi?',
      'answers': ['3,12', '3,14', '3,44']
    }
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Quiz APP")),
        body: Column(
          children: <Widget>[
            Question(
              questions[_questionIndex]['question'] as String,
            ),
            ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
