import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task/pages/location_call/logic.dart';
import 'package:task/pages/location_call/widgets/other_numbers_sheet/widgets/search_and_drag_bar.dart';

class OtherNumbersSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocationCallLogic logic = Provider.of(context);
    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;
    return AnimatedContainer(
      duration: Duration(),
      height: logic.bottomSheetHeight.h,
      child: Column(
        children: <Widget>[
          SearchAndDragBar(),
          Expanded(child: logic.numbersSheetBody),
        ],
      ),
    );
  }
}

/*

 */
