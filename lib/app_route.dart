import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vptrics/modules/email/widgets/stateful/compose_email_screen.dart';
import 'package:vptrics/modules/email/widgets/stateful/emails_screen.dart';
import 'package:vptrics/modules/email/widgets/stateful/read_email_screen.dart';
import 'package:vptrics/modules/patients/widgets/stateful/create_patient_screen.dart';
import 'package:vptrics/modules/patients/widgets/stateful/patient_dashboard_screen.dart';
import 'package:vptrics/modules/patients/widgets/stateful/patients_screen.dart';
import 'package:vptrics/modules/patients/widgets/stateful/patients_search_screen.dart';
import 'package:vptrics/modules/public/widgets/stateful/login_screen.dart';
import 'package:vptrics/modules/sms/widgets/stateful/sms_screen.dart';
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
      case PatientsScreen.route:
        builder = (context) => ScaffoldBackground(
              child: PatientsScreen(),
            );
        break;
      case PatientsSearchScreen.route:
        builder = (context) => ScaffoldBackground(
              child: PatientsSearchScreen(),
            );
        break;
      case CreatePatientScreen.route:
        builder = (context) => ScaffoldBackground(
              child: CreatePatientScreen(),
            );
        break;
      case PatientDashboardScreen.route:
        builder = (context) => ScaffoldBackground(
              child: PatientDashboardScreen(),
            );
        break;
      case EmailsScreen.route:
        builder = (context) => ScaffoldBackground(
              child: EmailsScreen(),
            );
        break;
      case ComposeEmailScreen.route:
        builder = (context) => ScaffoldBackground(
              child: ComposeEmailScreen(),
            );
        break;
      case ReadEmailScreen.route:
        builder = (context) => ScaffoldBackground(
              child: ReadEmailScreen(),
            );
        break;
      case SmsScreen.route:
        builder = (context) => ScaffoldBackground(
              child: SmsScreen(),
            );
        break;
    }

    return builder;
  }
}
