import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

// import '../dummy_data.dart';

class CatagoryMeals extends StatefulWidget {
  static const routeName = '/catagory-meals';
  final List<Meal> availableMeals;
  CatagoryMeals(this.availableMeals);
  @override
  _CatagoryMealsState createState() => _CatagoryMealsState();
}

class _CatagoryMealsState extends State<CatagoryMeals> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final catagoryID = routeArgs['id'];
    final catagoryMeals = widget.availableMeals
        .where((element) => element.categories.contains(catagoryID))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs["title"]),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: catagoryMeals[index].id,
            title: catagoryMeals[index].title,
            imageUrl: catagoryMeals[index].imageUrl,
            affordability: catagoryMeals[index].affordability,
            duration: catagoryMeals[index].duration,
            complexity: catagoryMeals[index].complexity,
          );
        },
        itemCount: catagoryMeals.length,
      ),
    );
  }
}
