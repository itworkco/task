import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task/emergency/constants.dart';
import 'package:task/main.dart';
import 'package:task/pages/location_call/logic.dart';

class AlertCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    LocationCallLogic logic = Provider.of(context);
    return AvatarGlow(
        endRadius: logic.endRadiusGlow,
        animate: true,
        repeat: true,
        glowColor: Colors.red,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: shadowColor, blurRadius: 2, spreadRadius: 2)
            ],
            color: themeData.accentColor,
          ),
          height: logic.imageHeight.h,
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
                    color: themeData.accentColor,
                    border: Border.all(color: Colors.red, width: 3)),
              ),
            ),
          ),
        ));
  }
}
