class recipe {
  late String strMeal,
      strMealThumb,
      idMeal,
      strCategory,
      strArea,
      strInstructions,
      strYoutube;
  recipe.notFull(
      {required this.strMeal,
      required this.strMealThumb,
      required this.idMeal});
  recipe(
      {required this.strMeal,
      required this.strMealThumb,
      required this.idMeal,
      required this.strArea,
      required this.strCategory,
      required this.strInstructions,
      required this.strYoutube});
}
