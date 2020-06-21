import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenConverter {
  static double myHeight = 809;
  static double myWidth = 375;
  static double get myAspectRatio => myWidth / myHeight;
  static double get aspectRatio => ScreenUtil.mediaQueryData.size.aspectRatio;
  static double aspectRatioConverter(double x) {
    return (x * aspectRatio) / myAspectRatio;
  }
}
