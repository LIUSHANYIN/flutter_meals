import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/item.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key, required this.meals, this.title, required this.onToggleLike});

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleLike;

  void selectMealItem(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
          onToggleLike: onToggleLike,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => MealItem(
        meal: meals[index],
        selectMealItem: (meal) {
          selectMealItem(context, meal);
        },
      ),
    );
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'No meal was found',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Try Selecting different category!',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            )
          ],
        ),
      );
    }
    if (title == null) {
      return content;
    }
    // TODO: implement build
    return Scaffold(appBar: AppBar(title: Text(title!)), body: content);
  }
}
