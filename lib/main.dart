import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task/pages/country_select/ui.dart';
import 'package:task/pages/friends/ui.dart';
import 'package:task/pages/location_call/logic.dart';
import 'package:task/pages/location_call/ui.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => LocationCallLogic(), child: MyApp()));
}

var shadowColor = Color(0xffD6D6D6);

class MyApp extends StatelessWidget {
  @override
  var accentColor = Color(0xff4EA1B5);
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LocationCallUi.route: (_) => LocationCallUi(),
        FriendsRoot.route: (_) => FriendsRoot(),
        CountrySelectRoot.route: (_) => CountrySelectRoot()
      },
      initialRoute: LocationCallUi.route,
      theme: ThemeData(
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: accentColor,
            elevation: 3,
          ),
          buttonTheme: ButtonThemeData(
            colorScheme: ColorScheme.dark(),
          ),
          textTheme: TextTheme(
              button: TextStyle(color: Colors.white),
              headline5: TextStyle(color: accentColor),
              subtitle2: TextStyle(
                  color: Color(0xff707070), fontWeight: FontWeight.w900),
              subtitle1:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
              bodyText2: TextStyle(fontWeight: FontWeight.w900)),
          fontFamily: 'Sukar',
          iconTheme: IconThemeData(color: accentColor),
          primaryColor: Color(0xffFBFCFC),
          backgroundColor: Colors.white,
          accentColor: accentColor),
      debugShowCheckedModeBanner: false,
      builder: (context, widget) {
        ScreenUtil.init(context,
            width: 357, height: 809, allowFontScaling: true);

        return SafeArea(
            child: ListTileTheme(iconColor: accentColor, child: widget));
      },
    );
  }
}
