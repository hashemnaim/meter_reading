import 'package:flutter/material.dart';
import 'dark_theme_colors.dart';
import 'light_theme_colors.dart';
import 'my_styles.dart';

class MyTheme {
  static getThemeData({required bool isLight}) {
    return ThemeData(
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(backgroundColor: Colors.black),
      primaryColor: isLight
          ? LightThemeColors.primaryColor
          : DarkThemeColors.primaryColor,
      brightness: isLight ? Brightness.light : Brightness.dark,
      cardTheme: CardTheme(
          elevation: 3,
          // clipBehavior: RoundedRectangleBorder(),
          surfaceTintColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            //set border radius more than 50% of height and width to make circle
          ),
          shadowColor: Colors.grey),
      cardColor:
          isLight ? LightThemeColors.cardColor : DarkThemeColors.cardColor,
      hintColor: isLight
          ? LightThemeColors.hintTextColor
          : DarkThemeColors.hintTextColor,
      // divider color
      dividerTheme: const DividerThemeData(indent: 1, space: 8, endIndent: 2),
      dividerColor: isLight
          ? LightThemeColors.dividerColor
          : DarkThemeColors.dividerColor,
      scaffoldBackgroundColor: isLight
          ? LightThemeColors.scaffoldBackgroundColor
          : DarkThemeColors.scaffoldBackgroundColor,

      // progress bar theme
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: isLight
            ? LightThemeColors.primaryColor
            : DarkThemeColors.primaryColor,
      ),

      inputDecorationTheme: const InputDecorationTheme(),
      // appBar theme
      appBarTheme: MyStyles.getAppBarTheme(isLightTheme: isLight),

      // elevated button theme
      elevatedButtonTheme:
          MyStyles.getElevatedButtonTheme(isLightTheme: isLight),

      // text theme
      textTheme: MyStyles.getTextTheme(isLightTheme: isLight),

      // chip theme
      // chipTheme: MyStyles.getChipTheme(isLightTheme: isLight),

      // icon theme
      iconTheme: MyStyles.getIconTheme(isLightTheme: isLight),
      // colorScheme: ColorScheme.fromSwatch()
      //     .copyWith(
      //         secondary: isLight
      //             ? LightThemeColors.accentColor
      //             : DarkThemeColors.accentColor)
      //     .copyWith(
      //         background:
      //             isLight ? Colors.white : DarkThemeColors.backgroundColor),
    );
  }

  static changeTheme() {}
}
