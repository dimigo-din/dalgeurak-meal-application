import 'package:dimigoin_flutter_plugin/dimigoin_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MealCancelPageController extends GetxController with StateMixin {
  late Rx<PickerDateRange> selectDate = PickerDateRange(null, null).obs;
  TextEditingController reasonTextController = TextEditingController();
  RxMap selectMeal = {
    MealType.breakfast: false,
    MealType.lunch: false,
    MealType.dinner: false,
  }.obs;

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    // TODO: implement your code here
    print(args.toString());
  }
}
