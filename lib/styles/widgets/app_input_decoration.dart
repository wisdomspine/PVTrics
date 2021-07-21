import 'package:flutter/material.dart';

class AppInputDecoration {
  static InputDecorationTheme theme(ThemeData themeData) {
    return themeData.inputDecorationTheme.copyWith(
      labelStyle: themeData.textTheme.bodyText2?.copyWith(),
      hintStyle: themeData.textTheme.bodyText2?.copyWith(),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
    );
  }
}
