import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task/pages/country_select/ui.dart';
import 'package:task/pages/friends/ui.dart';
import 'package:task/pages/location_call/logic.dart';
import 'package:task/pages/location_call/ui.dart';

import 'pages/friends/logic.dart';

BuildContext globalContext;
void main() {
  runApp(MultiProvider(
    child: MyMaterialApp(),
    providers: [
      ChangeNotifierProvider(create: (BuildContext context) => FriendsLogic()),
      ChangeNotifierProvider(
        create: (BuildContext context) => LocationCallLogic(),
      ),
    ],
  ));
}

var shadowColor = Color(0xffD6D6D6);

class MyMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColorDark: Color(0xffD6D6D6),
          primaryColorLight: Color(0xffE00E37),
          dialogTheme: DialogTheme(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(19)))),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: accentColor,
            elevation: 3,
          ),
          buttonTheme: ButtonThemeData(
            colorScheme: ColorScheme.dark(),
          ),
          fontFamily: 'Sukar Bold',
          iconTheme: IconThemeData(color: accentColor),
          primaryColor: Color(0xffFBFCFC),
          backgroundColor: Colors.white,
          accentColor: accentColor,
        ),
        home: MyApp());
  }
}

var accentColor = Color(0xff4EA1B5);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 809, allowFontScaling: true);
    return MaterialApp(
      routes: {
        LocationCallUi.route: (_) => LocationCallUi(),
        FriendsUi.route: (_) => FriendsUi(),
        CountrySelectRoot.route: (_) => CountrySelectRoot()
      },
//      home: SendLocationRoot(),
      initialRoute: LocationCallUi.route,
      theme: ThemeData(
        primaryColorDark: Color(0xffD6D6D6),
        primaryColorLight: Color(0xffE00E37),
        dialogTheme: DialogTheme(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(19)))),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: accentColor,
          elevation: 3,
        ),
        buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.dark(),
        ),
        fontFamily: 'Sukar Bold',
        iconTheme: IconThemeData(color: accentColor),
        primaryColor: Color(0xffFBFCFC),
        backgroundColor: Colors.white,
        accentColor: accentColor,
        textTheme: TextTheme(
            button: TextStyle(color: Colors.white),
            headline5: TextStyle(color: accentColor),
            subtitle2: TextStyle(
                color: Color(0xff707070), fontWeight: FontWeight.w900),
            subtitle1:
                TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
            bodyText2: TextStyle(fontWeight: FontWeight.w900, fontSize: 11.sp)),
      ),
      debugShowCheckedModeBanner: false,
      builder: (context, widget) {
        return SafeArea(
            child: ListTileTheme(iconColor: accentColor, child: widget));
      },
    );
  }
}
