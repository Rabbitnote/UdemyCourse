import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultscore;
  final Function resetQuiz;
  String get resultPhase {
    var resultText = 'Your did it';
    if (resultscore <= 10) {
      resultText = 'Ok';
    } else if (resultscore > 10) {
      resultText = 'Awesome';
    } else {
      resultText = 'No';
    }
    return resultText;
  }

  Result(this.resultscore,this.resetQuiz);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      Text(resultPhase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center),
      FlatButton(child:Text('Reset Quiz'),onPressed:resetQuiz ,)
    ]));
  }
}
