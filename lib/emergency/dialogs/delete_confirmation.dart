import 'package:flutter/material.dart';

class DeleteConfirmation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('هل أنت متاكد من الحذف؟'),
              Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Positioned(
                    left: -15,
                    child: Icon(
                      Icons.delete,
                      size: 40,
                    ),
                  ),
                  Positioned(
                    right: -15,
                    child: Icon(
                      Icons.delete,
                      size: 40,
                    ),
                  ),
                  Icon(
                    Icons.delete,
                    size: 60,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
