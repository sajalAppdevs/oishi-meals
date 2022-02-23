import 'package:flutter/material.dart';
import 'package:meals/screens/category_meals_screen.dart';

import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category _category;

  const CategoryItem(this._category, {Key? key}) : super(key: key);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(CategoryMealsScreen.route, arguments: _category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          _category.title,
          style: Theme.of(context).textTheme.headline3,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              _category.color.withOpacity(0.7),
              _category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
