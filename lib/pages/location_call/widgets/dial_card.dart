import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task/main.dart';
import 'package:task/pages/location_call/logic.dart';

class DialCard extends StatelessWidget {
  final String image, text, number;
  DialCard({this.text, this.number, this.image});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;
    LocationCallLogic logic = Provider.of(context);

    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: shadowColor, blurRadius: 2, spreadRadius: 2)
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  children: <Widget>[
                    Spacer(
                      flex: 3,
                    ),
                    Image.asset(
                      image,
                      width: 30.w,
                      height: 30.h,
                    ),
                    Spacer(),
                    Text(
                      text,
                    ),
                    Spacer(),
                    Text(
                      number,
                      style: textTheme.bodyText2
                          .copyWith(color: Color(0xff707070)),
                    ),
                    Spacer(
                      flex: 2,
                    )
                  ],
                )),
            Material(
                color: Colors.transparent,
                elevation: 0,
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  onTap: () {
                    logic.callNumber(number);
                  },
                ))
          ],
        ),
      ),
    );
  }
}
