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
  static const _question = [
    {
      'questionText': 'What\'s my name?',
      'answer': [
        {'Text': 'Note', 'score': 10},
        {'Text': 'John', 'score': 0},
        {'Text': 'Mark', 'score': 0},
        {'Text': 'Mix', 'score': 0}
      ]
    },
    {
      'questionText': 'What\'s my favorite movie?',
      'answer': [
        {'Text': 'Tenet', 'score': 10},
        {'Text': 'Starwar', 'score': 5},
        {'Text': 'Call', 'score': 2},
        {'Text': 'Jurrasic World', 'score': 20}
      ]
    },
    {
      'questionText': 'What\'s my favorite Color?',
      'answer': [
        {'Text': 'Blue', 'score': 10},
        {'Text': 'Red', 'score': 0},
        {'Text': 'Green', 'score': 0},
        {'Text': 'Yellow', 'score': 0}
      ]
    },
    {
      'questionText': 'What\'s my favorite drink?',
      'answer': [
        {'Text': 'Soda', 'score': 20},
        {'Text': 'Coffee', 'score': 10},
        {'Text': 'Green tea', 'score': 5},
        {'Text': 'Mocha', 'score': 20}
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0; 
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print('Answer');
    print(_questionIndex);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Note App'),
        ),
        body: _questionIndex < _question.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                question: _question,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
