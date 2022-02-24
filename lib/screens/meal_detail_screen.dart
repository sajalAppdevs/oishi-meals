import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const route = "/meal-detail";

  const MealDetailScreen({Key? key}) : super(key: key);

  List<Widget> _buildSection(BuildContext context, String title, Widget child) {
    final theme = Theme.of(context);
    return [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: theme.textTheme.headline3,
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              ..._buildSection(
                context,
                "Ingredients",
                ListView.builder(
                  itemBuilder: (_, index) {
                    return Card(
                      color: theme.accentColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(meal.ingredients[index]),
                      ),
                    );
                  },
                  itemCount: meal.ingredients.length,
                ),
              ),
              ..._buildSection(
                context,
                "Steps",
                ListView.builder(
                  itemBuilder: (_, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text("# ${index + 1}"),
                        ),
                        title: Text(meal.steps[index]),
                      ),
                      // only display the divider if its not the last item
                      if (index < meal.steps.length - 1)
                        const Divider(
                          height: 8,
                          thickness: 2,
                        ),
                    ],
                  ),
                  itemCount: meal.steps.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
