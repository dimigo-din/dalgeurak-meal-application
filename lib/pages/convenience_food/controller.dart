import 'package:dalgeurak_meal_application/pages/convenience_food/widgets/food_select_container.dart';
import 'package:dalgeurak_widget_package/widgets/toast.dart';
import 'package:dimigoin_flutter_plugin/dimigoin_flutter_plugin.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ConvenienceFoodPageController extends GetxController with StateMixin {
  Rx<ConvenienceFoodType> selectConvenienceFoodType = ConvenienceFoodType.none.obs;
  Rx<MealType> selectMealType = MealType.breakfast.obs;

  DalgeurakService _dalgeurakService = DalgeurakService();
  DalgeurakToast _dalgeurakToast = DalgeurakToast();

  Map convenienceFoodMenuList = {
    MealType.breakfast: [ConvenienceFoodType.misu, ConvenienceFoodType.salad, ConvenienceFoodType.sandwich],
    MealType.dinner: [ConvenienceFoodType.misu, ConvenienceFoodType.salad],
  };

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  applicationConvenienceFood() async {
    if (selectConvenienceFoodType.value == ConvenienceFoodType.none) { _dalgeurakToast.show("메뉴가 선택되지 않았습니다."); return; }

    Map result = await _dalgeurakService.applicationConvenienceFood(selectMealType.value, selectConvenienceFoodType.value);

    if (result['success']) {
      _dalgeurakToast.show("신청에 성공하였습니다.");
      Get.back();
    } else {
      _dalgeurakToast.show(result['content']);
    }
  }
}
