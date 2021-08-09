import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:recase/recase.dart';
import 'package:vptrics/modules/auth/widgets/stateless/act_on_signout.dart';
import 'package:vptrics/modules/notifications/widgets/stateful/notifications_screen.dart';
import 'package:vptrics/modules/patients/models/patient.model.dart';
import 'package:vptrics/modules/patients/patients.service.dart';
import 'package:vptrics/modules/patients/widgets/stateful/create_patient_screen.dart';
import 'package:vptrics/modules/patients/widgets/stateful/patient_dashboard_screen.dart';
import 'package:vptrics/modules/patients/widgets/stateful/patients_search_screen.dart';
import 'package:vptrics/modules/settings/widgets/stateless/settings_screen.dart';
import 'package:vptrics/shared_widgets/stateless/app_bottom_app_bar.dart';
import 'package:vptrics/shared_widgets/stateless/not_found.dart';
import 'package:vptrics/shared_widgets/stateless/page_centered_not_found.dart';
import 'package:vptrics/styles/app_icons.dart';

class PatientsScreen extends StatelessWidget with GetItMixin {
  static const String route = "PatientsScreen";
  PatientsScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final List<Patient> patients =
        watchOnly<PatientsService, List<Patient>>((service) => service.all);
    List<Widget> children = [];
    patients.forEach((patient) {
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
          onTap: () {
            Navigator.pushNamed(
              context,
              PatientDashboardScreen.route,
              arguments: PatientDashboardScreenData(
                  ref: patient.ref as DocumentReference),
            );
          },
          tileColor: Theme.of(context).cardColor.withOpacity(.75),
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            radius: 32,
            backgroundImage: NetworkImage(patient.photo),
          ),
          title: Text(ReCase(patient.name).titleCase),
          subtitle: Text(
            "${patient.genderLabel}, ${patient.years} years",
          ),
          trailing: Container(
            transform: Matrix4.rotationZ(-pi / 4),
            transformAlignment: Alignment.center,
            child: Icon(
              AppIcons.attach,
            ),
          ),
        ),
      ]);
    });
    return ActOnSignout(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Patients",
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, PatientsSearchScreen.route);
              },
              icon: Icon(
                AppIcons.search,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: children.length > 0
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: children,
                  ),
                )
              : PageCenteredNotFound(
                  child: NotFound(
                    title: "No Patient yet",
                    action: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, CreatePatientScreen.route);
                      },
                      child: Text("Add Patient"),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
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
              case AppBottomAppBarTab.notifications:
                Navigator.pushReplacementNamed(
                  context,
                  NotificationsScreen.route,
                );
                break;
              default:
            }
          },
          activeTab: AppBottomAppBarTab.patients,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, CreatePatientScreen.route);
          },
          child: Text(
            "New",
            style: Theme.of(context).accentTextTheme.subtitle1,
          ),
        ),
      ),
    );
  }
}
