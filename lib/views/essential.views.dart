import 'package:flutter/material.dart';
import 'package:mcd_app/models/food.models.dart';
import 'package:mcd_app/widgets/essential.item.card.dart';

class EssentialViews extends StatelessWidget {
  final List essentialItems;
  final double itemWidth;
  final double itemHeight;
  const EssentialViews({this.essentialItems, this.itemHeight, this.itemWidth});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: (itemWidth / itemHeight),
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      padding: EdgeInsets.all(10),
      children: List.generate(essentialItems.length, (index) {
        FoodModels food = FoodModels.fromJson(essentialItems[index]);

        return EssentialItemCard(
          food: food,
        );
      }),
    );
  }
}
