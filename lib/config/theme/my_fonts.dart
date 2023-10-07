import 'package:meter_reading/config/translations/localization_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyFonts {
  // return the right font depending on app language
  static TextStyle get getAppFontType =>
      LocalizationService.supportedLanguagesFontsFamilies['ar']!;

  // headlines text font
  static TextStyle get labelLargeStyle => getAppFontType;

  // body text font
  static TextStyle get bodyTextStyle => getAppFontType;

  // button text font
  static TextStyle get buttonTextStyle => getAppFontType;

  // app bar text font
  static TextStyle get appBarTextStyle => getAppFontType;

  // chips text font
  static TextStyle get chipTextStyle => getAppFontType;

  // appbar font size
  static double get appBarTittleSize => 24.sp;

  // headlines font size
  static double get titleLarge => 24.sp;
  static double get titleMedium => 16.sp;
  static double get labelLarge => 20.sp;
  static double get labelSmall => 12.sp;
  static double get bodyLarge => 16.sp;
  static double get bodyMedium => 16.sp;
  static double get bodySmall => 14.sp;
  static double get hint => 16.sp;

  //button font size
  static double get buttonTextSize => 18.sp;

  //caption font size
  static double get captionTextSize => 13.sp;
  //navBar font size
  static double get navBarTextSize => 13.sp;

  //chip font size
  static double get chipTextSize => 10.sp;
}
