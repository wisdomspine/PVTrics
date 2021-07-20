import 'package:flutter/material.dart';

const int primaryColorValue = 0xFF585CE5;
const MaterialColor palette = MaterialColor(primaryColorValue, <int, Color>{
  50: Color(0xFFF2F6FD),
  100: Color(0xFFEBEBFC),
  200: Color(0xFFACAEF2),
  300: Color(0xFF8A8DED),
  400: Color(0xFF7174E9),
  500: Color(primaryColorValue),
  600: Color(0xFF5054E2),
  700: Color(0xFF474ADE),
  800: Color(0xFF3D41DA),
  900: Color(0xFF2D30D3),
});

final Color? accentColor = palette[600];
final Color? scaffoldBackgroundColor = palette[200]?.withOpacity(.6);
final Color? bottomNavigationBarColor = palette[400]?.withOpacity(.7);
final Color? cardColor = palette[50];
final Color? inputFillColor = palette[200];
final Color? inputHoverFillColor = palette[100];
