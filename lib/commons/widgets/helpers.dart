import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_dialog/progress_dialog.dart';

class Helpers {
  BuildContext context;

  Helpers(this.context);

  ProgressDialog progressDialog() =>
      ProgressDialog(context, isDismissible: false)
        ..style(
            message: 'إنتظر قليلاً',
            progressWidget: Center(
                child: SizedBox(
              child: CircularProgressIndicator(),
              width: 40.w,
              height: 40.h,
            )),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 50.h));

  Future<void> showProgressDialog() async => await progressDialog().show();

  Future<void> hideProgressDialog() async => await progressDialog().hide();

  static void showSnackBar(GlobalKey<ScaffoldState> scaffoldKey, String text) {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(text),
    ));
  }

  Future<void> surroundThisBlockByProgressDialog(block) async {
    showProgressDialog();
    await block();
    hideProgressDialog();
  }
}
