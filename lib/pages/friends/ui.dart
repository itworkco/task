import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:task/commons/widgets/back_button.dart';
import 'package:task/commons/widgets/friend_tiles.dart';
import 'package:task/emergency/constants.dart';
import 'package:task/pages/friends/logic.dart';
import 'package:task/pretend_api.dart';

class FriendsUi extends StatelessWidget {
  static const route = '/friends';

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;
    FriendsLogic logic = Provider.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => logic.addFriend(),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.white.withOpacity(0.9),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Align(alignment: Alignment.centerLeft, child: MyBackButton()),
          Text(
            'سيتم إرسال موقعك الحالي لأرقام الطوارئ الخاصة بك\n عند الضغط على زر الطوارئ',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w100),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Container(
              height: 35.h,
              width: 35.w,
              child: Center(
                child: Image.asset(
                  '${EmergencyConstants.imagesPath}iconfinder_alarm__alert__light__emergency_2542103@3x.png',
                  height: 20.h,
                  width: 20.w,
                ),
              ),
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ),
          ),
          Text.rich(
            TextSpan(
              text: 'أضف أرقام الطوارئ\n',
              children: <TextSpan>[
                TextSpan(
                  text: 'حد أقصى 4',
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Expanded(
              child: ReorderableListView(
                onReorder: logic.onRecoreder,
                children: [
                  for (int i = 0; i < PretendApi.friends.length; i++)
                    FriendsTile(
                      valueKey: ValueKey(i),
                      i: i,
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(FontAwesomeIcons.trash),
                            onPressed: () => logic.deleteFriend(i),
                          ),
                          Icon(
                            FontAwesomeIcons.gripVertical,
                            color: Color(0xff707070),
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
