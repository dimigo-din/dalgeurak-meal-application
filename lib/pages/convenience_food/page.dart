import 'package:dalgeurak_meal_application/pages/convenience_food/widgets/food_select_container.dart';
import 'package:dalgeurak_widget_package/themes/color_theme.dart';
import 'package:dalgeurak_widget_package/widgets/window_title.dart';
import 'package:dalgeurak_widget_package/widgets/blue_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'controller.dart';

class ConvenienceFoodPage extends GetView<ConvenienceFoodPageController> {
  const ConvenienceFoodPage({Key? key}) : super(key: key);

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
                  subTitle: "간편식",
                  title: "신청",
                ),
              ),
              Positioned(
                top: Get.height * 0.15,
                right: Get.width * 0.1,
                child: SvgPicture.asset("assets/images/icons/close.svg", width: 18, color: Colors.black)
              ),
              Positioned(
                top: Get.height * 0.2,
                child: Obx(() => Column(
                  children: [
                    GestureDetector(
                      onTap: () => controller.selectConvenienceFoodType.value = ConvenienceFoodType.misu,
                      child: FoodSelectContainer(
                          foodType: ConvenienceFoodType.misu,
                          leftPeopleAmount: 50,
                          isSelect: controller.selectConvenienceFoodType.value == ConvenienceFoodType.misu
                      ),
                    ),
                    GestureDetector(
                      onTap: () => controller.selectConvenienceFoodType.value = ConvenienceFoodType.salad,
                      child: FoodSelectContainer(
                          foodType: ConvenienceFoodType.salad,
                          leftPeopleAmount: 50,
                          isSelect: controller.selectConvenienceFoodType.value == ConvenienceFoodType.salad
                      ),
                    ),
                    GestureDetector(
                      onTap: () => controller.selectConvenienceFoodType.value = ConvenienceFoodType.sandwich,
                      child: FoodSelectContainer(
                          foodType: ConvenienceFoodType.sandwich,
                          leftPeopleAmount: 50,
                          isSelect: controller.selectConvenienceFoodType.value == ConvenienceFoodType.sandwich
                      ),
                    ),
                  ],
                ))
              ),
              Positioned(
                bottom: Get.height * 0.12,
                child: BlueButton(content: "신청", isLong: false, isFill: true)
              )
            ],
          )
      ),
    );
  }
}
