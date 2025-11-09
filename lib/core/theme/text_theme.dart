import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextTheme {
  static TextTheme get textTheme {
    return TextTheme(
      labelSmall: TextStyle(fontSize: 10.sp),
      bodySmall: TextStyle(fontSize: 12.sp),
      bodyMedium: TextStyle(fontSize: 14.sp),
      titleSmall: TextStyle(fontSize: 14.sp),
      titleMedium: TextStyle(fontSize: 15.sp),
      titleLarge: TextStyle(fontSize: 16.sp),
      headlineSmall: TextStyle(fontSize: 18.sp),
      headlineMedium: TextStyle(fontSize: 20.sp),
      headlineLarge: TextStyle(fontSize: 24.sp),
      displayMedium: TextStyle(fontSize: 48.sp),
    );
  }

  static TextStyle fontSize10medium(context) {
    return TextTheme.of(
      context,
    ).labelSmall!.copyWith(fontWeight: FontWeight.w500);
  }

  static TextStyle fontSize10semiBold(context) {
    return TextTheme.of(
      context,
    ).labelSmall!.copyWith(fontWeight: FontWeight.w600);
  }

  static TextStyle fontSize12regular(context) {
    return TextTheme.of(
      context,
    ).bodySmall!.copyWith(fontWeight: FontWeight.w400);
  }

  static TextStyle fontSize14regular(context) {
    return TextTheme.of(
      context,
    ).bodyMedium!.copyWith(fontWeight: FontWeight.w400);
  }

  static TextStyle fontSize14medium(context) {
    return TextTheme.of(
      context,
    ).bodyMedium!.copyWith(fontWeight: FontWeight.w500);
  }

  static TextStyle fontSize14semiBold(context) {
    return TextTheme.of(
      context,
    ).bodyMedium!.copyWith(fontWeight: FontWeight.w600);
  }

  static TextStyle fontSize15bold(context) {
    return TextTheme.of(
      context,
    ).titleMedium!.copyWith(fontWeight: FontWeight.w600);
  }

  static TextStyle fontSize16medium(context) {
    return TextTheme.of(
      context,
    ).titleLarge!.copyWith(fontWeight: FontWeight.w500);
  }

  static TextStyle fontSize16semiBold(context) {
    return TextTheme.of(
      context,
    ).titleLarge!.copyWith(fontWeight: FontWeight.w600);
  }

  static TextStyle fontSize16bold(context) {
    return TextTheme.of(
      context,
    ).titleLarge!.copyWith(fontWeight: FontWeight.w700);
  }

  static TextStyle fontSize18regular(context) {
    return TextTheme.of(
      context,
    ).headlineSmall!.copyWith(fontWeight: FontWeight.w400);
  }

  static TextStyle fontSize18semiBold(context) {
    return TextTheme.of(
      context,
    ).headlineSmall!.copyWith(fontWeight: FontWeight.w600);
  }

  static TextStyle fontSize20regular(context) {
    return TextTheme.of(
      context,
    ).headlineMedium!.copyWith(fontWeight: FontWeight.w400);
  }

  static TextStyle fontSize20semiBold(context) {
    return TextTheme.of(
      context,
    ).headlineMedium!.copyWith(fontWeight: FontWeight.w600);
  }

  static TextStyle fontSize20bold(context) {
    return TextTheme.of(
      context,
    ).headlineMedium!.copyWith(fontWeight: FontWeight.w700);
  }

  static TextStyle fontSize24bold(context) {
    return TextTheme.of(
      context,
    ).headlineLarge!.copyWith(fontWeight: FontWeight.w700);
  }

  static TextStyle fontSize48bold(context) {
    return TextTheme.of(
      context,
    ).displayMedium!.copyWith(fontWeight: FontWeight.w700);
  }
}
