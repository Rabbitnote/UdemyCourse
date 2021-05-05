import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'title',
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('FormAPP'),
            ),
            body: FormText()));
  }
}

class FormText extends StatefulWidget {
  @override
  _FormTextState createState() => _FormTextState();
}

class _FormTextState extends State<FormText> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Dialog Submit'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Hello Your Name is : ${enteredTitle}'),
                Text('Your UserId is : ${enteredAmount}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                controller: titleController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some Name';
                  }
                  return null;
                }),
            TextFormField(
              decoration: InputDecoration(labelText: 'UserID'),
              controller: amountController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Center(
              child: FlatButton(
                child: Text('Submit'),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a Snackbar.
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')));
                        _submitData();
                  }
                  
                },
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
