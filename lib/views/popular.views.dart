import 'package:flutter/material.dart';
import 'package:mcd_app/models/food.models.dart';
import 'package:mcd_app/widgets/popular.item.card.dart';

class PopularViews extends StatelessWidget {
  final List popularItemsss;
  const PopularViews({this.popularItemsss});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: popularItemsss.length,
      itemBuilder: (context, index) {
        FoodModels food = FoodModels.fromJson(popularItemsss[index]);

        return PopularItemCards(
          food: food,
        );
      },
    );
  }
}
