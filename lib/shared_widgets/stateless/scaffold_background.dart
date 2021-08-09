import 'dart:ui';

import 'package:flutter/material.dart';

class ScaffoldBackground extends StatelessWidget {
  final Widget? child;
  ScaffoldBackground({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.jpg"),
          fit: BoxFit.cover,
          alignment: Alignment.topLeft,
        ),
      ),
      child: new BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 1.0,
          sigmaY: -2.0,
        ),
        // child: child,
        child: child,
      ),
    );
  }
}
