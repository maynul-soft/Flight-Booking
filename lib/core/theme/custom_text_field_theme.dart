import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFieldTheme {
  static InputDecorationTheme get lightTheme {
    return InputDecorationTheme(
      border: border(),
      errorBorder: border(),
      focusedBorder: border(),
      enabledBorder: border(),
      disabledBorder: border(),
      fillColor: Colors.white,
    );
  }

  static InputDecorationTheme get darkTheme {
    return InputDecorationTheme(
      filled: true,
      fillColor: Color.fromARGB(45, 133, 133, 133),
      border: border(),
      errorBorder: border(),
      focusedBorder: border(),
      enabledBorder: border(),
      disabledBorder: border(),
    );
  }

  static OutlineInputBorder border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.grey, width: 1.2),
    );
  }
}
