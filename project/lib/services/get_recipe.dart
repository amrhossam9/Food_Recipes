import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/model/recipe.dart';

class get_recipie {
  String baseUrl = "https://www.themealdb.com/api/json/v1/1/";
  String endPoint = "lookup.php?i=";
  Future<recipe> GetRecipie({required String recipeid}) async {
    Uri url = Uri.parse('${baseUrl}${endPoint}${recipeid}');
    http.Response response = await http.get(url);
    var returnedResponse = jsonDecode(response.body);

    List<dynamic> data = returnedResponse["meals"];

    return recipe(
        strMeal: data[0]['strMeal'],
        strMealThumb: data[0]['strMealThumb'],
        idMeal: data[0]['idMeal'],
        strArea: data[0]['strArea'],
        strCategory: data[0]['strCategory'],
        strInstructions: data[0]['strInstructions'],
        strYoutube: data[0]['strYoutube']);
  }
}
