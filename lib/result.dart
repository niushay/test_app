import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetHandler;

  String get resultPhrase {
    String resultText;
    if (totalScore < 50) {
      resultText = 'You are so bad!';
    } else if (totalScore > 50 && totalScore < 80) {
      resultText = 'You are good!';
    } else {
      resultText = 'You are amazing!';
    }
    return resultText;
  }

  Result(this.totalScore, this.resetHandler);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Text(resultPhrase,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurpleAccent)),
        FlatButton(child: Text('restart quiz!'), onPressed: resetHandler , textColor: Colors.deepOrange,)
      ]),
    );
  }
}
