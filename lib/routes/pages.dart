import 'package:dalgeurak_meal_application/pages/meal_cancel/binding.dart';
import 'package:dalgeurak_meal_application/pages/meal_cancel/page.dart';
import 'package:dalgeurak_meal_application/pages/page_list/page.dart';
import 'package:dalgeurak_meal_application/routes/routes.dart';
import 'package:get/get.dart';

import '../pages/convenience_food/binding.dart';
import '../pages/convenience_food/page.dart';

class DalgeurakMealApplicationPages {
  static final pages = [
    GetPage(name: DalgeurakMealApplicationRoutes.PAGELIST, page: () => const PageListPage()),
    GetPage(name: DalgeurakMealApplicationRoutes.CONVENIENCEFOOD, page: () => const ConvenienceFoodPage(), binding: ConvenienceFoodPageBinding()),
    GetPage(name: DalgeurakMealApplicationRoutes.MEALCANCEL, page: () => const MealCancelPage(), binding: MealCancelPageBinding()),
  ];
}
