import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChooseImagePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        showDialog(
            context: context,
            builder: (x) {
              return CupertinoAlertDialog(
                title: Text('hhhhhhhh'),
                actions: <Widget>[
                  FlatButton(onPressed: () {}, child: Text('HHH'))
                ],
              );
            });
      }),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ImagePickerOption(
              title: 'معرض الصور',
              icon: Stack(
                overflow: Overflow.visible,
                children: [
                  Positioned(
                    top: -40,
                    left: -30,
                    child: Transform.rotate(
                      angle: -0.6,
                      child: Icon(
                        FontAwesomeIcons.image,
                        size: 80,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    top: 10,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    FontAwesomeIcons.image,
                    size: 80,
                  ),
                ],
              ),
            ),
            ImagePickerOption(
              title: 'إلتقاط صورة',
              icon: Container(
                height: 80.h,
                width: 80.w,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Icon(
                  FontAwesomeIcons.camera,
                  size: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImagePickerOption extends StatelessWidget {
  String title;
  Widget icon;
  ImagePickerOption({this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[icon, Text(this.title)],
    );
  }
}
