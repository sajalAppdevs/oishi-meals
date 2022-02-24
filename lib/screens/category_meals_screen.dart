import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/category.dart';
import '../utils/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const route = "/category_meals";

  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    final meals = dummyMeals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (_, index) => MealItem(meals[index]),
          itemCount: meals.length,
        ),
      ),
    );
  }
}
