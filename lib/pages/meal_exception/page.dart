import 'package:dalgeurak_meal_application/widgets/date_select_container.dart';
import 'package:dalgeurak_widget_package/screens/multiple_student_choice.dart';
import 'package:dalgeurak_widget_package/themes/color_theme.dart';
import 'package:dalgeurak_widget_package/widgets/blue_button.dart';
import 'package:dalgeurak_widget_package/widgets/checkbox.dart';
import 'package:dalgeurak_widget_package/widgets/choice_user_container.dart';
import 'package:dalgeurak_widget_package/widgets/oneline_textfield.dart';
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
      backgroundColor: Colors.white,
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
                top: Get.height * 0.19,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("명단", style: containerMenu.copyWith(fontSize: 17)),
                        SizedBox(width: 16),
                        GestureDetector(
                          onTap: () => showSearch(context: Get.context!, delegate: _StudentMultipleChoice()),
                          child: Text("추가하기", style: exceptionPage_addPeople),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Obx(() => AnimatedSize(
                      duration: Duration(milliseconds: 150),
                      curve: Curves.easeIn,
                      child: SizedBox(
                        width: 290,
                        height: controller.selectUserList.isNotEmpty ? 75 : 0,
                        child: ListView.builder(
                          itemCount: controller.selectUserList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ChoiceUserContainer(
                              choiceUser: controller.selectUserList[index],
                              choiceUserList: controller.selectUserList,
                              onClick: () => controller.selectUserList.removeAt(index),
                              isSearchPage: false,
                            );
                          },
                        )
                      ),
                    )),
                    SizedBox(height: 16),
                    Text("신청 요일", style: containerMenu.copyWith(fontSize: 17)),
                    SizedBox(height: 16),
                    SizedBox(
                      width: 290,
                      height: 20,
                      child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => controller.selectWeekDay.value = (index+1),
                            child: Container(
                              width: 16,
                              height: 16,
                              margin: EdgeInsets.only(right: 52),
                              color: Colors.transparent,
                              child: Obx(() => Text(
                                  (index+1).convertWeekDayKorStr,
                                  style: selectWeekDay.copyWith(
                                    color: (controller.selectWeekDay.value == (index+1) ? dalgeurakBlueOne : selectWeekDay.color),
                                    fontWeight: (controller.selectWeekDay.value == (index+1) ? FontWeight.w700 : selectWeekDay.fontWeight)
                                  )
                              )),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 28),
                    Text("신청 시간", style: containerMenu.copyWith(fontSize: 17)),
                    SizedBox(height: 16),
                    Obx(() => SizedBox(
                      width: Get.width * 0.45,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () => controller.selectMealType.value = MealType.lunch,
                              child: DalgeurakCheckBox(content: "점심", isOn: controller.selectMealType.value == MealType.lunch, checkBoxType: DalgeurakCheckBoxType.window)
                          ),
                          GestureDetector(
                              onTap: () => controller.selectMealType.value = MealType.dinner,
                              child: DalgeurakCheckBox(content: "저녁", isOn: controller.selectMealType.value == MealType.dinner, checkBoxType: DalgeurakCheckBoxType.window)
                          ),
                        ],
                      ),
                    )),
                    SizedBox(height: 28),
                    Text("신청 항목", style: containerMenu.copyWith(fontSize: 17)),
                    SizedBox(height: 16),
                    Obx(() => SizedBox(
                      width: Get.width * 0.45,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () => controller.selectMealExceptionType.value = MealExceptionType.first,
                              child: DalgeurakCheckBox(content: "선밥", isOn: controller.selectMealExceptionType.value == MealExceptionType.first, checkBoxType: DalgeurakCheckBoxType.window)
                          ),
                          GestureDetector(
                              onTap: () => controller.selectMealExceptionType.value = MealExceptionType.last,
                              child: DalgeurakCheckBox(content: "후밥", isOn: controller.selectMealExceptionType.value == MealExceptionType.last, checkBoxType: DalgeurakCheckBoxType.window)
                          ),
                        ],
                      ),
                    )),
                    SizedBox(height: 28),
                    Text("상세 사유", style: containerMenu.copyWith(fontSize: 17)),
                    SizedBox(height: 16),
                    OneLineTextField(hintText: "상세사유를 입력해주세요.", textController: controller.reasonTextController, isEnable: true),
                    SizedBox(height: 28),
                    Text("연락처", style: containerMenu.copyWith(fontSize: 17)),
                    SizedBox(height: 16),
                    OneLineTextField(hintText: "문제 발생 이외의 용도로 사용하지 않습니다.", textController: controller.phoneNumTextController, isEnable: true),
                  ],
                )
              ),
              Obx(() => AnimatedPositioned(
                duration: Duration(milliseconds: 150),
                curve: Curves.easeIn,
                bottom: controller.selectUserList.isNotEmpty ? 64 : 120,
                child: GestureDetector(
                  onTap: () => controller.applicationMealException(),
                  child: BlueButton(content: "신청", isLong: false, isSmall: false, isFill: true, isDisable: false)
                ),
              ))
            ],
          )
      ),
    );
  }
}

class _StudentMultipleChoice extends MultipleStudentChoice {
  @override
  void Function()? nextBtnOnClick(List<DimigoinUser> selectStudentList) {
    return () {
      Get.find<MealExceptionPageController>().selectUserList.value = selectStudentList;

      Get.back();
    };
  }

}
