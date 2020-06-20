import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../pretend_api.dart';

class FriendsTile extends StatelessWidget {
  Widget trailing;
  int i;
  ValueKey valueKey;
  FriendsTile({this.trailing, this.i, this.valueKey}) : super(key: valueKey);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      key: valueKey,
      children: <Widget>[
        Directionality(
          textDirection: TextDirection.rtl,
          child: ListTile(
            key: valueKey,
            trailing: this.trailing,
            leading: CircleAvatar(
              backgroundImage: NetworkImage(PretendApi.friends[i]['avatar']),
              radius: 25,
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.phone,
                    size: 15,
                    color: Color(0xff707070),
                  ),
                  Text(PretendApi.friends[i]['phone']),
                ],
              ),
            ),
            title: Text(PretendApi.friends[i]['name']),
          ),
        ),
        Divider(),
      ],
    );
  }
}
