import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final VoidCallback resetHandler;
  Result(this.resetHandler);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Text('Quiz beendet! Punktzahl: '),
        BackButton(onPressed: resetHandler,)
      ],),
    );
  }
}
