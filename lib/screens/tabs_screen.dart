import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/categories_screen.dart';
import '../screens/favourites_screen.dart';
import '../widgets/main_drawer.dart';
import '../utils/strings.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> _favouriteMeals;

  const TabsScreen(this._favouriteMeals, {Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late final _pages = [
      const MapEntry(categories, CategoriesScreen()),
      MapEntry(favourites, FavouritesScreen(widget._favouriteMeals))
    ];

  int _selectedTab = 0;
  void _selectTab(int tab) {
    setState(() => _selectedTab = tab);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedTab].key),
      ),
      drawer: const MainDrawer(),
      body: SafeArea(child: _pages[_selectedTab].value),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (tab) => _selectTab(tab),
        selectedItemColor: theme.primaryColor,
        backgroundColor: Colors.white70,
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: categories,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: favourites,
          ),
        ],
      ),
    );
  }
}
