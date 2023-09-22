import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project/model/recipe.dart';

class get_recipies_from_search {
  String baseUrl = "https://www.themealdb.com/api/json/v1/1/";
  String endPoint = "search.php?s=";
  Future<List<recipe>> GetRecipiesFromSearch({required String search}) async {
    Uri url = Uri.parse('${baseUrl}${endPoint}${search}');
    http.Response response = await http.get(url);
    var returnedResponse = jsonDecode(response.body);

    if (returnedResponse["meals"] == null) {
      Get.back();
      Get.snackbar(
        "Error",
        "${search} doesn't exist",
        colorText: Colors.white,
        backgroundColor: const Color.fromARGB(255, 0, 99, 145),
        icon: const Icon(Icons.error),
      );
      return [];
    } else {
      List<dynamic> data = returnedResponse["meals"];

      List<recipe> Recipes = [];

      for (int i = 0; i < data.length; i++) {
        Recipes.add(recipe.notFull(
            strMeal: data[i]['strMeal'],
            strMealThumb: data[i]['strMealThumb'],
            idMeal: data[i]['idMeal']));
      }

      return Recipes;
    }
  }
}
