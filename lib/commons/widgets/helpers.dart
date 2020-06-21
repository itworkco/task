import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_dialog/progress_dialog.dart';

class HelpersWidgets {
  BuildContext context;

  HelpersWidgets(this.context);
//Todo
  ProgressDialog progressDialog() => ProgressDialog(
        context,
        isDismissible: true,
      )..style(
          message: 'إنتظر قليلاً',
          progressWidgetAlignment: Alignment.centerRight,
          borderRadius: 10,
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
      content: Text(
        text,
        textDirection: TextDirection.rtl,
      ),
    ));
  }

  Future<void> surroundThisBlockByProgressDialog(block) async {
    showProgressDialog();
    await block();
    hideProgressDialog();
  }
}
