import 'package:dashed_line/dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:project/model/recipe.dart';
import 'package:project/services/get_recipies_from_categories.dart';

class CategoryRecipies extends StatelessWidget {
  CategoryRecipies({super.key});
  String categoryName = Get.arguments['CategoryName'];

  late Future<List<recipe>> futureRecipies = get_recipies_from_categories()
      .GetRecipiesFromCategories(categoryName: categoryName);
  //categoriesData will be used to save the data from the snapShot
  List<recipe> Recipes = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            HomePageBackground(),
            DashedLine(
              dashSpace: 6,
              dashLength: 3,
              path: Path()
                ..moveTo(0, -40)
                ..cubicTo(50, -25, 90, 10, 120, -13),
              color: const Color.fromARGB(179, 255, 255, 255),
            ),
            DashedLine(
              dashSpace: 6,
              dashLength: 3,
              path: Path()
                ..moveTo(40, 40)
                ..cubicTo(80, -25, 90, 10, 120, 13),
              color: const Color.fromARGB(179, 255, 255, 255),
            ),
            DashedLine(
              dashSpace: 6,
              dashLength: 3,
              path: Path()
                ..moveTo(15, -20)
                ..cubicTo(80, -250, 90, 10, 220, -30),
              color: const Color.fromARGB(179, 255, 255, 255),
            ),
            DashedLine(
              dashSpace: 6,
              dashLength: 3,
              path: Path()
                ..moveTo(-30, -20)
                ..cubicTo(80, -250, 90, 10, 220, -30),
              color: const Color.fromARGB(179, 255, 255, 255),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton.outlined(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.arrow_back_ios_outlined)),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(173, 238, 238, 238),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(
                          20,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                            child: FutureBuilder(
                                future: futureRecipies,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    Recipes = snapshot.data!;
                                    return ListView.builder(
                                      itemCount: Recipes.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Get.toNamed('/RecipiePage',
                                                arguments: {
                                                  'idMeal':
                                                      Recipes[index].idMeal
                                                });
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Image.network(
                                                    Recipes[index].strMealThumb,
                                                    width: 70,
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    Recipes[index].strMeal,
                                                    style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 106, 106, 106),
                                                        fontSize: 18),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    return Center(
                                      child:
                                          LoadingAnimationWidget.twistingDots(
                                        leftDotColor:
                                            const Color.fromARGB(255, 255, 255, 255),
                                        rightDotColor: const Color.fromARGB(
                                            255, 26, 133, 226),
                                        size: 70,
                                      ),
                                    );
                                  }
                                })),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget HomePageBackground() {
  return // Background Gradient
      const Positioned.fill(
    child: DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff4AB7DA),
            Color(0xff48B4DC),
            Color(0xff73C3E4),
            Color(0xff39A3DB),
            Color(0xff3890DC),
          ],
        ),
      ),
    ),
  );
}
