import 'package:get/get.dart';
import '../view/home.dart';

appRoutes() => [
      GetPage(
        name: '/home',
        page: () => HomePage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
    ];
