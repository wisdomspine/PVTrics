import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vptrics/modules/core/app_dialogs.dart';
import 'package:vptrics/modules/data/widgets/stateless/data_screen.dart';
import 'package:vptrics/modules/devices/devices_dialogs.dart';
import 'package:vptrics/modules/email/widgets/stateful/emails_screen.dart';
import 'package:vptrics/modules/patients/patients_dialogs.dart';
import 'package:vptrics/modules/patients/widgets/stateless/patient_dashboard_tab.dart';
import 'package:vptrics/modules/sms/widgets/stateful/sms_screen.dart';
import 'package:vptrics/styles/app_icons.dart';

class PatientDashboardScreen extends StatefulWidget {
  static const String route = "PatientDashboardScreen";
  const PatientDashboardScreen({Key? key}) : super(key: key);

  @override
  _PatientDashboardScreenState createState() => _PatientDashboardScreenState();
}

class _PatientDashboardScreenState extends State<PatientDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Patient"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              childAspectRatio: 1.4,
              children: [
                SizedBox(),
                Center(
                  child: PatientDashboardTab(
                    icon: Icon(AppIcons.at),
                    onPressed: () {
                      Navigator.pushNamed(context, EmailsScreen.route);
                    },
                    label: "Emails",
                  ),
                ),
                SizedBox(),

                // second row
                Center(
                  child: PatientDashboardTab(
                    icon: Icon(AppIcons.chat_bubble_text),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        SmsScreen.route,
                      );
                    },
                    label: "Sms",
                  ),
                ),
                SizedBox(),
                Center(
                  child: PatientDashboardTab(
                    icon: Icon(AppIcons.info),
                    onPressed: () {
                      PatientsDialog.showPatientInfo(context);
                    },
                    label: "Details",
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                PatientsDialog.showPatientInfo(context);
              },
              child: Center(
                child: CircleAvatar(
                  radius: 56,
                  backgroundImage: AssetImage(
                    "assets/images/default_passport.jpg",
                  ),
                ),
              ),
            ),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              childAspectRatio: 1.4,
              children: [
                Center(
                  child: PatientDashboardTab(
                    icon: Icon(AppIcons.bar_chart),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        DataScreen.route,
                      );
                    },
                    label: "Data",
                  ),
                ),
                SizedBox(),
                Center(
                  child: PatientDashboardTab(
                    icon: Icon(
                      AppIcons.trash,
                      color: Theme.of(context).errorColor,
                    ),
                    onPressed: () {
                      AppDialogs.confirm(
                        context,
                        message:
                            "Plase, confirm you want to delete all patient records",
                        acceptText: "Delete",
                        acceptTextColor: Theme.of(context).errorColor,
                      ).then((value) {
                        if (value ?? false) {
                          // TODO: delete patient
                        }
                      });
                    },
                    label: "Delete",
                  ),
                ),
                SizedBox(),
                Center(
                  child: PatientDashboardTab(
                    icon: Icon(AppIcons.attach),
                    onPressed: () {
                      DevicesDialog.showDevices(context);
                    },
                    label: "Attach to device",
                  ),
                ),
                SizedBox(),

                // second row
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              "John Doe",
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              "Male, 25 years",
            ),
          ],
        ),
      ),
    );
  }
}
