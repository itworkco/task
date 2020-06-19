import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../pretend_api.dart';

class FriendsTile extends StatelessWidget {
  Widget trailing;
  int i;
  FriendsTile({this.trailing, this.i});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
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
        Divider(),
      ],
    );
  }
}
