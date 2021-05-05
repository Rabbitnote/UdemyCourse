import 'package:flutter/material.dart';
import 'package:mealApp/screens/favortie_screen.dart';
import '../widgets/main_drawer.dart';
import './catogories_screen.dart';
import '../models/meal.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;
  TabScreen(this.favoriteMeal);
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Meals"),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favorites',
              )
            ],
          ),
        ),
        drawer: MainDraw(),
        body: TabBarView(
          children: [CatogoriesScreen(), FavoriteScreen(widget.favoriteMeal)],
        ),
      ),
    );
  }
}
