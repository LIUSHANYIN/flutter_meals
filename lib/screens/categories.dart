import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.onToggleLike,
    required this.availableMeal,
  });
  final void Function(Meal meal) onToggleLike;
  final List<Meal> availableMeal;

  void _selectCategory(BuildContext context, Category category) {
    final List<Meal> filterMeals = availableMeal
        .where(
          (meal) => meal.categories.contains(
            category.id,
          ),
        )
        .toList();
    // Navigator.push(context, route);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          meals: filterMeals,
          title: category.title,
          onToggleLike: onToggleLike,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children:
            // availableCategories
            //     .map((category) => CategoryGridItem(category: category))
            //     .toList(),
            [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            )
        ]);
  }
}
