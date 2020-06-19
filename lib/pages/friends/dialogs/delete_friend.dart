import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/commons/widgets/alert_dialog.dart';

import '../logic.dart';

class DeleteFriendDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FriendsLogic logic = Provider.of(context);

    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;
    FriendsLogic friendsLogic = Provider.of(context, listen: false);
    return MyAlertDialog(
      title: 'هل أنت متأكد من الحذف ؟',
      confirm: 'تأكيد الحذف',
      onPressedConfirm: logic.confirmDelete,
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
              color: themeData.accentColor,
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
