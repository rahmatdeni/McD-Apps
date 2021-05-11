import 'package:flutter/material.dart';
import 'package:mcd_app/style/app.color.dart';

class MenuItemCard extends StatelessWidget {
  final onTap;
  final int selectedMenu;
  final String title;
  final int index;
  const MenuItemCard({this.onTap, this.selectedMenu, this.title, this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 35,
          width: 120,
          decoration: BoxDecoration(
            color: selectedMenu == index ? red : darkGrey,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              '${title}',
              style: TextStyle(color: white),
            ),
          ),
        ),
      ),
    );
  }
}
