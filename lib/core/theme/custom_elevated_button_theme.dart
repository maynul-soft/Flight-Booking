import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color/app_color.dart';

class CustomElevatedButtonTheme {
  static ElevatedButtonThemeData get lightTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff3333FF),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
      ),
    );
  }

  static ElevatedButtonThemeData get darkTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff3333FF),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
      ),
    );
  }
}
