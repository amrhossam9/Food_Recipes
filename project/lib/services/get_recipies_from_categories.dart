import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/model/recipe.dart';

class get_recipies_from_categories {
  String baseUrl = "https://www.themealdb.com/api/json/v1/1/";
  String endPoint = "filter.php?c=";
  Future<List<recipe>> GetRecipiesFromCategories(
      {required String categoryName}) async {
    Uri url = Uri.parse('${baseUrl}${endPoint}${categoryName}');
    http.Response response = await http.get(url);
    var returnedResponse = jsonDecode(response.body);

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
