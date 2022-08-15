import 'package:dalgeurak_meal_application/themes/text_theme.dart';
import 'package:dalgeurak_widget_package/themes/color_theme.dart';
import 'package:flutter/material.dart';

enum ConvenienceFoodType {
  sandwich,
  salad,
  misu,
  none
}

extension ConvenienceFoodTypeExtension on ConvenienceFoodType {
  String get convertKor {
    switch (this) {
      case ConvenienceFoodType.sandwich: return "샌드위치";
      case ConvenienceFoodType.salad: return "샐러드";
      case ConvenienceFoodType.misu: return "선식";
      default: return "";
    }
  }

  String get convertEng {
    switch (this) {
      case ConvenienceFoodType.sandwich: return "sandwich";
      case ConvenienceFoodType.salad: return "salad";
      case ConvenienceFoodType.misu: return "misu";
      default: return "";
    }
  }

  String get convertDescription {
    switch (this) {
      case ConvenienceFoodType.sandwich: return "다양한 종류의 샌드위치가\n매일매일을 즐겁게 만들거에요";
      case ConvenienceFoodType.salad: return "신선한 채소와 함께 취향에 맞는\n드레싱을 뿌려 먹어보세요";
      case ConvenienceFoodType.misu: return "초콜릿, 말차, 견과류, 코코넛 등\n다양한 맛이 준비되어 있어요";
      default: return "";
    }
  }
}

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
              width: 80,
            )
          ],
        )
      ),
    );
  }
}