import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Welcome to my Profile')),
            body: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.account_circle, size: 50)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Thanakorn Aungkunchuchold',
                              style: Theme.of(context).textTheme.headline6),
                          Text('Experienced App Developer'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(width: 250,child:Text(
                        'Address :หมู่บ้านคาซ่าเลเจ้นด์พระราม5-ราชพฤกษ์'
                        '189/65ถ.นครอินทร์'
                        'บางขนุน บางกรวย'
                        'นนทบุรี 11130',
                      )),
                      Text('Student No.62130500209'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Icon(Icons.accessibility),
                      Icon(Icons.timer),
                      Icon(Icons.phone_android),
                      Icon(
                        Icons.phone_iphone,
                      )
                    ],
                  )
                ])));
  }
}
