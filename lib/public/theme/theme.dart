import 'package:e_store_app/public/theme/color.dart';
import 'package:flutter/material.dart';

class Themes {
  ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColor.darktext,
    appBarTheme: AppBarTheme(
      color: AppColor.lightBG,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColor.darkPrimary),
      titleTextStyle: TextStyle(color: AppColor.darkPrimary),
    ),
    colorScheme: ColorScheme.light(
      background: AppColor.lightBG,
      primary: AppColor.lightPrimary,
      secondary: AppColor.lightSecondary,
      onPrimary: AppColor.darkBG,
      onSecondary: AppColor.darkSecondary,
    ),
  );
  ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColor.lightText,
    appBarTheme: AppBarTheme(
      color: AppColor.darkBG,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColor.darkPrimary),
      titleTextStyle: TextStyle(color: AppColor.darkPrimary),
    ),
    colorScheme: ColorScheme.dark(
      background: AppColor.darkBG,
      primary: AppColor.darkPrimary,
      secondary: AppColor.darkSecondary,
      onPrimary: AppColor.lightBG,
      onSecondary: AppColor.lightSecondary,
    ),
  );
}
