import 'package:flutter/material.dart';

class CloseDialogButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          Navigator.pop(context);
        });
  }
}
