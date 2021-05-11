import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:mcd_app/style/app.color.dart';
import 'package:mcd_app/widgets/search.bar.dart';

class SearchBarViews extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Icon icon;
  const SearchBarViews({Key key, this.controller, this.hint, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: SearchBar(
            controller: controller,
            hint: '${hint}',
            icon: icon,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.red[200], Colors.red[400]],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Icon(
              FlutterIcons.menu_mco,
              color: white,
            ),
          ),
        ),
      ],
    );
  }
}
