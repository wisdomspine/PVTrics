import 'dart:developer';

import 'package:flutter/material.dart';

import 'colors.dart' as colors;

class LightThene {
  static ThemeData theme(BuildContext context) {
    final ThemeData mainTheme = _mainThemeData(context);
    return mainTheme.copyWith(
      inputDecorationTheme: _inputDecorationTheme(mainTheme),
      appBarTheme: _appBarTheme(mainTheme),
      bottomAppBarTheme: _bottomAppBarTheme(mainTheme),
      cardTheme: _cardTheme(mainTheme),
      timePickerTheme: _timePickerThemeData(mainTheme),
      dialogTheme: _dialogTheme(mainTheme),
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
        color: themeData.textTheme.bodyText2?.color?.withOpacity(.4),
      ),
      fillColor: colors.inputFillColor?.withOpacity(.3),
      focusColor: colors.inputHoverFillColor?.withOpacity(.15),
      hoverColor: colors.inputHoverFillColor?.withOpacity(.15),
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: themeData.dividerColor.withOpacity(.15),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: themeData.dividerColor.withOpacity(.15),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: themeData.errorColor.withOpacity(.8),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: themeData.errorColor.withOpacity(.8),
          width: 2,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: themeData.dividerColor.withOpacity(.15),
        ),
      ),
    );
  }

  static AppBarTheme _appBarTheme(ThemeData themeData) {
    return AppBarTheme(
      elevation: 0,
      color: Colors.transparent,
      iconTheme: IconThemeData(color: themeData.iconTheme.color),
      textTheme: themeData.textTheme.copyWith(
        headline6: themeData.textTheme.headline6?.copyWith(
          fontSize: 20,
        ),
      ),
    );
  }

  static BottomAppBarTheme _bottomAppBarTheme(ThemeData themeData) {
    return BottomAppBarTheme(
      color: colors.bottomAppBarColor,
    );
  }

  static CardTheme _cardTheme(ThemeData themeData) {
    return CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: themeData.dividerColor.withOpacity(.15),
        ),
      ),
    );
  }

  static DialogTheme _dialogTheme(ThemeData themeData) {
    return DialogTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: colors.cardColor?.withOpacity(.7),
    );
  }

  static TimePickerThemeData _timePickerThemeData(ThemeData themeData) {
    return TimePickerThemeData();
  }
}
