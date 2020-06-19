import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAlertDialog extends StatelessWidget {
  //هل أنت متاكد من الحذف؟
  final String title, confirm;
  final VoidCallback onPressedConfirm;
  final Widget icon;
  MyAlertDialog({this.title, this.confirm, this.icon, this.onPressedConfirm});
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 21.h, bottom: 32.5.h),
          child: Text(title),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 39.h),
          child: icon,
        ),
        ButtonTheme(
          height: 53.h,
          colorScheme: ColorScheme.dark(),
          textTheme: ButtonTextTheme.normal,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(19))),
                      onPressed: () => Navigator.pop(context),
                      color: Color(0xffBFBFBF),
                      child: Text('إلغاء'))),
              Expanded(
                  child: FlatButton(
                      color: themeData.primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(19))),
                      onPressed: onPressedConfirm,
                      child: Text(confirm))),
            ],
          ),
        )
/*

*/
      ],
    );
  }
}

/*

 */
