import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../logic.dart';

class ImagePickerOption extends StatelessWidget {
  String title;
  Widget icon;
  GestureTapCallback onTap;
  ImagePickerOption({this.title, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    FriendsLogic logic = Provider.of(context);

    return InkWell(
      onTap: this.onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          icon,
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Text(this.title),
          )
        ],
      ),
    );
  }
}
