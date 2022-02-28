import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> _meals;
  const FavouritesScreen(this._meals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     if (_meals.isEmpty) {
      return const Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(_meals[index]);
        },
        itemCount: _meals.length,
      );
    }

  }
}
