import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends StatelessWidget {
  String hintText;
  VoidCallback onTap;
  SearchField({this.hintText = '', this.onTap});
  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: this.onTap,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        hintText: this.hintText,
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
      ),
    );
  }
}
