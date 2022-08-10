import 'package:dalgeurak_meal_application/pages/convenience_food/widgets/food_select_container.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ConvenienceFoodPageController extends GetxController with StateMixin {
  Rx<ConvenienceFoodType> selectConvenienceFoodType = ConvenienceFoodType.none.obs;

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }
}
