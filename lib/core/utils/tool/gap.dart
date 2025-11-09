import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Gap {
  static height(double height) {
    return SizedBox(height: height.h);
  }

  static width(double width) {
    return SizedBox(width: width.w);
  }
}
