import 'package:flutter/material.dart';

const MaterialColor palette = MaterialColor(0xFF585CE5, <int, Color>{
  100: Color(0xFFF2F6FD),
  200: Color(0xFFCDCEF7),
  300: Color(0xFF8A8DED),
  400: Color(0xFF7174E9),
  500: Color(primaryColorValue),
  600: Color(0xFF5054E2),
  700: Color(0xFF474ADE),
  800: Color(0xFF3D41DA),
  900: Color(0xFF2D30D3),
});

const int primaryColorValue = 0xFF585CE5;
final Color accentColor = palette.shade600;
final Color scaffoldBackgroundColor = palette.shade200;
final Color bottomNavigationBarColor = Color(0xFFFFFFFF);

