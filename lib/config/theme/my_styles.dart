import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dark_theme_colors.dart';
import 'my_fonts.dart';
import 'light_theme_colors.dart';

class MyStyles {
  static IconThemeData getIconTheme({required bool isLightTheme}) =>
      IconThemeData(
        color: isLightTheme
            ? LightThemeColors.iconColor
            : DarkThemeColors.iconColor,
      );
  static AppBarTheme getAppBarTheme({required bool isLightTheme}) =>
      AppBarTheme(
        elevation: 0,
        titleTextStyle: getTextTheme(isLightTheme: isLightTheme)
            .bodyLarge!
            .copyWith(fontSize: MyFonts.appBarTittleSize, color: Colors.white),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: LightThemeColors.primaryColor,
            systemNavigationBarColor: LightThemeColors.white,
            statusBarIconBrightness: Brightness.light),
        iconTheme: IconThemeData(
            color: isLightTheme
                ? LightThemeColors.white
                : DarkThemeColors.appBarIconsColor),
        backgroundColor: isLightTheme
            ? LightThemeColors.primaryColor
            : DarkThemeColors.appbarColor,
      );

  ///text theme
  static TextTheme getTextTheme({required bool isLightTheme}) => TextTheme(
        titleLarge: MyFonts.labelLargeStyle.copyWith(
            fontSize: MyFonts.titleLarge,
            fontWeight: FontWeight.w600,
            color: LightThemeColors.titleTextColor),
        titleMedium: MyFonts.labelLargeStyle.copyWith(
            fontSize: MyFonts.titleMedium,
            fontWeight: FontWeight.w500,
            color: LightThemeColors.titleTextColor),
        labelLarge: MyFonts.labelLargeStyle.copyWith(
            fontSize: MyFonts.labelLarge,
            fontWeight: FontWeight.w600,
            color: LightThemeColors.labelLargeColor),
        labelSmall: MyFonts.labelLargeStyle.copyWith(
            fontSize: MyFonts.labelSmall,
            fontWeight: FontWeight.w500,
            wordSpacing: 0,
            color: LightThemeColors.labelSmallColor),
        bodyLarge: MyFonts.bodyTextStyle.copyWith(
            fontSize: MyFonts.bodyLarge,
            fontWeight: FontWeight.w500,
            color: isLightTheme
                ? LightThemeColors.bodyLargeColor
                : DarkThemeColors.bodyTextColor),
        bodyMedium: MyFonts.bodyTextStyle.copyWith(
            fontSize: MyFonts.bodyMedium,
            fontWeight: FontWeight.w400,
            color: isLightTheme
                ? LightThemeColors.bodyMediumColor
                : DarkThemeColors.bodyTextColor),
        bodySmall: MyFonts.bodyTextStyle.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: MyFonts.bodySmall,
          color: isLightTheme
              ? LightThemeColors.bodySmallColor
              : DarkThemeColors.captionTextColor,
        ),
      );
  // static ChipThemeData getChipTheme({required bool isLightTheme}) {
  //   return ChipThemeData(
  //     backgroundColor: isLightTheme
  //         ? LightThemeColors.chipBackground
  //         : DarkThemeColors.chipBackground,
  //     brightness: Brightness.light,
  //     labelStyle: getChipTextStyle(isLightTheme: isLightTheme),
  //     secondaryLabelStyle: getChipTextStyle(isLightTheme: isLightTheme),
  //     selectedColor: Colors.black,
  //     disabledColor: Colors.green,
  //     padding: const EdgeInsets.all(5),
  //     secondarySelectedColor: Colors.purple,
  //   );
  // }

  ///Chips text style
  // static TextStyle getChipTextStyle({required bool isLightTheme}) {
  //   return MyFonts.chipTextStyle.copyWith(
  //     fontSize: MyFonts.chipTextSize,
  //     color: isLightTheme
  //         ? LightThemeColors.chipTextColor
  //         : DarkThemeColors.chipTextColor,
  //   );
  // }

  // elevated button text style
  static MaterialStateProperty<TextStyle?>? getElevatedButtonTextStyle(
      bool isLightTheme,
      {bool isBold = true,
      double? fontSize}) {
    return MaterialStateProperty.resolveWith<TextStyle>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return MyFonts.buttonTextStyle.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: fontSize ?? MyFonts.buttonTextSize,
              color: isLightTheme
                  ? LightThemeColors.buttonTextColor
                  : DarkThemeColors.buttonTextColor);
        } else if (states.contains(MaterialState.disabled)) {
          return MyFonts.buttonTextStyle.copyWith(
              fontSize: fontSize ?? MyFonts.buttonTextSize,
              fontWeight: FontWeight.w600,
              color: isLightTheme
                  ? LightThemeColors.buttonDisabledTextColor
                  : DarkThemeColors.buttonDisabledTextColor);
        }
        return MyFonts.buttonTextStyle.copyWith(
            fontSize: fontSize ?? MyFonts.buttonTextSize,
            fontWeight: FontWeight.w600,
            color: isLightTheme
                ? LightThemeColors.buttonTextColor
                : DarkThemeColors
                    .buttonTextColor); // Use the component's default.
      },
    );
  }

  //elevated button theme data
  static ElevatedButtonThemeData getElevatedButtonTheme(
          {required bool isLightTheme}) =>
      ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          elevation: MaterialStateProperty.all(0),
          textStyle: getElevatedButtonTextStyle(isLightTheme),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return isLightTheme
                    ? LightThemeColors.buttonColor
                    : DarkThemeColors.buttonColor;
              } else if (states.contains(MaterialState.disabled)) {
                return isLightTheme
                    ? LightThemeColors.buttonDisabledColor
                    : DarkThemeColors.buttonDisabledColor;
              }
              return isLightTheme
                  ? LightThemeColors.buttonColor
                  : DarkThemeColors.buttonColor; // Use the component's default.
            },
          ),
        ),
      );
}
