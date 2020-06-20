import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:task/commons/widgets/alert_dialog.dart';

import '../logic.dart';

class PoliceDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    LocationCallLogic logic = Provider.of(context);

    return MyAlertDialog(
      title: 'هل تود الاتصال بالشرطة؟',
      onPressedConfirm: () => logic.callNumber(logic.policeNumber),
      confirm: 'إتصال',
      icon: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Center(
            child: Icon(
              FontAwesomeIcons.phone,
              size: 50,
            ),
          ),
          Positioned(
            right: 185,
            bottom: 30,
            child: RotationTransition(
              turns: AlwaysStoppedAnimation(300 / 360),
              child: Container(
                color: themeData.accentColor,
                height: 30.h,
                width: 5,
              ),
            ),
          ),
          Positioned(
            right: 173.w,
            bottom: 46.h,
            child: RotationTransition(
              turns: AlwaysStoppedAnimation(180 / 360),
              child: Container(
                color: themeData.accentColor,
                height: 25.h,
                width: 5,
              ),
            ),
          ),
          Positioned(
            left: 140.w,
            bottom: 20.h,
            child: RotationTransition(
              turns: AlwaysStoppedAnimation(100 / 360),
              child: Container(
                color: themeData.accentColor,
                height: 25.h,
                width: 5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
