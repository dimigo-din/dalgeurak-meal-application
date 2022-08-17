import 'package:dimigoin_flutter_plugin/dimigoin_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MealExceptionPageController extends GetxController with StateMixin {
  Rx<PickerDateRange> selectDate = PickerDateRange(null, null).obs;
  TextEditingController reasonTextController = TextEditingController();

  RxMap selectMealType = {
    MealType.breakfast: false,
    MealType.lunch: false,
    MealType.dinner: false,
  }.obs;
  RxMap selectMealExceptionType = {
    MealExceptionType.first: false,
    MealExceptionType.last: false,
  }.obs;


  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }
}
