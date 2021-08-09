import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AppMedia {
  static bool? get isTablet {
    WidgetsBinding? instance = WidgetsBinding.instance;
    if (instance != null) {
      final data = MediaQueryData.fromWindow(instance.window);
      return data.size.shortestSide >= 600;
    }
    return null;
  }

  static Size? get screenSize {
    WidgetsBinding? instance = WidgetsBinding.instance;
    if (instance != null) {
      return MediaQueryData.fromWindow(instance.window).size;
    }
    return null;
  }

  static double? get screenWidth => AppMedia.screenSize?.width;
  static double? get screenHeight => AppMedia.screenSize?.height;
  static double? get shortestSideLength {
    double? width = AppMedia.screenWidth;
    double? height = AppMedia.screenHeight;
    if (width != null && height != null) {
      return Math.min(width, height);
    }
    return null;
  }

//   static double get longestSideLength =>
//       Math.max(AppMedia.screenWidth, AppMedia.screenHeight);
//   static Orientation get orientation =>
//       MediaQueryData.fromWindow(WidgetsBinding.instance.window).orientation;

// // 812 is the layout height that designer use
  static double? getProportionateHeight(double inputHeight) {
    double? height = AppMedia.screenHeight;
    if (height != null) {
      return (inputHeight / 812.0) * height;
    }
    return null;
  }

// // Get the proportionate height as per screen size
// // 375 is the layout width that designer use
//   static double getProportionateWidth(double inputWidth) =>
//       (inputWidth / 375.0) * AppMedia.screenWidth;
}
