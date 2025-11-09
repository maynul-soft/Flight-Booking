import 'package:flutter/material.dart';

class AppColors {
  static const Color _primaryColor = Color(0xff3333FF);
  static const Color _scaffolBGcolorLt = Color.fromARGB(236, 255, 255, 255);
  static const Color _scaffolBGcolorDk = Color.fromARGB(224, 7, 9, 57);
  static const Color _seconderyGcolorLt = Color(0xff3333FF);
  static const Color _seconderyBGcolorDk = Color.fromARGB(255, 3, 3, 34);
  static const Color _surfaceColorLt = Colors.white;
  static const Color _surfaceColorDk = Color.fromARGB(233, 2, 6, 17);
  static const Color _tertiaryColorLt = Colors.black;
  static const Color _tertiaryColorDk = Colors.grey;
  static const Color _tertiaryFixedColor = Colors.white;
  static const Color _ontertiaryColorLt = Colors.black;
  static const Color _ontertiaryColorDk = Colors.white;

  static Color get primaryColor => _primaryColor;
  static Color get scaffolBGcolorLt => _scaffolBGcolorLt;
  static Color get scaffolBGcolorDk => _scaffolBGcolorDk;
  static Color get seconderyGcolorLt => _seconderyGcolorLt;
  static Color get seconderyBGcolorDk => _seconderyBGcolorDk;
  static Color get surfaceColorLt => _surfaceColorLt;
  static Color get surfaceColorDk => _surfaceColorDk;
  static Color get tertiaryColorLt => _tertiaryColorLt;
  static Color get tertiaryColorDk => _tertiaryColorDk;
  static Color get tertiaryFixedColor => _tertiaryFixedColor;
  static Color get onTertiaryColorLt => _tertiaryColorLt;
  static Color get onTertiaryColorDk => _tertiaryColorDk;

  static MaterialColor getMaterialColor(Color color) {
    int red = color.red;
    int green = color.green;
    int blue = color.blue;

    final Map<int, Color> shades = {
      50: Color.fromRGBO(red, green, blue, .1),
      100: Color.fromRGBO(red, green, blue, .2),
      200: Color.fromRGBO(red, green, blue, .3),
      300: Color.fromRGBO(red, green, blue, .4),
      400: Color.fromRGBO(red, green, blue, .5),
      500: Color.fromRGBO(red, green, blue, .6),
      600: Color.fromRGBO(red, green, blue, .7),
      700: Color.fromRGBO(red, green, blue, .8),
      800: Color.fromRGBO(red, green, blue, .9),
      900: Color.fromRGBO(red, green, blue, 1),
    };

    return MaterialColor(color.value, shades);
  }
}
