import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import 'package:jiffy/jiffy.dart';
import 'package:recase/recase.dart';
import 'package:vptrics/modules/auth/widgets/stateless/act_on_signout.dart';
import 'package:vptrics/modules/data/widgets/stateful/data_screen.dart';
import 'package:vptrics/modules/notifications/models/metrics_notification.model.dart';
import 'package:vptrics/modules/notifications/notifications.service.dart';
import 'package:vptrics/modules/patients/widgets/stateful/patient_dashboard_screen.dart';
import 'package:vptrics/modules/patients/widgets/stateless/patients_screen.dart';
import 'package:vptrics/modules/settings/widgets/stateless/settings_screen.dart';
import 'package:vptrics/shared_widgets/stateless/app_bottom_app_bar.dart';
import 'package:vptrics/shared_widgets/stateless/loading_screen.dart';
import 'package:vptrics/shared_widgets/stateless/not_found.dart';
import 'package:vptrics/shared_widgets/stateless/page_centered_not_found.dart';

class NotificationsScreen extends StatefulWidget with GetItStatefulWidgetMixin {
  static const String route = "NotificationsScreen";
  NotificationsScreen({Key? key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen>
    with GetItStateMixin {
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    List<MetricsNotification> notifications =
        watchOnly<MetricsNotificationService, List<MetricsNotification>>(
            (service) => service.all);
    MetricsNotificationService service = get<MetricsNotificationService>();
    List<Widget> children = [];
    notifications.forEach((notification) {
      children.addAll([
        SizedBox(
          height: 16,
        ),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: Theme.of(context).dividerColor.withOpacity(.15),
            ),
          ),
          onTap: () async {
            try {
              setState(() {
                _loading = true;
              });
              await service.markAsRead(notification);
              Navigator.popAndPushNamed(context, PatientsScreen.route);
              Navigator.pushNamed(
                context,
                PatientDashboardScreen.route,
                arguments: PatientDashboardScreenData(
                    ref: notification.patient?.ref as DocumentReference),
              );
              Navigator.pushNamed(
                context,
                DataScreen.route,
                arguments: DataScreenData(
                  ref: notification.patient?.ref as DocumentReference,
                ),
              );
            } catch (e) {
              setState(() {
                _loading = false;
              });
            }
          },
          tileColor: Theme.of(context).cardColor.withOpacity(.75),
          leading: CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage(
              notification.patient?.photo ?? "",
            ),
          ),
          title: Text(ReCase(notification.patient?.name ?? 'NILL').titleCase),
          trailing: Text(
            Jiffy(notification.metrics.time).fromNow(),
          ),
          subtitle: Text(
            "${notification.metrics.temp}°C  :  ${notification.metrics.pulse} bpm  ",
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ]);
    });
    return ActOnSignout(
      child: LoadingScreen(
        loading: _loading,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Notifications",
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          body: SafeArea(
            child: children.length > 0
                ? SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: children,
                      ),
                    ),
                  )
                : PageCenteredNotFound(
                    child: NotFound(
                      title: "No notifications yet",
                    ),
                  ),
          ),
          bottomNavigationBar: AppBottomAppBar(
            onTap: (tab) {
              switch (tab) {
                case AppBottomAppBarTab.settings:
                  Navigator.pushReplacementNamed(
                    context,
                    SettingsScreen.route,
                  );
                  break;
                case AppBottomAppBarTab.patients:
                  Navigator.pushReplacementNamed(
                    context,
                    PatientsScreen.route,
                  );
                  break;
                default:
              }
            },
            activeTab: AppBottomAppBarTab.notifications,
          ),
        ),
      ),
    );
  }
}
