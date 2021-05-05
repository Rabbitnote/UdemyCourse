import 'package:flutter/material.dart';
import './components/Logo.dart';
import './components/LaunchScreen.dart';

void main() => runApp(
      MaterialApp(
        home: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LaunchScreen()),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    final animation =
        Tween(begin: 0.0, end: 1.0).animate(_animationController);
    return Scaffold(
      backgroundColor: Color(0xFFFFF9EE),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
        FadeTransition(
          opacity: animation,
          child: Logo(),
        ),
      ]),
    );
  }
}
