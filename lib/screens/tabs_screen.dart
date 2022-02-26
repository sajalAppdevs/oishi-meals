import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favourites_screen.dart';

import '../utils/strings.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final _pages = const [CategoriesScreen(), FavouritesScreen()];

  int _selectedTab = 0;
  void _selectTab(int tab) {
    setState(() => _selectedTab = tab);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
      ),
      body: SafeArea(child: _pages[_selectedTab]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (tab) => _selectTab(tab),
        selectedItemColor: theme.primaryColor,
        backgroundColor: Colors.white70,
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favourites",
          ),
        ],
      ),
    );
  }
}
