import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> meals;
  FavouriteScreen(this.meals);
  @override
  Widget build(BuildContext context) {
    if (meals.isEmpty) {
      return Center(
        child: Text("Nothing here try adding something"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: meals[index].id,
            title: meals[index].title,
            imageUrl: meals[index].imageUrl,
            affordability: meals[index].affordability,
            duration: meals[index].duration,
            complexity: meals[index].complexity,
          );
        },
        itemCount: meals.length,
      );
    }
  }
}
