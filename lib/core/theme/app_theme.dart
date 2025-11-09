import 'package:flight_booking/core/theme/custom_elevated_button_theme.dart';
import 'package:flight_booking/core/theme/custom_text_field_theme.dart';
import 'package:flight_booking/core/utils/color/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightThemeData = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.scaffolBGcolorLt,
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.seconderyGcolorLt,
      surface: AppColors.surfaceColorLt,
      tertiary: AppColors.tertiaryColorLt,
      tertiaryFixed: AppColors.tertiaryFixedColor,
      onTertiary: AppColors.onTertiaryColorLt,
    ),
    inputDecorationTheme: CustomTextFieldTheme.lightTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.lightTheme,
  );

  static ThemeData darkThemeData = ThemeData(
    scaffoldBackgroundColor: AppColors.scaffolBGcolorDk,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryColor,
      secondary: AppColors.seconderyBGcolorDk,
      surface: AppColors.surfaceColorDk,
      tertiary: AppColors.tertiaryColorDk,
      tertiaryFixed: AppColors.tertiaryFixedColor,
      onTertiary: AppColors.onTertiaryColorDk,
    ),
    inputDecorationTheme: CustomTextFieldTheme.darkTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.darkTheme,
  );
}
