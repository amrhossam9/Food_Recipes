import 'package:dashed_line/dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:project/model/recipe.dart';
import 'package:project/services/get_recipe.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipiePage extends StatelessWidget {
  RecipiePage({super.key});
  String recipeId = Get.arguments['idMeal'];

  late Future<recipe> futureRecipie =
      get_recipie().GetRecipie(recipeid: recipeId);
  late recipe Recipe;

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
                          icon: Icon(Icons.arrow_back_ios_outlined)),
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
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Expanded(
                              child: FutureBuilder(
                                  future: futureRecipie,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      Recipe = snapshot.data!;
                                      _launchURL() async {
                                        Uri _url = Uri.parse(Recipe.strYoutube);
                                        if (await launchUrl(_url)) {
                                          await launchUrl(_url);
                                        } else {
                                          throw 'Could not launch $_url';
                                        }
                                      }

                                      return SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.network(
                                                Recipe.strMealThumb,
                                                width: 200,
                                              ),
                                            ),
                                            Text(
                                              Recipe.strMeal,
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 20),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: InkWell(
                                                onTap: _launchURL,
                                                child: Text(
                                                  'Tutorial Video',
                                                  style: TextStyle(
                                                    color: Colors.blue,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "Instructions: ${Recipe.strInstructions}",
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 20),
                                            )
                                          ],
                                        ),
                                      );
                                    } else {
                                      return Center(
                                        child:
                                            LoadingAnimationWidget.twistingDots(
                                          leftDotColor: Color.fromARGB(
                                              255, 255, 255, 255),
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
                ),
              ],
            ),
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
