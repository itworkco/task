import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SendLocationLogic extends ChangeNotifier {
  Animation<double> friendsOpacityAnimation;
  AnimationController friendsOpacityAnimationController;
  Animation<Offset> firstAvatarAnimation;
  Animation<Offset> secondAvatarAnimation;
  Animation<double> avatarScaleAnimation;
  AnimationController firstAndSecondAvatarScaleController;
  AnimationController firstAndSecondAvatarSlideAnimationController;
  Animation<Offset> thirdAndFourthAvatarAnimation;
  AnimationController thirdAndFourthAvatarAnimationController;
  Animation<double> dashedCircleScaleAnimation;
  AnimationController dashedCircleScaleAnimationController;
  Animation<Offset> friendsRowAnimation;
  AnimationController friendsRowAnimationController;
  TickerProvider tickerProvider;
  IconData checkMark;
  SendLocationLogic(TickerProvider tickerProvider) {
    this.tickerProvider = tickerProvider;

    friendsOpacityAnimationController = AnimationController(
        vsync: tickerProvider, duration: Duration(milliseconds: 300));
    friendsOpacityAnimation = Tween<double>(begin: 0, end: 1)
        .animate(friendsOpacityAnimationController);
    thirdAndFourthAvatarAnimationController = AnimationController(
        vsync: tickerProvider, duration: Duration(milliseconds: 300));
    thirdAndFourthAvatarAnimation =
        Tween<Offset>(begin: Offset.zero, end: Offset(1.5, 6.5)).animate(
      thirdAndFourthAvatarAnimationController,
    );
    firstAndSecondAvatarSlideAnimationController = AnimationController(
        vsync: tickerProvider, duration: Duration(milliseconds: 300));
    firstAvatarAnimation =
        Tween<Offset>(begin: Offset.zero, end: Offset(1, 1)).animate(
      firstAndSecondAvatarSlideAnimationController,
    );
    secondAvatarAnimation =
        Tween<Offset>(begin: Offset.zero, end: Offset(2.1, 2.5)).animate(
      firstAndSecondAvatarSlideAnimationController,
    );

    firstAndSecondAvatarScaleController = AnimationController(
        vsync: tickerProvider, duration: Duration(milliseconds: 1));
    avatarScaleAnimation = Tween<double>(begin: 20, end: 30).animate(
      firstAndSecondAvatarScaleController,
    );

    dashedCircleScaleAnimationController = AnimationController(
        vsync: tickerProvider, duration: Duration(milliseconds: 300));
    dashedCircleScaleAnimation = Tween<double>(begin: 0.3, end: 1.2).animate(
      dashedCircleScaleAnimationController,
    );
    friendsRowAnimationController = AnimationController(
        vsync: tickerProvider, duration: Duration(milliseconds: 300));
    friendsRowAnimation =
        Tween<Offset>(begin: Offset.zero, end: Offset(0, 0.5)).animate(
      friendsRowAnimationController,
    );
  }

  int _start = 5;
  void startCycle() {
    getReadyToSend();
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_start < 1) {
        timer.cancel();
      } else {
        _start = _start - 1;
        if (_start == 3) {
          readyToSend();
        } else if (_start == 2) {
          checkMark = FontAwesomeIcons.check;
          notifyListeners();
        } else if (_start == 1) {
          checkMark = FontAwesomeIcons.checkDouble;
          notifyListeners();
        }
      }
    });
  }

  void readyToSend() {
    dashedCircleScaleAnimationController.stop();

    friendsRowAnimationController.stop();
    friendsOpacityAnimationController.forward();
    firstAndSecondAvatarSlideAnimationController.forward();
    firstAndSecondAvatarScaleController.forward();
    thirdAndFourthAvatarAnimationController.forward();
  }

  void getReadyToSend() {
    dashedCircleScaleAnimationController.repeat(reverse: true);
    friendsRowAnimationController.repeat(reverse: true);
  }
}
