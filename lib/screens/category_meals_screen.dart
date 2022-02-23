import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const route = "/category_meals";

  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: Text(
          'The Recipes For ${category.title}!',
        ),
      ),
    );
  }
}
