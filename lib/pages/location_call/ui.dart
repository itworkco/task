import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task/emergency/constants.dart';
import 'package:task/pages/location_call/logic.dart';
import 'package:task/pages/location_call/widgets/alert.dart';
import 'package:task/pages/location_call/widgets/dial_card.dart';

import 'widgets/other_numbers_sheet.dart';

class LocationCallUi extends StatelessWidget {
  static const route = '/location_call';

  @override
  Widget build(BuildContext context) {
    LocationCallLogic logic = Provider.of(context);
    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;
    return FutureBuilder<String>(
        future: logic.isoCountryCode,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: PreferredSize(
                child: Container(
                  decoration: BoxDecoration(
                      color: themeData.accentColor,
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 1,
                            blurRadius: 4,
                            color: Color(0xffD6D6D6))
                      ]),
                  height: 80.h,
                  padding: EdgeInsets.only(left: 10.w),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        child: Icon(Icons.arrow_back_ios),
                        alignment: Alignment.centerLeft,
                      ),
                      Center(
                        child: Text(
                          'الطوارئ',
                          style: textTheme.headline5,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            logic.mycountry == null
                                ? SizedBox.shrink()
                                : Image.asset(
                                    logic.mycountry.flag,
                                    height: 30.h,
                                    width: 30.w,
                                  ),
                            IconButton(
                              icon: Icon(
                                Icons.add,
                                size: 30,
                              ),
                              onPressed: () {
                                logic.scrollController.jumpTo(0.0);
                                ;
                              },
                              padding: EdgeInsets.zero,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                preferredSize: Size.fromHeight(80.h),
              ),
              body: Stack(
                children: <Widget>[
                  LayoutBuilder(
                    builder: (BuildContext context,
                            BoxConstraints viewportConstraints) =>
                        SingleChildScrollView(
                      reverse: true,
                      controller: logic.scrollController,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            minHeight: viewportConstraints.maxHeight),
                        child: IntrinsicHeight(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Spacer(
                                flex: 4,
                              ),
                              AlertCircle(),
                              Padding(
                                padding: EdgeInsets.only(bottom: 10.h),
                                child: Center(
                                    child: Text('إرسال موقعك لأرقام الطوارئ')),
                              ),
                              Spacer(),
                              SizedBox.fromSize(
                                size: Size.fromHeight(116.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    DialCard(
                                      image: EmergencyConstants.ambulance,
                                      number: '222',
                                      text: 'إتصال بالإسعاف',
                                    ),
                                    DialCard(
                                      image: EmergencyConstants.police,
                                      number: '222',
                                      text: 'إتصال بالشرطة',
                                    ),
                                    DialCard(
                                      image: EmergencyConstants.fire,
                                      number: '222',
                                      text: 'إتصال بالإطفاء',
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(
                                flex: 3,
                              ),
                              Spacer(),
                              OtherNumbersSheet()
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.9, 0.9),
                    child: Padding(
                      padding:
                          EdgeInsets.only(bottom: (logic.bottomSheetHeight)),
                      child: FloatingActionButton(
                        onPressed: () => logic.getMyAddress(context),
                        child: Icon(
                          Icons.gps_fixed,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}