import 'package:flutter/material.dart';

class OnboardScreen extends StatefulWidget {
  static const String route = "OnboardScreen";
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Hello world"),
    );
  }
}
