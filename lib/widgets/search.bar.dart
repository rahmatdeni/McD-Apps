import 'package:flutter/material.dart';
import 'package:mcd_app/style/app.color.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Icon icon;
  const SearchBar({Key key, this.controller, this.hint, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: '${hint}',
        hintStyle: TextStyle(
          color: darkGrey,
        ),
        suffixIcon: icon,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 5.0),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
