import 'package:flutter/material.dart';

class MyBackButton extends StatelessWidget {
  Color color;
  MyBackButton({this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: this.color,
        ),
        onPressed: () {
          Navigator.pop(context);
        });
  }
}
