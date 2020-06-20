import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
import 'package:task/commons/paths/Images.dart';
import 'package:task/commons/widgets/back_button.dart';
import 'package:task/pretend_api.dart';

import 'logic.dart';
import 'widgets/dashed_circle.dart';
/*
/*
                        Transform.translate(
                          offset: Offset(
                              secondAvatarAnim.value.get(AniProps.dx),
                              secondAvatarAnim.value.get(AniProps.dy)),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://i.pinimg.com/originals/fb/22/e0/fb22e0ebdc493fd74113072b37fe450a.jpg'),
                            radius: secondAvatarAnim.value.get(AniProps.radius),
                          ),
                        ),
*/

//                        SlideTransition(
//                          position: firstAvatarAnimation,
//                          child: CircleAvatar(
//                            backgroundImage: NetworkImage(
//                                'https://i.pinimg.com/originals/fb/22/e0/fb22e0ebdc493fd74113072b37fe450a.jpg'),
//                            radius: firstAvatarScaleAnimation.value,
//                          ),
//                        ),

                        Transform.translate(
                          offset: Offset(firstAvatarAnim.value.get(AniProps.dx),
                              firstAvatarAnim.value.get(AniProps.dy)),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://i.pinimg.com/originals/fb/22/e0/fb22e0ebdc493fd74113072b37fe450a.jpg'),
                            radius: firstAvatarAnim.value.get(AniProps.radius),
                          ),
                        ),

enum AniProps { dx, dy, radius }
  Animation<MultiTweenValues<AniProps>> firstAvatarAnim;
  Animation<MultiTweenValues<AniProps>> secondAvatarAnim;

 */

class SendLocationRoot extends StatefulWidget {
  @override
  _SendLocationRootState createState() => _SendLocationRootState();
}

class _SendLocationRootState extends State<SendLocationRoot>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: SendLocationUi(),
      create: (BuildContext context) => SendLocationLogic(this),
    );
  }
}

class SendLocationUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SendLocationLogic logic = Provider.of(context);
    return Stack(children: <Widget>[
      Scaffold(),
      Positioned.fill(
          child: Material(
              child: Container(
                  color: Colors.red.withOpacity(0.9),
                  child: Column(children: [
                    Spacer(),
                    Align(
                      child: MyBackButton(),
                      alignment: Alignment.centerLeft,
                    ),
                    Spacer(),
                    Text('إرسال موقعك'),
                    Spacer(),
                    Text('يتم إرسال موقعك لأرقام الطوارئ الخاصة بك'),
                    Spacer(flex: 4),
                    Stack(
                      children: <Widget>[
                        ScaleTransition(
                          scale: logic.dashedCircleScaleAnimation,
                          child: Stack(
                            children: <Widget>[
                              MyDashedCircle(200, 200),
                              Positioned.fill(
                                child: Center(child: MyDashedCircle(150, 150)),
                              ),
                            ],
                          ),
                        ),
                        Positioned.fill(
                            child: Center(
                                child: Image.asset(
                          ImagesPath.alarm,
                          color: Colors.white,
                          height: 80,
                          width: 80,
                        ))),
                      ],
                    ),
                    Spacer(
                      flex: 4,
                    ),
                    SlideTransition(
                      position: logic.friendsRowAnimation,
                      child: Row(
                        children: <Widget>[
                          Spacer(
                            flex: 8,
                          ),
                          SlideTransition(
                            position: logic.thirdAndFourthAvatarAnimation,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://i.pinimg.com/originals/fb/22/e0/fb22e0ebdc493fd74113072b37fe450a.jpg'),
                              radius: 20,
                            ),
                          ),
                          Spacer(),
                          SlideTransition(
                            position: logic.thirdAndFourthAvatarAnimation,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://i.pinimg.com/originals/fb/22/e0/fb22e0ebdc493fd74113072b37fe450a.jpg'),
                              radius: 20,
                            ),
                          ),
                          Spacer(),
                          AnimatedBuilder(
                            animation: logic.friendsOpacityAnimation,
                            builder: (BuildContext context, Widget child) =>
                                SlideTransition(
                              position: logic.secondAvatarAnimation,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://i.pinimg.com/originals/fb/22/e0/fb22e0ebdc493fd74113072b37fe450a.jpg'),
                                radius: logic.avatarScaleAnimation.value,
                              ),
                            ),
                          ),
                          Spacer(),
                          AnimatedBuilder(
                            animation: logic.friendsOpacityAnimation,
                            builder: (BuildContext context, Widget child) =>
                                SlideTransition(
                              position: logic.firstAvatarAnimation,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://i.pinimg.com/originals/fb/22/e0/fb22e0ebdc493fd74113072b37fe450a.jpg'),
                                radius: logic.avatarScaleAnimation.value,
                              ),
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Spacer(
                            flex: 8,
                          ),
                        ],
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    FadeTransition(
                      opacity: logic.friendsOpacityAnimation,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          for (int i = 0; i < 2; i++)
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: ListTile(
                                contentPadding: EdgeInsets.only(right: 80.w),
                                trailing: logic.checkMark == null
                                    ? null
                                    : Icon(logic.checkMark),
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
                        ],
                      ),
                    ),
                    Spacer(
                      flex: 15,
                    )
                  ])))),
      FloatingActionButton(onPressed: () {
        logic.startCycle();
      })
    ]);
  }
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Scaffold(),
      Positioned.fill(
          child: Material(
              child: Container(
                  color: Colors.red.withOpacity(0.9),
                  child: Column(children: [
                    Spacer(),
                    Align(
                        alignment: Alignment(-0.8, 0),
                        child: IconButton(
                            icon: Icon(Icons.arrow_forward_ios),
                            onPressed: () {})),
                    Spacer(),
                    Text('إرسال موقعك'),
                    Spacer(),
                    Text('يتم إرسال موقعك لأرقام الطوارئ الخاصة بك'),
                    Spacer(flex: 4),
                    Stack(
                      children: <Widget>[
                        MirrorAnimation(
                            curve: Curves.bounceInOut,
                            duration: Duration(milliseconds: 700),
                            tween: 0.3.tweenTo(1.3),
                            builder: (BuildContext context, Widget child,
                                double value) {
                              return Transform.scale(
                                  scale: value,
                                  child: Column(
                                    children: <Widget>[
                                      Stack(
                                        children: <Widget>[
                                          MyDashedCircle(200, 200),
                                          Positioned.fill(
                                            child: Center(
                                                child:
                                                    MyDashedCircle(150, 150)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ));
                            }),
                        Positioned.fill(
                            child: Center(
                                child: Image.asset(
                          ImagesPath.alarm,
                          color: Colors.white,
                          height: 80,
                          width: 80,
                        ))),
                      ],
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    MirrorAnimation(
                      curve: Curves.bounceInOut,
                      duration: Duration(milliseconds: 700),
                      tween: 0.0.tweenTo(20),
                      builder: (BuildContext context, Widget child, value) {
                        return Padding(
                          padding: EdgeInsets.only(
                              right: 50.w, left: 50.w, top: value),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              for (var i = 0; i < 4; i++)
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://i.pinimg.com/originals/fb/22/e0/fb22e0ebdc493fd74113072b37fe450a.jpg'),
                                  radius: 20,
                                )
                            ],
                          ),
                        );
                      },
                    ),
                    Spacer(
                      flex: 15,
                    )
                  ]))))
    ]);
  }
}
