import 'package:dalgeurak_meal_application/widgets/date_select_container.dart';
import 'package:dalgeurak_widget_package/themes/color_theme.dart';
import 'package:dalgeurak_widget_package/widgets/blue_button.dart';
import 'package:dalgeurak_widget_package/widgets/checkbox.dart';
import 'package:dalgeurak_widget_package/widgets/reason_textfield.dart';
import 'package:dalgeurak_widget_package/widgets/window_title.dart';
import 'package:dimigoin_flutter_plugin/dimigoin_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../themes/text_theme.dart';
import 'controller.dart';

class MealExceptionPage extends GetView<MealExceptionPageController> {
  const MealExceptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dalgeurakGrayOne,
      body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: Get.height * 0.085,
                left: Get.width * 0.1,
                child: WindowTitle(
                  subTitle: "선/후밥",
                  title: "신청",
                ),
              ),
              Positioned(
                top: Get.height * 0.12,
                right: Get.width * 0.1,
                child: GestureDetector(onTap: () => Get.back(), child: SvgPicture.asset("assets/images/close.svg", package: "dalgeurak_widget_package", width: 18, color: Colors.black))
              ),
              Positioned(
                top: Get.height * 0.175,
                child: Container(
                  width: 350,
                  height: Get.height * 0.73,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.all(24),
                  child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text("신청 날짜", style: containerMenu),
                          SizedBox(height: 18),
                          DateSelectContainer(selectDate: controller.selectDate),
                          SizedBox(height: 32),
                          Text("신청 시간", style: containerMenu),
                          SizedBox(height: 18),
                          Obx(() => SizedBox(
                            width: Get.width * 0.45,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap: () => controller.selectMealType[MealType.lunch] = !controller.selectMealType[MealType.lunch],
                                    child: DalgeurakCheckBox(content: "점심", isOn: controller.selectMealType[MealType.lunch], checkBoxType: DalgeurakCheckBoxType.window)
                                ),
                                GestureDetector(
                                    onTap: () => controller.selectMealType[MealType.dinner] = !controller.selectMealType[MealType.dinner],
                                    child: DalgeurakCheckBox(content: "저녁", isOn: controller.selectMealType[MealType.dinner], checkBoxType: DalgeurakCheckBoxType.window)
                                ),
                              ],
                            ),
                          )),
                          SizedBox(height: 32),
                          Text("신청 항목", style: containerMenu),
                          SizedBox(height: 18),
                          Obx(() => SizedBox(
                            width: Get.width * 0.45,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap: () => controller.selectMealExceptionType[MealExceptionType.first] = !controller.selectMealExceptionType[MealExceptionType.first],
                                    child: DalgeurakCheckBox(content: "선밥", isOn: controller.selectMealExceptionType[MealExceptionType.first], checkBoxType: DalgeurakCheckBoxType.window)
                                ),
                                GestureDetector(
                                    onTap: () => controller.selectMealExceptionType[MealExceptionType.last] = !controller.selectMealExceptionType[MealExceptionType.last],
                                    child: DalgeurakCheckBox(content: "후밥", isOn: controller.selectMealExceptionType[MealExceptionType.last], checkBoxType: DalgeurakCheckBoxType.window)
                                ),
                              ],
                            ),
                          )),
                          SizedBox(height: 32),
                          Text("상세 사유", style: containerMenu),
                          SizedBox(height: 18),
                          ReasonTextField(hintText: "상세사유를 입력해주세요.", textController: controller.reasonTextController, isBig: false),
                          SizedBox(height: 48),
                          Center(child: BlueButton(content: "신청", isLong: false, isSmall: false, isFill: true, isDisable: false))
                        ],
                      )
                  ),
                )
              ),
            ],
          )
      ),
    );
  }
}
