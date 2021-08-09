import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:vptrics/app_route.dart';
import 'package:vptrics/shared_widgets/stateless/loading_screen.dart';

class AppLaunchScreen extends StatelessWidget with GetItMixin {
  static const String route = "AppLaunchScreen";
  AppLaunchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    allReady(onReady: (contex2) {
      get<AppRoute>().initialRoute.then((route) {
        Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
      });
    });
    return LoadingScreen(
      child: Scaffold(),
      loading: true,
    );
  }
}
