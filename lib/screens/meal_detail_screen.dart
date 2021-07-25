import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  static const String screenTitle = '/map-details-screen';
  Meal meal;

  Widget buildTitle(String text, BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline1,
        ));
  }

  Widget buildList(Widget widget, BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.purple.shade200),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.7,
        padding: const EdgeInsets.all(10.0),
        child: widget);
  }

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
      body: Container(
        height: double.infinity,
        color: Colors.yellow.shade200,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Image.network(meal.imageUrl,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover),
                buildTitle('Ingredients', context),
                buildList(
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: meal.ingredients.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Theme.of(context).accentColor,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(
                              '${meal.ingredients[index]}',
                            ),
                          ),
                        );
                      },
                    ),
                    context),
                buildTitle('Steps', context),
                buildList(
                    ListView.builder(
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  child: Text(
                                    '#${index + 1}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                title: Text(meal.steps[index]),
                              ),
                              Divider()
                            ],
                          );
                        },
                        itemCount: meal.steps.length,
                        padding: EdgeInsets.zero),
                    context),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
