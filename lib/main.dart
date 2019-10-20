import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'white', 'score': 20},
        {'text': 'Red', 'score': 30},
        {'text': 'Blue', 'score': 40}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal',
      'answers': [
        {'text': 'Cat', 'score': 10},
        {'text': 'Dog', 'score': 20},
        {'text': 'snake', 'score': 30},
        {'text': 'Rabbit', 'score': 40}
      ],
    },
    {
      'questionText': 'What\'s your favorite place',
      'answers': [
        {'text': 'Tehran', 'score': 10},
        {'text': 'Tabriz', 'score': 20},
        {'text': 'Isfahan', 'score': 30},
        {'text': 'Mashhad', 'scoere': 40},
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void resetHandler() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = score + _totalScore;
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app!'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore,resetHandler),
      ),
    );
  }
}
