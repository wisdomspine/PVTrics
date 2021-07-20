import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Typography {
  static TextTheme textTheme(ThemeData themeData) {
    return GoogleFonts.nunitoTextTheme(themeData.textTheme);
  }
}
