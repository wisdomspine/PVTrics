import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart' as colors;

class LightThene {
  static ThemeData theme(BuildContext context) {
    return ThemeData();
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

  static Color get bottomNavigationBarColor => colors.bottomNavigationBarColor;
}
