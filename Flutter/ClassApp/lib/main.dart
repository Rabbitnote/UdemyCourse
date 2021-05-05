import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var wordPair = WordPair.random();
    return MaterialApp(
        title: 'Welcome to Flutter',
        home: Scaffold(
          body: Center(
            child: RandomWords(),
          ),
        ));
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFontt = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    var wordPair = WordPair.random();
    return Scaffold(
        appBar: AppBar(
          title: Text('Welcom to Random Word'),
        ),
        body:_buildSuggestions(),
        );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: EdgeInsets.all(20),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2;

        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(pair.asPascalCase, style: _biggerFontt),
    );
  }
}
