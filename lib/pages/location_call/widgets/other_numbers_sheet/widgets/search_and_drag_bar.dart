import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task/commons/widgets/search_field/ui.dart';
import 'package:task/pages/location_call/logic.dart';

class SearchAndDragBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocationCallLogic logic = Provider.of(context);
    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;

    return Container(
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
                    suffix: logic.suffix,
                    onTabClear: logic.onTapClear,
                    controller: logic.searchFieldController,
                    valueChanged: logic.onChangedSearch,
                    focusNode: logic.searchFocusNode,
                  )),
            ),
            Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
