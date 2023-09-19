import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/routes.dart';

void main() {
  runApp(const FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Get Route Managment',
      initialRoute: '/home',
      getPages: appRoutes(),
    );
  }
}