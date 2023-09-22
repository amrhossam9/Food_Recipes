import 'package:get/get.dart';
import 'package:project/view/category_recipies.dart';
import 'package:project/view/recipie_page.dart';
import 'package:project/view/search_recipie.dart';
import '../view/home.dart';

appRoutes() => [
      GetPage(
        name: '/home',
        page: () => HomePage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/CategoryRecipies',
        page: () => CategoryRecipies(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/RecipiePage',
        page: () => RecipiePage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/SearchRecipie',
        page: () => SearchRecipie(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
    ];
