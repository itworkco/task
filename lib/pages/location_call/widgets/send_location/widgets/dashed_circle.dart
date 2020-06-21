import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MyDashedCircle extends StatelessWidget {
  double height, width;
  MyDashedCircle(this.height, this.width);
  @override
  Widget build(BuildContext context) {
    return DashedContainer(
      child: Container(
        height: height.h,
        width: width.w,
        decoration:
            BoxDecoration(color: Colors.transparent, shape: BoxShape.circle),
      ),
      dashColor: Colors.white,
      boxShape: BoxShape.circle,
      dashedLength: 1.0,
      blankLength: 2.0,
      strokeWidth: 6.0,
    );
  }
}
