import 'dart:developer';

import 'package:flutter/material.dart';

import 'colors.dart' as colors;

class LightThene {
  static ThemeData theme(BuildContext context) {
    final ThemeData mainTheme = _mainThemeData(context);
    return mainTheme.copyWith();
  }

  static ThemeData _mainThemeData(BuildContext context) {
    return ThemeData(
      primarySwatch: colors.palette,
      primaryColor: Color(colors.primaryColorValue),
      accentColor: colors.accentColor,
      brightness: Brightness.light,
      scaffoldBackgroundColor: colors.scaffoldBackgroundColor,
      backgroundColor: Colors.white,
    );
  }

  static Color? get bottomNavigationBarColor => colors.bottomNavigationBarColor;
}
