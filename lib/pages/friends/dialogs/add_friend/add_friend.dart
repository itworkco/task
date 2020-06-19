import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:task/commons/paths/Images.dart';
import 'package:task/emergency/constants.dart';
import 'package:task/pages/country_select/ui.dart';
import 'package:task/pages/friends/dialogs/add_friend/text_field.dart';
import 'package:task/pages/friends/dialogs/choose_picker/ui.dart';
import 'package:task/pages/friends/dialogs/close_button.dart';

import '../../logic.dart';

class AddFriendDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;
    FriendsLogic logic = Provider.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Align(alignment: Alignment.centerLeft, child: CloseDialogButton()),
        Center(
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 50,
                  backgroundImage: logic.selectedImagePath == null
                      ? AssetImage(ImagesPath.alarm)
                      : FileImage(File(logic.selectedImagePath))),
              Positioned(
                right: -20,
                bottom: 0,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    FontAwesomeIcons.camera,
                    size: 35,
                  ),
                  onPressed: () {
                    showDialog(
                        context: context, builder: (_) => ChooseImagePicker());
                  },
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
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, CountrySelectRoot.route);
                      },
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
              color: themeData.accentColor,
            ),
          ),
        )
      ],
    );
  }
}
