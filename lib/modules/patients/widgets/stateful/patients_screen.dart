import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vptrics/modules/patients/widgets/stateful/create_patient_screen.dart';
import 'package:vptrics/modules/patients/widgets/stateful/patients_search_screen.dart';
import 'package:vptrics/shared_widgets/stateless/app_bottom_app_bar.dart';
import 'package:vptrics/styles/app_icons.dart';

class PatientsScreen extends StatefulWidget {
  static const String route = "PatientsScreen";
  const PatientsScreen({Key? key}) : super(key: key);

  @override
  _PatientsScreenState createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
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
                onTap: () {},
                tileColor: Theme.of(context).cardColor.withOpacity(.75),
                leading: CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(
                    "assets/images/default_passport.jpg",
                  ),
                ),
                title: Text("John Doe"),
                subtitle: Text(
                  "Male, 25 years",
                ),
                trailing: Container(
                  transform: Matrix4.rotationZ(-pi / 4),
                  transformAlignment: Alignment.center,
                  child: Icon(
                    AppIcons.attach,
                  ),
                ),
              ),
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
                onTap: () {},
                tileColor: Theme.of(context).cardColor.withOpacity(.75),
                leading: CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(
                    "assets/images/default_passport.jpg",
                  ),
                ),
                title: Text("John Doe"),
                subtitle: Text(
                  "Male, 25 years",
                ),
                trailing: Container(
                  transform: Matrix4.rotationZ(-pi / 4),
                  transformAlignment: Alignment.center,
                  child: Icon(
                    AppIcons.attach,
                  ),
                ),
              ),
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
                onTap: () {},
                tileColor: Theme.of(context).cardColor.withOpacity(.75),
                leading: CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(
                    "assets/images/default_passport.jpg",
                  ),
                ),
                title: Text("John Doe"),
                subtitle: Text(
                  "Male, 25 years",
                ),
                trailing: Container(
                  transform: Matrix4.rotationZ(-pi / 4),
                  transformAlignment: Alignment.center,
                  child: Icon(
                    AppIcons.attach,
                  ),
                ),
              ),
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
                onTap: () {},
                tileColor: Theme.of(context).cardColor.withOpacity(.75),
                leading: CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(
                    "assets/images/default_passport.jpg",
                  ),
                ),
                title: Text("John Doe"),
                subtitle: Text(
                  "Male, 25 years",
                ),
                trailing: Container(
                  transform: Matrix4.rotationZ(-pi / 4),
                  transformAlignment: Alignment.center,
                  child: Icon(
                    AppIcons.attach,
                  ),
                ),
              ),
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
                onTap: () {},
                tileColor: Theme.of(context).cardColor.withOpacity(.75),
                leading: CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(
                    "assets/images/default_passport.jpg",
                  ),
                ),
                title: Text("John Doe"),
                subtitle: Text(
                  "Male, 25 years",
                ),
                trailing: Container(
                  transform: Matrix4.rotationZ(-pi / 4),
                  transformAlignment: Alignment.center,
                  child: Icon(
                    AppIcons.attach,
                  ),
                ),
              ),
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
                onTap: () {},
                tileColor: Theme.of(context).cardColor.withOpacity(.75),
                leading: CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(
                    "assets/images/default_passport.jpg",
                  ),
                ),
                title: Text("John Doe"),
                subtitle: Text(
                  "Male, 25 years",
                ),
                trailing: Container(
                  transform: Matrix4.rotationZ(-pi / 4),
                  transformAlignment: Alignment.center,
                  child: Icon(
                    AppIcons.attach,
                  ),
                ),
              ),
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
                onTap: () {},
                tileColor: Theme.of(context).cardColor.withOpacity(.75),
                leading: CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(
                    "assets/images/default_passport.jpg",
                  ),
                ),
                title: Text("John Doe"),
                subtitle: Text(
                  "Male, 25 years",
                ),
                trailing: Container(
                  transform: Matrix4.rotationZ(-pi / 4),
                  transformAlignment: Alignment.center,
                  child: Icon(
                    AppIcons.attach,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomAppBar(
        onTap: (tab) => {},
        activeTab: AppBottomAppBarTab.petients,
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
    );
  }
}
