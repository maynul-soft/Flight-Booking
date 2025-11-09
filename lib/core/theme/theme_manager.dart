import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeManager extends GetxController {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  toggoleTheme(bool isDark) {
    isDark ? _themeMode = ThemeMode.dark : _themeMode = ThemeMode.light;
    update();
  }
}
