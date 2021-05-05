import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome To my App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello'),
        ),
        body: Center(
          child: ParentWidget(),
        ),
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
  void _handleTapBoxChange(bool newValue){
    setState(() {
      _active = newValue;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapBoxB(
        active:_active,
        onChanged:_handleTapBoxChange,
        
        ),
      
    );
  }
}
class TapBoxB extends StatelessWidget {
  TapBoxB({this.active:false, @required this.onChanged});
  final bool active;
  final ValueChanged<bool> onChanged;
  void _handleTap(){
    onChanged(!active);
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child:Center(
          child:Text(active ? 'Active':'Inactive',style:TextStyle(fontSize: 32,color:Colors.white)),
        ),
        width:200.0,
        height:200.0,
        decoration: BoxDecoration(color:(active ? Colors.lightGreen:Colors.red)),

      ),
      
    );
  }
}
