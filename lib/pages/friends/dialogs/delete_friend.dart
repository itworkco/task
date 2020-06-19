import 'package:flutter/material.dart';
import 'package:task/commons/widgets/alert_dialog.dart';

class DeleteFriendDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;

    return MyAlertDialog(
      title: 'هل أنت متأكد من الحذف ؟',
      confirm: 'تأكيد الحذف',
      onPressedConfirm: () {},
      icon: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            left: -15,
            child: Icon(
              Icons.delete,
              size: 40,
              color: Color(0xff707070),
            ),
          ),
          Positioned(
            right: -15,
            child: Icon(
              Icons.delete,
              size: 40,
              color: themeData.primaryColor,
            ),
          ),
          Icon(
            Icons.delete,
            color: Color(0xffE6213C),
            size: 60,
          ),
        ],
      ),
    );
  }
}
