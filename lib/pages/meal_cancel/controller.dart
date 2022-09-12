import 'dart:io';

import 'package:dalgeurak_widget_package/widgets/dialog.dart';
import 'package:dalgeurak_widget_package/widgets/toast.dart';
import 'package:dimigoin_flutter_plugin/dimigoin_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MealCancelPageController extends GetxController with StateMixin {
  Rx<PickerDateRange> selectDate = PickerDateRange(null, null).obs;
  TextEditingController reasonTextController = TextEditingController();
  RxMap selectMeal = {
    MealType.breakfast: false,
    MealType.lunch: false,
    MealType.dinner: false,
  }.obs;

  DalgeurakService _dalgeurakService = DalgeurakService();
  DalgeurakToast _dalgeurakToast = DalgeurakToast();
  DalgeurakDialog _dalgeurakDialog = DalgeurakDialog();

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  applicationMealCancel() async {
    bool isMultipleStudent = Get.arguments['selectStudentList'] != null;

    List<MealType> selectMealTypeList = [];
    selectMeal.forEach((key, value) {
      if (value) { selectMealTypeList.add(key); }
    });

    late Map result;
    if (isMultipleStudent) {
      List<DimigoinUser> multipleStudentList = Get.arguments['selectStudentList'];

      result = await _dalgeurakService.applicationTeacherMealCancel(
          multipleStudentList,
          reasonTextController.text,
          selectDate.value.startDate!,
          selectDate.value.endDate == null ? selectDate.value.startDate! : selectDate.value.endDate!,
          selectMealTypeList
      );
    } else {
      result = await _dalgeurakService.applicationUserMealCancel(
          reasonTextController.text,
          selectDate.value.startDate!,
          selectDate.value.endDate == null ? selectDate.value.startDate! : selectDate.value.endDate!,
          selectMealTypeList
      );
    }

    _dalgeurakToast.show("급식 취소 신청에 ${result['success'] ? "성공" : "실패"}하였습니다.${result['success'] ? "" : "\n사유: ${result['content']}"}");
    Get.back();
  }
}
