import 'dart:ui';

import 'package:flutter/material.dart';
import './dummy_data.dart';
import 'package:mealApp/models/catogory.dart';
import './screens/tab_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/catogories_screen.dart';
import './screens/Filter_screnn.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> availbleMeal = DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];
  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filter = filterData;
      availbleMeal = DUMMY_MEALS.where((meal) {
        if (_filter['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filter['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filter['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filter['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealID) {
    final existingIndex = _favoriteMeal.indexWhere((meal) => meal.id == mealID);
    if(existingIndex>=0){
      setState(() {
        _favoriteMeal.removeAt(existingIndex);
      });
    }else{
      setState(() {
        
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MealAPP',
        theme: ThemeData(
            primaryColor: Colors.red,
            primarySwatch: Colors.pink,
            accentColor: Colors.amber,
            canvasColor: Color.fromRGBO(255, 254, 229, 1),
            fontFamily: 'Raleway',
            textTheme: ThemeData.light().textTheme.copyWith(
                  bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                  bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                  headline6: TextStyle(
                      fontSize: 24,
                      fontFamily: 'RobotoCondensed',
                      fontWeight: FontWeight.bold),
                )),
        // home: CatogoriesScreen(),
        routes: {
          '/': (ctx) => TabScreen(_favoriteMeal),
          CategoryMealsScreen.routeName: (ctx) =>
              CategoryMealsScreen(availbleMeal),
          MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
          Filter.routeName: (ctx) => Filter(_filter, _setFilter),
        },
        onUnknownRoute: (setting) {
          return MaterialPageRoute(
              builder: (ctx) => CategoryMealsScreen(availbleMeal));
        });
  }
}
