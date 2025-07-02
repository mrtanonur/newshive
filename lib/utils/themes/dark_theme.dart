import 'package:flutter/material.dart';
import 'package:newshive/utils/constants/constants.dart';

ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorConstants.grey900,
    textTheme: const TextTheme(
        labelMedium: TextStyle(color: ColorConstants.black54),
        bodyLarge: TextStyle(color: ColorConstants.white),
        bodyMedium: TextStyle(color: ColorConstants.white),
        bodySmall: TextStyle(color: ColorConstants.white),
        titleLarge: TextStyle(color: ColorConstants.white),
        titleMedium: TextStyle(color: ColorConstants.white),
        titleSmall: TextStyle(color: ColorConstants.white)),
    colorScheme: const ColorScheme.dark(
      surface: ColorConstants.darkSurface,
      primary: ColorConstants.darkPrimary,
      secondary: ColorConstants.darkSecondary,
      tertiary: ColorConstants.darkTertiary,
      inversePrimary: ColorConstants.grey500,
    ));
