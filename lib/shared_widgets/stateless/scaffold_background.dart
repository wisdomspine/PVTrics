import 'package:flutter/material.dart';

class ScaffoldBackground extends StatelessWidget {
  final Widget? child;
  const ScaffoldBackground({
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
      child: child,
    );
  }
}
