import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagePickerOption extends StatelessWidget {
  String title;
  Widget icon;
  ImagePickerOption({this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        icon,
        Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Text(this.title),
        )
      ],
    );
  }
}
