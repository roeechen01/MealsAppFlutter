import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  static const String screenTitle = '/map-details-screen';
  Meal meal;

  @override
  Widget build(BuildContext context) {
    Map<String, Object> args = ModalRoute.of(context).settings.arguments;
    meal = args['meal'];
    return Scaffold(
      appBar: AppBar(
          title: FittedBox(
        child: Text(
          meal.title,
        ),
      )),
      body: Text('BODY'),
    );
  }
}
