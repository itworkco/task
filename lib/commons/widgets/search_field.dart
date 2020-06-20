import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends StatelessWidget {
  String hintText;
  VoidCallback onTap;
  SearchField({this.hintText = '', this.onTap});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextField(
      onTap: this.onTap,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        hintText: this.hintText,
        prefixIcon: Icon(
          Icons.search,
          color: theme.accentColor,
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: theme.accentColor),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).accentColor),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).accentColor),
            borderRadius: BorderRadius.all(Radius.circular(30))),
      ),
    );
  }
}
