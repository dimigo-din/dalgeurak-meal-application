import 'package:dalgeurak_widget_package/themes/color_theme.dart';
import 'package:dalgeurak_widget_package/widgets/blue_button.dart';
import 'package:dalgeurak_widget_package/widgets/checkbox.dart';
import 'package:dalgeurak_widget_package/widgets/reason_textfield.dart';
import 'package:dalgeurak_widget_package/widgets/toast.dart';
import 'package:dalgeurak_widget_package/widgets/window_title.dart';
import 'package:dimigoin_flutter_plugin/dimigoin_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../themes/text_theme.dart';
import 'controller.dart';

class MealCancelPage extends GetView<MealCancelPageController> {
  const MealCancelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dalgeurakGrayOne,
      body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: Get.height * 0.115,
                left: Get.width * 0.1,
                child: WindowTitle(
                  subTitle: "급식 취소",
                  title: "신청",
                ),
              ),
              Positioned(
                top: Get.height * 0.15,
                right: Get.width * 0.1,
                child: GestureDetector(onTap: () => Get.back(), child: SvgPicture.asset("assets/images/icons/close.svg", width: 18, color: Colors.black))
              ),
              Positioned(
                top: Get.height * 0.24,
                child: Container(
                  width: 350,
                  height: Get.height * 0.52,
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
                          Text("변경 사유", style: containerMenu),
                          SizedBox(height: 18),
                          ReasonTextField(hintText: "변경 사유를 입력해주세요.", textController: controller.reasonTextController, isBig: false),
                          SizedBox(height: 32),
                          Text("변경 기간", style: containerMenu),
                          SizedBox(height: 18),
                          Row(
                            children: [
                              Container(
                                width: 250,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
                                  border: Border.all(
                                    width: 1,
                                    color: dalgeurakGrayTwo,
                                  ),
                                ),
                                padding: const EdgeInsets.all(12),
                                child: Obx(() {
                                  late String text;
                                  PickerDateRange? selectDate = controller.selectDate.value;

                                  if (selectDate.startDate == null) {
                                    text = "";
                                  } else {
                                    text = "${selectDate.startDate?.month}월 ${selectDate.startDate?.day}일";

                                    if (selectDate.endDate != null) {
                                      text = text + " ~ ${selectDate.endDate?.month}월 ${selectDate.endDate?.day}일";
                                    }
                                  }

                                  return Text(text, style: datePicker_selectDate);
                                }),
                              ),
                              GestureDetector(
                                onTap: () => Get.dialog(
                                  Dialog(
                                    child: Container(
                                      height: Get.height * 0.6,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(16))
                                      ),
                                      child: SfDateRangePicker(
                                        onSelectionChanged: controller.onSelectionChanged,
                                        selectionMode: DateRangePickerSelectionMode.range,
                                        showActionButtons: true,
                                        confirmText: "선택",
                                        cancelText: "취소",
                                        onCancel: () => Get.back(),
                                        onSubmit: (Object? value) {
                                          try {
                                            PickerDateRange date = (value as PickerDateRange);
                                            controller.selectDate.value = date;
                                          } catch (e) {
                                            DalgeurakToast().show("날짜를 선택하지 않으셨습니다. 선택한 후 다시 시도해주세요.");
                                          } finally {
                                            Get.back();
                                          }
                                        }
                                      ),
                                    ),
                                  )
                                ),
                                child: Container(
                                  width: 50,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
                                    border: Border.all(
                                      width: 1,
                                      color: dalgeurakGrayFour,
                                    ),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "assets/images/icons/calendar.svg",
                                      width: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 32),
                          Text("변경 신청 급식", style: containerMenu),
                          SizedBox(height: 18),
                          Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap: () => controller.selectMeal[MealType.breakfast] = !controller.selectMeal[MealType.breakfast],
                                  child: DalgeurakCheckBox(content: "조식", isOn: controller.selectMeal[MealType.breakfast], checkBoxType: DalgeurakCheckBoxType.window)
                              ),
                              GestureDetector(
                                  onTap: () => controller.selectMeal[MealType.lunch] = !controller.selectMeal[MealType.lunch],
                                  child: DalgeurakCheckBox(content: "중식", isOn: controller.selectMeal[MealType.lunch], checkBoxType: DalgeurakCheckBoxType.window)
                              ),GestureDetector(
                                  onTap: () => controller.selectMeal[MealType.dinner] = !controller.selectMeal[MealType.dinner],
                                  child: DalgeurakCheckBox(content: "석식", isOn: controller.selectMeal[MealType.dinner], checkBoxType: DalgeurakCheckBoxType.window)
                              ),

                            ],
                          ))
                        ],
                      )
                  ),
                )
              ),
              Positioned(
                  bottom: Get.height * 0.12,
                  child: BlueButton(content: "신청", isLong: false, isSmall: false, isFill: true, isDisable: false)
              )
            ],
          )
      ),
    );
  }
}
