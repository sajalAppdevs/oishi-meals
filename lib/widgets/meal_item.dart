import 'package:flutter/material.dart';

import '../utils/dimens.dart';
import '../utils/extensions.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem(this.meal, {Key? key}) : super(key: key);

  void selectMeal(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            LayoutBuilder(builder: (_, constraints) {
              return Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(radius),
                      topRight: Radius.circular(radius),
                    ),
                    child: Image.network(
                      meal.imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: constraints.maxWidth * 0.6,
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 20,
                      ),
                      child: Text(
                        meal.title,
                        style: const TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              );
            }),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _MealInfo(
                    icon: Icons.schedule,
                    text: "${meal.duration} minutes",
                  ),
                  _MealInfo(
                    icon: Icons.work,
                    text: meal.complexity.name.capitalized,
                  ),
                  _MealInfo(
                    icon: Icons.attach_money,
                    text: meal.affordability.name.capitalized,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MealInfo extends StatelessWidget {
  final IconData icon;
  final String text;

  const _MealInfo({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 6),
        Text(text),
      ],
    );
  }
}
