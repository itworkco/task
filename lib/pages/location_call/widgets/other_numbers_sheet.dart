import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:task/commons/widgets/search_field.dart';
import 'package:task/pages/location_call/logic.dart';

class OtherNumbersSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocationCallLogic logic = Provider.of(context);
    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;
    KeyboardVisibility.onChange.listen((show) {
      print(show);
      if (show) {
        logic.collapseOtherNumbers();
      } else {
        logic.expandOtherNumbers();
      }
    });

    return AnimatedContainer(
      duration: Duration(),
      height: logic.bottomSheetHeight.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: themeData.primaryColorDark,
                  spreadRadius: 4,
                  blurRadius: 6,
                ),
              ],
            ),
            child: SizedBox.fromSize(
              size: Size.fromHeight(101.h),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onVerticalDragUpdate: logic.onVerticalDragUpdate,
                    onVerticalDragEnd: logic.onVerticalDragEnd,
                    child: Container(
                      color: Colors.transparent,
                      height: (30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 5,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Color(0xffA6D0DA),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: SearchField()),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: EdgeInsets.only(
                      right: 10.w,
                      left: 10.w,
                      top: index == 0 ? 20.h : 10.h,
                      bottom: 10.h),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 23.w, right: 18.w),
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: themeData.primaryColorDark,
                                spreadRadius: 0.5,
                                blurRadius: 6)
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 5.w),
                              child: Icon(
                                FontAwesomeIcons.phone,
                                size: 24.h,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Spacer(
                                  flex: 8,
                                ),
                                Text('النجدة'),
                                Spacer(
                                  flex: 10,
                                ),
                                Text('112'),
                                Spacer(
                                  flex: 8,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned.fill(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            onTap: () => logic.callNumber('112'),
                          ),
                        ),
                      )
                    ],
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
