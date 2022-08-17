import 'package:dalgeurak_meal_application/themes/text_theme.dart';
import 'package:dalgeurak_widget_package/themes/color_theme.dart';
import 'package:dimigoin_flutter_plugin/dimigoin_flutter_plugin.dart';
import 'package:flutter/material.dart';


class FoodSelectContainer extends StatelessWidget {
  final ConvenienceFoodType foodType;
  final int leftPeopleAmount;
  final bool isSelect;
  FoodSelectContainer({required this.foodType, required this.leftPeopleAmount, required this.isSelect});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 330,
      height: 120,
      decoration: BoxDecoration(
        color: isSelect ? dalgeurakBlueOne : Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 14, bottom: 14),
      margin: const EdgeInsets.only(bottom: 15),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${foodType.convertKor}", style: foodSelectContainer_foodName.copyWith(color: (isSelect ? Colors.white : Colors.black))),
                SizedBox(height: 8),
                Text("${foodType.convertDescription}", style: foodSelectContainer_foodDescription.copyWith(color: (isSelect ? Colors.white : Colors.black))),
                SizedBox(height: 14),
                Text("남은 인원 : $leftPeopleAmount명", style: foodSelectContainer_leftPeople.copyWith(color: (isSelect ? Colors.white : Colors.black)))
              ],
            ),
            Image.asset(
              "assets/images/convenience_${foodType.convertEng}.png",
              package: "dalgeurak_meal_application",
              width: 80,
            )
          ],
        )
      ),
    );
  }
}