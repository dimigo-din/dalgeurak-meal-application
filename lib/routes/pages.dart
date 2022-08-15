import 'package:dalgeurak_meal_application/pages/meal_cancel/binding.dart';
import 'package:dalgeurak_meal_application/pages/meal_cancel/page.dart';
import 'package:dalgeurak_meal_application/pages/page_list/page.dart';
import 'package:dalgeurak_meal_application/routes/routes.dart';
import 'package:get/get.dart';

import '../pages/convenience_food/binding.dart';
import '../pages/convenience_food/page.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.PAGELIST, page: () => const PageListPage()),
    GetPage(name: Routes.CONVENIENCEFOOD, page: () => const ConvenienceFoodPage(), binding: ConvenienceFoodPageBinding()),
    GetPage(name: Routes.MEALCANCEL, page: () => const MealCancelPage(), binding: MealCancelPageBinding()),
  ];
}
