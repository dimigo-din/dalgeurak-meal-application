import 'package:dalgeurak_widget_package/widgets/toast.dart';
import 'package:dimigoin_flutter_plugin/dimigoin_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

extension WeekDayEnumExtension on int {
  String get convertWeekDayKorStr {
    switch (this) {
      case 1: return "월";
      case 2: return "화";
      case 3: return "수";
      case 4: return "목";
      case 5: return "금";
      case 6: return "토";
      case 7: return "일";
      default: return "";
    }
  }

  String get convertWeekDayEngStr {
    switch (this) {
      case 1: return "mon";
      case 2: return "tue";
      case 3: return "wed";
      case 4: return "thu";
      case 5: return "fri";
      case 6: return "sat";
      case 7: return "sun";
      default: return "";
    }
  }
}


class MealExceptionPageController extends GetxController with StateMixin {
  Rx<PickerDateRange> selectDate = PickerDateRange(null, null).obs;
  TextEditingController reasonTextController = TextEditingController();
  TextEditingController phoneNumTextController = TextEditingController();

  Rx<int> selectWeekDay = 0.obs;
  Rx<MealType> selectMealType = MealType.none.obs;
  Rx<MealExceptionType> selectMealExceptionType = MealExceptionType.normal.obs;
  RxList<DimigoinUser> selectUserList = [].cast<DimigoinUser>().obs;

  DalgeurakService _dalgeurakService = DalgeurakService();
  DalgeurakToast _dalgeurakToast = DalgeurakToast();


  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  applicationMealException() async {
    if (selectMealExceptionType.value == MealExceptionType.normal || selectMealType.value == MealType.none || selectWeekDay.value == 0) {
      _dalgeurakToast.show("설정되지 않은 칸을 모두 설정 후 다시 시도해주세요.");
      return;
    }

    if (selectUserList.isEmpty) {
      selectUserList.add(DimigoinAccount().currentUser);
    }

    Map result = await _dalgeurakService.setUserMealException(
        selectMealExceptionType.value,
        reasonTextController.text,
        selectUserList.map((element) => element.id!).cast<String>().toList(),
        selectMealType.value,
        selectWeekDay.value.convertWeekDayEngStr
    );

    _dalgeurakToast.show("선/후밥 신청을 ${result['success'] ? "성공" : "실패"}하였습니다.${result['success'] ? "" : "\n사유: ${result['content']}"}");
    Get.back();
  }
}
