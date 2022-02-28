import 'package:flutter/material.dart';
import 'package:meals/utils/strings.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget _buildTile(String text, IconData icon, Function() onClick) {
    return ListTile(
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        text,
        style: const TextStyle(
          fontFamily: "RobotoCondensed",
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onClick,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      child: LayoutBuilder(
        builder: (_, constraints) {
          return Column(
            children: [
              Container(
                height: constraints.maxHeight * 0.3,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                alignment: Alignment.centerLeft,
                color: theme.accentColor,
                child: const Text(
                  appName,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: Colors.white60,
                  ),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.05,
              ),
              _buildTile("Meals", Icons.restaurant, () {
                Navigator.of(context).pushReplacementNamed("/");
              }),
              _buildTile("Filters", Icons.settings, () {
                Navigator.of(context).pushReplacementNamed(FiltersScreen.route);
              }),
            ],
          );
        },
      ),
    );
  }
}
