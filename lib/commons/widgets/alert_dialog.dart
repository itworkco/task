import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/main.dart';

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

    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: 345.w,
          height: 234.h,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Spacer(
                flex: 4,
              ),
              Text(title),
              Spacer(
                flex: 3,
              ),
              icon,
              Spacer(
                flex: 3,
              ),
              ButtonTheme(
                height: 53.h,
                colorScheme: ColorScheme.dark(),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20))),
                            onPressed: () => Navigator.pop(context),
                            color: Color(0xffBFBFBF),
                            child: Text('إلغاء'))),
                    Expanded(
                        child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20))),
                            onPressed: () {
                              Navigator.pop(context);
                              onPressedConfirm();
                            },
                            color: accentColor,
                            child: Text(confirm))),
                  ],
                ),
              )
/*

*/
            ],
          ),
        ),
      ),
    );
  }
}

/*

 */
