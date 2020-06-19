import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
import 'package:task/commons/paths/Images.dart';
import 'package:task/commons/widgets/back_button.dart';
import 'package:task/commons/widgets/friend_tiles.dart';

import 'logic.dart';
import 'widgets/dashed_circle.dart';

class SendLocationRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: SendLocationUi(),
      create: (BuildContext context) => SendLocationLogic(),
    );
  }
}

class SendLocationUi extends StatelessWidget {
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
                    for (int i = 0; i < 2; i++)
                      FriendsTile(
                        trailing: Icon(Icons.check),
                        i: i,
                      ),
                    Text(
                      'سيتم أرسال رسالة ثانية لباقي أرقام الطوارئ اذا لم توجد استجابة',
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
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
