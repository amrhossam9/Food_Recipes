import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/model/categories.dart';

class Get_Categories {
  String baseUrl = "https://www.themealdb.com/api/json/v1/1/";
  String endPoint = "categories.php";
  Future<List<categories>> GetCategoriesData() async {
    Uri url = Uri.parse('${baseUrl}${endPoint}');
    http.Response response = await http.get(url);
    var returnedResponse = jsonDecode(response.body);

    List<dynamic> data = returnedResponse["categories"];

    List<categories> categoriesData = [];

    for (int i = 0; i < data.length; i++) {
      categoriesData.add(categories(
          strCategory: data[i]['strCategory'],
          strCategoryThumb: data[i]['strCategoryThumb']));
    }

    return categoriesData;
  }
}
