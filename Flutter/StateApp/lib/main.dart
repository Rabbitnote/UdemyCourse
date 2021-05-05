import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Assignment'),
        ),
        body:Center( child:ParentWidget()),
      ),
    );
  }
}

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;
  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapBoxC(
        active: _active,
        onChanged: _handleTapBoxChanged,
      ),
    );
  }
}

class TapBoxC extends StatefulWidget {
  TapBoxC({this.active: false, @required this.onChanged});
  final bool active;
  final ValueChanged<bool> onChanged;
  @override
  _TapBoxCState createState() => _TapBoxCState();
}

class _TapBoxCState extends State<TapBoxC> {
  bool _highLight = false;
  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highLight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highLight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  void _handleTapCancel() {
    setState(() {
      _highLight = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(_highLight? 'Pressed ':(widget.active ? 'Active' : 'Inactive') ,
              style: TextStyle(fontSize: 32, color: Colors.white)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
            color: (_highLight ? Colors.grey :(widget.active ? Colors.lightGreen : Colors.red))
            
            ),
      ),
    );
  }
}
