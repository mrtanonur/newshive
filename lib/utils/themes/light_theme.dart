import 'package:flutter/material.dart';
import 'package:newshive/utils/constants/constants.dart';

ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorConstants.white,
    textTheme: const TextTheme(
        labelMedium: TextStyle(color: ColorConstants.black54),
        bodyLarge: TextStyle(color: ColorConstants.black54),
        bodyMedium: TextStyle(color: ColorConstants.black54),
        bodySmall: TextStyle(color: ColorConstants.black54),
        titleLarge: TextStyle(color: ColorConstants.black54),
        titleMedium: TextStyle(color: ColorConstants.black54),
        titleSmall: TextStyle(color: ColorConstants.black54)),
    colorScheme: const ColorScheme.light(
      surface: ColorConstants.grey100,
      primary: ColorConstants.grey500,
      secondary: ColorConstants.grey100,
      tertiary: ColorConstants.white,
      inversePrimary: ColorConstants.grey500,
    ));
