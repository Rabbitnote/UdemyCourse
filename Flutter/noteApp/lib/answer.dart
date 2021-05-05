import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  String answerText;
  Answer(this.selectHandler,this.answerText);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: RaisedButton(
          color:Colors.blue[200],
          textColor: Colors.white,
          padding:EdgeInsets.all(20),
          child: Text(answerText),
          onPressed: selectHandler,
        ));
  }
}
