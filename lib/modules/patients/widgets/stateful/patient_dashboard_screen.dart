import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vptrics/modules/patients/widgets/stateless/patient_dashboard_tab.dart';
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
                    onPressed: () {},
                    label: "Emails",
                  ),
                ),
                SizedBox(),

                // second row
                Center(
                  child: PatientDashboardTab(
                    icon: Icon(AppIcons.chat_bubble_text),
                    onPressed: () {},
                    label: "Sms",
                  ),
                ),
                SizedBox(),
                Center(
                  child: PatientDashboardTab(
                    icon: Icon(AppIcons.info),
                    onPressed: () {},
                    label: "Details",
                  ),
                ),
              ],
            ),
            Center(
              child: CircleAvatar(
                radius: 56,
                backgroundImage: AssetImage(
                  "assets/images/default_passport.jpg",
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
                    onPressed: () {},
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
                    onPressed: () {},
                    label: "Delete",
                  ),
                ),
                SizedBox(),
                Center(
                  child: PatientDashboardTab(
                    icon: Icon(AppIcons.attach),
                    onPressed: () {},
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
