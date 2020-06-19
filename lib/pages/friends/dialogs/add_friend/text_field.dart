import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddFriendTextField extends StatelessWidget {
  final String title, hint;
  final TextInputType textInputType;
  Widget suffix;
  AddFriendTextField(
      {this.hint,
      this.title,
      this.textInputType,
      this.suffix = const SizedBox.shrink()});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 17.w, right: 21.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(title),
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              TextField(
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                keyboardType: textInputType,
                decoration: InputDecoration(
//                    prefix: suffix,
                    alignLabelWithHint: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: -10.w, vertical: 10.h),
                    hintText: this.hint,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    suffixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    )),
              ),
              suffix
            ],
          ),
        ],
      ),
    );
  }
}
