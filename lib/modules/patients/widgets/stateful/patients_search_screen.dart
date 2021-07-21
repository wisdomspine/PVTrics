import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vptrics/shared_widgets/stateless/app_bottom_app_bar.dart';
import 'package:vptrics/styles/app_icons.dart';

class PatientsSearchScreen extends StatefulWidget {
  static const String route = "PatientsSearchScreen";
  const PatientsSearchScreen({Key? key}) : super(key: key);

  @override
  _PatientsSearchScreen createState() => _PatientsSearchScreen();
}

class _PatientsSearchScreen extends State<PatientsSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          decoration: InputDecoration(
            fillColor: Theme.of(context).cardColor,
            hintText: "Search patients ...",
            enabledBorder: (Theme.of(context).inputDecorationTheme.enabledBorder
                    as OutlineInputBorder)
                .copyWith(
              borderRadius: BorderRadius.circular(50),
            ),
            focusedBorder: (Theme.of(context).inputDecorationTheme.focusedBorder
                    as OutlineInputBorder)
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
                  transform: Matrix4.rotationZ(-math.pi / 4),
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
                  transform: Matrix4.rotationZ(-math.pi / 4),
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
                  transform: Matrix4.rotationZ(-math.pi / 4),
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
                  transform: Matrix4.rotationZ(-math.pi / 4),
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
                  transform: Matrix4.rotationZ(-math.pi / 4),
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
                  transform: Matrix4.rotationZ(-math.pi / 4),
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
                  transform: Matrix4.rotationZ(-math.pi / 4),
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
        activeTab: AppBottomAppBarTab.patients,
        onTap: (tab) => {
          if (tab == AppBottomAppBarTab.notifications)
            {}
          else if (tab == AppBottomAppBarTab.settings)
            {}
        },
      ),
    );
  }
}
