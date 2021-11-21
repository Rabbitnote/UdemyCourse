import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 500,
        child: Row(children: [
          Material(child: Chip(onDeleted: () {}, label: Text('I'))),
          Material(child: Chip(onDeleted: () {}, label: Text('really'))),
          Material(child: Chip(onDeleted: () {}, label: Text('really'))),
          Material(child: Chip(onDeleted: () {}, label: Text('really'))),
          Material(child: Chip(onDeleted: () {}, label: Text('really'))),
          Material(child: Chip(onDeleted: () {}, label: Text('really'))),
          Material(child: Chip(onDeleted: () {}, label: Text('really'))),
          Material(child: Chip(onDeleted: () {}, label: Text('need'))),
          Material(child: Chip(onDeleted: () {}, label: Text('a'))),
          Material(child: Chip(onDeleted: () {}, label: Text('job'))),
        ]));
  }
}

class Recipe {
  int _cows;
  int _trampolines;

  Recipe(this._cows, this._trampolines);

  int makeMilkshake() => _cows + _trampolines;
}

final fishStream = FishHatchery().stream;

// salmon, trout, trout, salmon, ...
class FishHatchery {
  String get stream {
    List<String> fishList = ["Salmon", "Trout", "Trout", "Salmon"];
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Playground',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyWidget(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var _answer = '';
  bool checkValue = false;
  bool checkValue2 = false;
  void submitForm(answer) {
    setState(() {
      _answer += answer + " ";
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final textController = TextEditingController();
    void _showErrorDialog() {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                content: Container(
                  height: 200,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text('Please type something'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 1000,
                          alignment: Alignment.center,
                          child: TextButton(
                            child: const Text(
                              'Okay',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.green),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ]),
                ),
              ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              child: Form(
                key: _formKey,
                child: TextFormField(
                  onEditingComplete: () {
                    setState(() {
                      _answer = textController.text;
                    });
                  },
                  controller: textController,
                  validator: (value) {
                    if (value == '') {
                      _showErrorDialog();
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Type Something'),
                ),
              ),
              padding: const EdgeInsets.all(20),
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: TextButton(
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      submitForm(textController.text);
                    }
                  },
                ),
              ),
            ]),
            Text('$_answer'),
            CheckboxListTile(
              value: checkValue,
              title: Text('Hello'),
              onChanged: (value) {
                setState(() {
                  checkValue = !checkValue;
                  print(checkValue);
                });
              },
            ),
            CheckboxListTile(
              value: checkValue2,
              title: const Text('Nice'),
              onChanged: (value) {
                setState(() {
                  checkValue2 = !checkValue2;
                  print(checkValue2);
                });
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
