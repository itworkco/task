import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:task/pages/location_call/logic.dart';

class NumbersList extends StatelessWidget {
  List<Map> list;
  NumbersList(this.list);
  @override
  Widget build(BuildContext context) {
    LocationCallLogic logic = Provider.of(context);
    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;

    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          var element = list[index];
          var name = element['name'];
          var number = element['number'];

          return Padding(
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
                          Text(name),
                          Spacer(
                            flex: 10,
                          ),
                          Text(number),
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
          );
        });
  }
}
