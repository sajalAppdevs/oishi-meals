import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../models/category.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const route = "/category_meals";

  final List<Meal> _availableMeals;

  const CategoryMealsScreen(this._availableMeals, {Key? key}) : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late Category _category;
  late List<Meal> _meals;
  var _init = false;

  @override
  void didChangeDependencies() {
    if (!_init) {
      _category = ModalRoute.of(context)!.settings.arguments as Category;
      _meals = widget._availableMeals.where((meal) {
        return meal.categories.contains(_category.id);
      }).toList();
      _init = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_category.title),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (_, index) => MealItem(_meals[index]),
          itemCount: _meals.length,
        ),
      ),
    );
  }
}
