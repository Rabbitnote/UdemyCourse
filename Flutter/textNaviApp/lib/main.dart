

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/detail01': (context) => DetailOne(),
        '/detail02': (context) => DetailTwo(),
        'error': (context) => ErrorPage(),
      },
      home: Scaffold(
        appBar: AppBar(title:Text('Home')),
        body: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

final titleController = TextEditingController();
void _sumbitData(context) {
  final enteredTitle = titleController.text;
  if (enteredTitle == 'text01') {
    Navigator.pushNamed(context, '/detail01');
  } else if (enteredTitle == 'text02') {
    Navigator.pushNamed(context, '/detail02');
  } else {
    Navigator.pushNamed(context, 'error');
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: 20,),
          TextFormField(
              decoration: InputDecoration(labelText: 'Enter Text01 or Texxt02'),
              controller: titleController,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              }),
              SizedBox(height: 20,),
          Center(
            child: FlatButton(
              child: Text('Go'),
              onPressed: () => _sumbitData(context),
              color: Colors.blue,
              textColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class DetailOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(title: Text('Detail01'),),
          body: Column(
             mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'text01',
              textAlign: TextAlign.center,
            ),
          ),
          TextButton(
            child: Text('Back'),
            onPressed: (){
              Navigator.pop(context);
              },
          )
        ],
      ),
    );
  }
}
class DetailTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(title: Text('Detail02'),),
          body: Column(
             mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'text02',
              textAlign: TextAlign.center,
            ),
          ),
          TextButton(
            child: Text('Back'),
            onPressed: (){
              Navigator.pop(context);
              },
          )
        ],
      ),
    );
  }
}
class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(title: Text('ErrorPage'),),
          body: Column(
             mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Error 404',
              textAlign: TextAlign.center,
            ),
          ),
          TextButton(
            child: Text('Back'),
            onPressed: (){
              Navigator.pop(context);
              },
          )
        ],
      ),
    );
  }
}


