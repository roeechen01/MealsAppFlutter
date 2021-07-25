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
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Ingredients',
                      style: Theme.of(context).textTheme.headline1,
                    )),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.purple.shade200),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Column(children: [
                    SizedBox(
                      height: 10,
                    ),
                    ...meal.ingredients
                        .map((ingredient) => Container(
                              decoration: BoxDecoration(
                                  color: Colors.yellow.shade700,
                                  border: Border.all(color: Colors.white),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              width: MediaQuery.of(context).size.width * 0.6,
                              padding: const EdgeInsets.all(6.0),
                              margin: EdgeInsets.all(4),
                              child: Text(
                                ingredient,
                              ),
                            ))
                        .toList(),
                    SizedBox(
                      height: 10,
                    ),
                  ]),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Steps',
                      style: Theme.of(context).textTheme.headline1,
                    )),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.purple.shade200),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Column(children: [
                    ...meal.steps.map((step) {
                      int index = meal.steps.indexOf(step);
                      return Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: index != meal.steps.length - 1
                                    ? Colors.black.withOpacity(0.1)
                                    : Colors.black.withOpacity(0),
                                width: 1),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.6,
                        padding: const EdgeInsets.all(6.0),
                        margin: EdgeInsets.all(4),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                              alignment: Alignment.center,
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red.shade800),
                              child: Text(
                                '# ${index + 1}',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                            Container(
                              child: Flexible(
                                child: Text(
                                  step,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ]),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
