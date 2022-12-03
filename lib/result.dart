import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore == 25) {
      resultText = 'Eine Frage war richtig!';
    } else if (resultScore == 50) {
      resultText = 'Zwei Fragen waren richtig!';
    } else if (resultScore == 75) {
      resultText = 'Drei Fragen waren richtig!';
    } else if (resultScore == 100) {
      resultText = 'Volle Punktzahl!';
    } else {
      resultText = ':(';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            resultPhrase + ' ' + resultScore.toString() + '/100 Punkte',
            style: TextStyle(fontSize: 20),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: ElevatedButton(
              child: Text('reset Quiz'),
              onPressed: resetHandler,
            ),
          )
        ],
      ),
    ));
  }
}
