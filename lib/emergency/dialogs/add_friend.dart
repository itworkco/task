import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class AddFriendDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        ImagePicker().getImage(source: ImageSource.camera);
      }),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
                alignment: Alignment.centerLeft,
                child: IconButton(icon: Icon(Icons.close), onPressed: () {})),
            Center(
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                  ),
                  Positioned(
                    right: -20,
                    bottom: 0,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        FontAwesomeIcons.camera,
                        size: 35,
                      ),
                      onPressed: () {},
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
              suffix: Material(
                child: InkWell(
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border(right: BorderSide())),
                    width: (80.w),
                    height: 10,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('+20'),
                        CircleAvatar(
                          radius: 12,
                          backgroundImage: AssetImage('countries[0].flag'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                onPressed: () {},
                child: Text('إضافة'),
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AddFriendTextField extends StatelessWidget {
  final String title, hint;
  TextInputType textInputType;
  Widget suffix;
  AddFriendTextField({this.hint, this.title, this.textInputType, this.suffix});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(title),
        TextField(
          keyboardType: textInputType,
          decoration: InputDecoration(
              suffixIcon: suffix,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
              hintText: this.hint,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.grey,
              )),
        ),
      ],
    );
  }
}
