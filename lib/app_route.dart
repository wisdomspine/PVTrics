import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vptrics/modules/public/widgets/stateful/login_screen.dart';
import 'package:vptrics/shared_widgets/stateless/scaffold_background.dart';

import 'modules/public/widgets/stateful/onboard_screen.dart';

class AppRoute {
  Route<dynamic> Function(RouteSettings) get onGenerateRoute {
    return (RouteSettings routeSettings) {
      return Platform.isIOS
          ? CupertinoPageRoute(builder: _getBuilder(routeSettings))
          : MaterialPageRoute(builder: _getBuilder(routeSettings));
    };
  }

  String? get initialRoute {
    // TODO: retun initial page
    return OnboardScreen.route;
  }

  Widget Function(BuildContext) _getBuilder(RouteSettings routeSettings) {
    Widget Function(BuildContext) builder = (context) => SizedBox();
    switch (routeSettings.name) {
      case OnboardScreen.route:
        builder = (context) => ScaffoldBackground(
              child: OnboardScreen(),
            );
        break;
      case LoginScreen.route:
        builder = (context) => ScaffoldBackground(
              child: LoginScreen(),
            );
        break;
    }

    return builder;
  }
}
