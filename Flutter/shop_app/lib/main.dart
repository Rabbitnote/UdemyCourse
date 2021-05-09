import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/product_overview_screen.dart';
import './screens/product_detial_screen.dart';
import './provider/products.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
          create: (ctx)=> Products() ,
          child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(primarySwatch: Colors.purple,accentColor: Colors.deepOrange,fontFamily: 'Lato'),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),

        },
      ),
    );
  }
}

