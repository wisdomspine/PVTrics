import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vptrics/modules/data/widgets/stateful/data_screen.dart';
import 'package:vptrics/modules/email/widgets/stateful/compose_email_screen.dart';
import 'package:vptrics/modules/email/widgets/stateless/emails_screen.dart';
import 'package:vptrics/modules/email/widgets/stateful/read_email_screen.dart';
import 'package:vptrics/modules/notifications/widgets/stateful/notifications_screen.dart';
import 'package:vptrics/modules/patients/widgets/stateful/create_patient_screen.dart';
import 'package:vptrics/modules/patients/widgets/stateful/patient_dashboard_screen.dart';
import 'package:vptrics/modules/patients/widgets/stateless/patients_screen.dart';
import 'package:vptrics/modules/patients/widgets/stateful/patients_search_screen.dart';
import 'package:vptrics/modules/auth/widgets/stateful/login_screen.dart';
import 'package:vptrics/modules/settings/widgets/stateless/settings_screen.dart';
import 'package:vptrics/modules/sms/widgets/stateful/sms_screen.dart';
import 'package:vptrics/shared_widgets/stateless/app_launch_scree.dart';
import 'package:vptrics/shared_widgets/stateless/scaffold_background.dart';

import 'modules/core/services/app_info.service.dart';
import 'modules/onboard/widgets/stateful/onboard_screen.dart';

class AppRoute {
  Route<dynamic> Function(RouteSettings) get onGenerateRoute {
    return (RouteSettings routeSettings) {
      return Platform.isIOS
          ? CupertinoPageRoute(builder: _getBuilder(routeSettings))
          : MaterialPageRoute(builder: _getBuilder(routeSettings));
    };
  }

  Future<String> get initialRoute async {
    if (await GetIt.instance<AppInfoService>().isFirstLaunch) {
      return OnboardScreen.route;
    } else if (GetIt.I.get<FirebaseAuth>().currentUser != null) {
      return PatientsScreen.route;
    } else {
      return LoginScreen.route;
    }
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
              child: (routeSettings.arguments is CreatePatientScreenData)
                  ? CreatePatientScreen(
                      data: routeSettings.arguments as CreatePatientScreenData,
                    )
                  : CreatePatientScreen(),
            );
        break;
      case PatientDashboardScreen.route:
        builder = (context) => ScaffoldBackground(
              child: PatientDashboardScreen(
                data: routeSettings.arguments as PatientDashboardScreenData,
              ),
            );
        break;
      case EmailsScreen.route:
        builder = (context) => ScaffoldBackground(
              child: EmailsScreen(
                data: routeSettings.arguments as EmailsScreenData,
              ),
            );
        break;
      case ComposeEmailScreen.route:
        builder = (context) => ScaffoldBackground(
              child: ComposeEmailScreen(
                data: routeSettings.arguments as ComposeEmailScreenData,
              ),
            );
        break;
      case ReadEmailScreen.route:
        builder = (context) => ScaffoldBackground(
              child: ReadEmailScreen(
                data: routeSettings.arguments as ReadEmailScreenData,
              ),
            );
        break;
      case SmsScreen.route:
        builder = (context) => ScaffoldBackground(
              child: SmsScreen(
                data: routeSettings.arguments as SmsScreenData,
              ),
            );
        break;
      case SettingsScreen.route:
        builder = (context) => ScaffoldBackground(
              child: SettingsScreen(),
            );
        break;
      case NotificationsScreen.route:
        builder = (context) => ScaffoldBackground(
              child: NotificationsScreen(),
            );
        break;
      case DataScreen.route:
        builder = (context) => ScaffoldBackground(
              child: DataScreen(
                data: routeSettings.arguments as DataScreenData,
              ),
            );
        break;
      case AppLaunchScreen.route:
        builder = (context) => ScaffoldBackground(
              child: AppLaunchScreen(),
            );
        break;
    }

    return builder;
  }
}
