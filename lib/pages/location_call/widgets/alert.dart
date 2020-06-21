import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task/emergency/constants.dart';
import 'package:task/pages/location_call/logic.dart';

/*
AvatarGlow(
endRadius: logic.endRadiusGlow,
animate: true,
repeat: true,
glowColor: themeData.primaryColorLight,
child:
*/
class AlertCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    LocationCallLogic logic = Provider.of(context);
    return Stack(
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: themeData.primaryColorDark,
                    blurRadius: 3,
                    spreadRadius: 0.5)
              ],
              color: themeData.primaryColor,
            ),
            height: logic.alertSize.h,
            width: logic.alertSize.w,
            child: Center(
              child: FractionallySizedBox(
                heightFactor: 0.9,
                widthFactor: 0.9,
                child: Container(
                  child: Center(
                      child: FractionallySizedBox(
                    heightFactor: 0.6,
                    widthFactor: 0.6,
                    child: Image.asset(
                      '${EmergencyConstants.imagesPath}iconfinder_alarm__alert__light__emergency_2542103@3x.png',
                    ),
                  )),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: themeData.primaryColor,
                      border: Border.all(
                          color: themeData.primaryColorLight, width: 3)),
                ),
              ),
            )),
        Positioned.fill(
            child: Material(
          color: Colors.transparent,
          type: MaterialType.circle,
          child: InkWell(
            customBorder: CircleBorder(),
            onTap: logic.navigateToSendLocation,
          ),
        ))
      ],
    );
  }
}
