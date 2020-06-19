import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConfirmPoliceCall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'هل تود الاتصال بالشرطة؟',
                textAlign: TextAlign.center,
              ),
              Icon(FontAwesomeIcons.phoneVolume),
              ButtonTheme(
                height: 50.h,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: FlatButton(
                      padding: EdgeInsets.zero,
                      color: Colors.yellow,
                      onPressed: () {},
                      child: Text('إتصال'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10))),
                    )),
                    Expanded(
                        child: FlatButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            child: Text('إلغاء')))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
