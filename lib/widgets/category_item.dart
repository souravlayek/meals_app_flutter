import 'package:flutter/material.dart';
import '../screens/catagorymeals_screen.dart';

class CatagoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String catId;
  CatagoryItem(this.catId, this.title, this.color);

  void selectCatagory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CatagoryMeals.routeName,
        arguments: {'id': catId, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCatagory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
