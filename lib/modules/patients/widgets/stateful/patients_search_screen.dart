import 'dart:math' as math;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:recase/recase.dart';
import 'package:vptrics/modules/auth/widgets/stateless/act_on_signout.dart';
import 'package:vptrics/modules/patients/models/patient.model.dart';
import 'package:vptrics/modules/patients/widgets/stateful/patient_dashboard_screen.dart';
import 'package:vptrics/shared_widgets/stateless/app_bottom_app_bar.dart';
import 'package:vptrics/shared_widgets/stateless/not_found.dart';
import 'package:vptrics/shared_widgets/stateless/page_centered_not_found.dart';
import 'package:vptrics/styles/app_icons.dart';

import '../../patients.service.dart';

class PatientsSearchScreen extends StatefulWidget
    with GetItStatefulWidgetMixin {
  static const String route = "PatientsSearchScreen";
  PatientsSearchScreen({Key? key}) : super(key: key);

  @override
  _PatientsSearchScreen createState() => _PatientsSearchScreen();
}

class _PatientsSearchScreen extends State<PatientsSearchScreen>
    with GetItStateMixin {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<Patient> patients = watchOnly<PatientsService, List<Patient>>(
        (service) => service.search(_searchController.text));
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
            Navigator.popAndPushNamed(
              context,
              PatientDashboardScreen.route,
              arguments: PatientDashboardScreenData(
                  ref: patient.ref as DocumentReference),
            );
          },
          tileColor: Theme.of(context).cardColor.withOpacity(.75),
          leading: CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage(patient.photo),
          ),
          title: Text(ReCase(patient.name).titleCase),
          subtitle: Text(
            "${patient.genderLabel}, ${patient.years} years",
          ),
          trailing: Container(
            transform: Matrix4.rotationZ(-math.pi / 4),
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
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              AppIcons.cancel,
              color: Theme.of(context).errorColor,
            ),
          ),
          title: TextFormField(
            controller: _searchController,
            onChanged: (search) {
              setState(() {});
            },
            decoration: InputDecoration(
              fillColor: Theme.of(context).cardColor,
              hintText: "Search patients ...",
              enabledBorder: (Theme.of(context)
                      .inputDecorationTheme
                      .enabledBorder as OutlineInputBorder)
                  .copyWith(
                borderRadius: BorderRadius.circular(50),
              ),
              focusedBorder: (Theme.of(context)
                      .inputDecorationTheme
                      .focusedBorder as OutlineInputBorder)
                  .copyWith(
                borderRadius: BorderRadius.circular(50),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  // TODO: search
                },
                icon: Icon(
                  AppIcons.search,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: patients.length > 0
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
                    title: "No Match found",
                  ),
                ),
        ),
        bottomNavigationBar: AppBottomAppBar(
          activeTab: AppBottomAppBarTab.patients,
          onTap: (tab) => {
            if (tab == AppBottomAppBarTab.notifications)
              {}
            else if (tab == AppBottomAppBarTab.settings)
              {}
          },
        ),
      ),
    );
  }
}
