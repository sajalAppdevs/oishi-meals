import 'package:flutter/material.dart';

import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './utils/strings.dart';
import './utils/dummy_data.dart';
import './models/filters.dart';
import './models/meal.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _filters = Filters();
  var _meals = dummyMeals;
  final List<Meal> _favoriteMeals = [];

  void _setFilters(Filters filters) {
    setState(() {
      _filters = filters;
      _meals = dummyMeals.where((meal) {
        if (filters.glutenFree && !meal.isGlutenFree) return false;
        if (filters.lactoseFree && !meal.isLactoseFree) return false;
        if (filters.vegan && !meal.isVegan) return false;
        if (filters.vegetarian && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(Meal meal) {
    setState(() {
      if (_isFavorite(meal)) {
        _favoriteMeals.remove(meal);
      } else {
        _favoriteMeals.add(meal);
      }
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline3: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      routes: {
        "/": (context) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.route: (context) => CategoryMealsScreen(
              _meals,
            ),
        MealDetailScreen.route: (context) => MealDetailScreen(
              _toggleFavourite,
              _isFavorite,
            ),
        FiltersScreen.route: (context) => FiltersScreen(
              _filters,
              _setFilters,
            ),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      },
    );
  }
}
