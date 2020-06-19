import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:task/commons/widgets/search_field.dart';
import 'package:task/main.dart';
import 'package:task/pages/location_call/logic.dart';

class OtherNumbersSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocationCallLogic logic = Provider.of(context);
    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;

    return AnimatedContainer(
      duration: Duration(),
      height: logic.bottomSheetHeight.h,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              spreadRadius: 5,
              blurRadius: 5,
            ),
          ],
          borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          GestureDetector(
            onVerticalDragUpdate: logic.onVerticalDragUpdate,
            onVerticalDragEnd: logic.onVerticalDragEnd,
            child: Container(
              color: Colors.transparent,
              height: (20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 5,
                    width: 50,
                    decoration: BoxDecoration(
                        color: themeData.accentColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: SearchField(
                  onTap: logic.expandOtherNumbers,
                )),
          ),
          Expanded(
            child: Material(
              color: themeData.primaryColor.withOpacity(0.5),
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: EdgeInsets.only(
                      right: 10.w,
                      left: 10.w,
                      top: index == 0 ? 20.h : 10.h,
                      bottom: 10.h),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: shadowColor, spreadRadius: 1, blurRadius: 2)
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: ListTile(
                      onTap: () {},
                      leading: Icon(FontAwesomeIcons.phone),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('النجدة'),
                          Text('112'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
