import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => HomeScreen(),
        '/secondScreen':(context) => SecondScreen(),
      },
        home: Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: HomeScreen(),
    ));
  }
}
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children:[
      Center(
        child: TextButton(child: Text('Screen One'),
        onPressed:(){
          Navigator.pushNamed(context, '/secondScreen');
        }
        ,),
      )
    ]
      
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Screen One')),
          body: Column(
        children: [
          Center(
            child: Text('Welcome to Navigator App'),     
          ),
          TextButton(child: Text('Pop'),onPressed: (){
            Navigator.pop(context);
          },)
        ],
      ),
    );
  }
}
