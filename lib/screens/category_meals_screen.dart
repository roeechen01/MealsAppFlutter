import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const screenTitle = '/category-meals';

  @override
  Widget build(BuildContext context) {
    Map<String, Object> args = ModalRoute.of(context).settings.arguments;
    List<Meal> categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(args['id']))
        .toList();
    return Scaffold(
        appBar: AppBar(
          title: Text('Category meals for: ${args['title']}'),
        ),
        body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (context, index) => MealItem(categoryMeals[index]),
        ));
  }
}
