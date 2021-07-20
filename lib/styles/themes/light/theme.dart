import 'dart:developer';

import 'package:flutter/material.dart';

import 'colors.dart' as colors;

class LightThene {
  static ThemeData theme(BuildContext context) {
    final ThemeData mainTheme = _mainThemeData(context);
    return mainTheme.copyWith(
      inputDecorationTheme: _inputDecorationTheme(mainTheme),
    );
  }

  static ThemeData _mainThemeData(BuildContext context) {
    return ThemeData(
      primarySwatch: colors.palette,
      primaryColor: Color(colors.primaryColorValue),
      accentColor: colors.accentColor,
      brightness: Brightness.light,
      scaffoldBackgroundColor: colors.scaffoldBackgroundColor,
      backgroundColor: Colors.white,
      cardColor: colors.cardColor,
    );
  }

  static Color? get bottomNavigationBarColor => colors.bottomNavigationBarColor;

  static InputDecorationTheme _inputDecorationTheme(ThemeData themeData) {
    return themeData.inputDecorationTheme.copyWith(
      labelStyle: themeData.textTheme.bodyText2?.copyWith(
          // color: themeData.textTheme.bodyText2?.color?.withOpacity(.5),
          ),
      hintStyle: themeData.textTheme.bodyText2?.copyWith(
          // color: themeData.textTheme.bodyText2.color.withOpacity(.4),
          ),
      fillColor: colors.inputFillColor?.withOpacity(.3),
      focusColor: colors.inputHoverFillColor?.withOpacity(.15),
      hoverColor: colors.inputHoverFillColor?.withOpacity(.15),
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: themeData.dividerColor.withOpacity(.15),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: themeData.dividerColor.withOpacity(.15),
        ),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: themeData.dividerColor.withOpacity(.15),
        ),
      ),
    );
  }
}
