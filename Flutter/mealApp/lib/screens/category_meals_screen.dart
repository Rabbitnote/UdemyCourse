import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/categoriesmeal';
  final List<Meal> availableMeal;

  CategoryMealsScreen(this.availableMeal);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayMeal;
  bool _loadedInitData=false;
  void _removeMealItem(String mealId) {
    setState(() {
      displayMeal.removeWhere((meal) => meal.id == mealId);
    });
  }

  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if(!_loadedInitData){
    final routeArgu =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArgu['title'];
    final categoryId = routeArgu['id'];
    displayMeal = widget.availableMeal.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    _loadedInitData=true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayMeal[index].id,
              title: displayMeal[index].title,
              imageUrl: displayMeal[index].imageUrl,
              duration: displayMeal[index].duration,
              complexity: displayMeal[index].complexity,
              affordability: displayMeal[index].affordability,
              removeItem: _removeMealItem,
            );
          },
          itemCount: displayMeal.length,
        ));
  }
}
