import 'package:dalgeurak_meal_application/pages/convenience_food/widgets/food_select_container.dart';
import 'package:dimigoin_flutter_plugin/dimigoin_flutter_plugin.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ConvenienceFoodPageController extends GetxController with StateMixin {
  Rx<ConvenienceFoodType> selectConvenienceFoodType = ConvenienceFoodType.none.obs;
  Rx<MealType> selectMealType = MealType.breakfast.obs;

  Map convenienceFoodMenuList = {
    MealType.breakfast: [ConvenienceFoodType.misu, ConvenienceFoodType.salad, ConvenienceFoodType.sandwich],
    MealType.dinner: [ConvenienceFoodType.misu, ConvenienceFoodType.salad],
  };

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }
}
