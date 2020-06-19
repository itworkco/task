import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task/pages/friends/dialogs/choose_picker/picker_option.dart';

class ChooseImagePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
//      color: Colors.transparent,
      child: Center(
        child: Container(
          color: Colors.white,
          height: (240.h),
          width: 250,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: CloseButton(),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ImagePickerOption(
                    title: 'معرض الصور',
                    icon: Stack(
                      overflow: Overflow.visible,
                      children: [
                        Positioned(
                          top: -10,
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
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
