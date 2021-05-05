import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/catogories_item.dart';

class CatogoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map((catdata) =>
                CatogoryItem(catdata.id, catdata.title, catdata.color))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
    );
  }
}
