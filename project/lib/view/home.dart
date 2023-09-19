import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import 'package:dashed_line/dashed_line.dart';
import 'package:food_icons/food_icons.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          child: Stack(
            children: [
              // Background Gradient
              Positioned.fill(
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
              ),
              Expanded(
                child: DashedLine(
                  dashSpace: 6,
                  dashLength: 3,
                  path: Path()
                    ..moveTo(10, -40)
                    ..cubicTo(50, -25, 90, 10, 120, -13),
                  color: Color.fromARGB(179, 255, 255, 255),
                ),
              ),
              Expanded(
                child: DashedLine(
                  dashSpace: 6,
                  dashLength: 3,
                  path: Path()
                    ..moveTo(40, 40)
                    ..cubicTo(80, -25, 90, 10, 120, 13),
                  color: Color.fromARGB(179, 255, 255, 255),
                ),
              ),
              Expanded(
                child: DashedLine(
                  dashSpace: 6,
                  dashLength: 3,
                  path: Path()
                    ..moveTo(15, -20)
                    ..cubicTo(80, -250, 90, 10, 220, -30),
                  color: Color.fromARGB(179, 255, 255, 255),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Text(
                      "Food Recipes",
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 40.0, left: 20, right: 20, bottom: 40),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 115, 115, 115)),
                        hintText: 'Search',
                        fillColor: Colors.white.withOpacity(0.6),
                        filled: true,
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(192, 238, 238, 238),
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(
                            20,
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Image.network(
                                          'https://cdn-icons-png.flaticon.com/512/9086/9086602.png?ga=GA1.1.2066734827.1694892602',
                                          fit: BoxFit.cover,
                                          width: 50.0,
                                          height: 50.0,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Image.network(
                                          'https://cdn-icons-png.flaticon.com/512/1046/1046751.png?ga=GA1.1.2066734827.1694892602',
                                          fit: BoxFit.cover,
                                          width: 50.0,
                                          height: 50.0,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Image.network(
                                          'https://cdn-icons-png.flaticon.com/512/1420/1420174.png?ga=GA1.1.2066734827.1694892602',
                                          fit: BoxFit.cover,
                                          width: 50.0,
                                          height: 50.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
