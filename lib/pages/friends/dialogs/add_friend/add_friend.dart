import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task/emergency/constants.dart';
import 'package:task/pages/friends/dialogs/add_friend/text_field.dart';
import 'package:task/pretend_api.dart';

class AddFriendDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Align(
            alignment: Alignment.centerLeft,
            child: IconButton(icon: Icon(Icons.close), onPressed: () {})),
        Center(
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(PretendApi.friends[0]['avatar']),
              ),
              Positioned(
                right: -20,
                bottom: 0,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    FontAwesomeIcons.camera,
                    size: 35,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        AddFriendTextField(
          title: 'إسم المستلم',
          hint: 'ادخل اسم المستلم',
          textInputType: TextInputType.text,
        ),
        AddFriendTextField(
          title: 'هاتف المستلم',
          hint: 'ادخل الهاتف',
          textInputType: TextInputType.phone,
          suffix: Positioned.fill(
            child: Align(
              alignment: Alignment(-0.9, 0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border:
                              Border(right: BorderSide(color: Colors.black))),
                      width: 80.w,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 12,
                            backgroundImage:
                                AssetImage(EmergencyConstants.oman),
                          ),
                          Text('+20'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: 24.h, bottom: 18.h),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              onPressed: () {},
              child: Text('إضافة'),
              color: themeData.primaryColor,
            ),
          ),
        )
      ],
    );
  }
}
