import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:task/pages/friends/dialogs/choose_picker/picker_option.dart';
import 'package:task/pages/friends/logic.dart';

class ChooseImagePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FriendsLogic logic = Provider.of(context);
    return Material(
      elevation: 0,
//      backgroundColor: Colors.transparent,
      color: Colors.transparent,
      child: Center(
        child: Container(
          color: Colors.white,
          height: (213.h),
          width: 345.w,
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
                    onTap: () => logic.pickImagePath(ImageSource.camera),
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
                  ),
                  ImagePickerOption(
                    onTap: () => logic.pickImagePath(ImageSource.gallery),
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
