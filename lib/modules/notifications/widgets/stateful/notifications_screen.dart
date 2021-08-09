import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vptrics/modules/patients/widgets/stateless/patients_screen.dart';
import 'package:vptrics/modules/settings/widgets/stateless/settings_screen.dart';
import 'package:vptrics/shared_widgets/stateless/app_bottom_app_bar.dart';

class NotificationsScreen extends StatefulWidget {
  static const String route = "NotificationsScreen";
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: Theme.of(context).textTheme.headline5?.copyWith(
                fontWeight: FontWeight.bold,
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
                onTap: () {
                  // TODO: mark notification as read and move to show data
                },
                tileColor: Theme.of(context).cardColor.withOpacity(.75),
                leading: CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(
                    "assets/images/default_passport.jpg",
                  ),
                ),
                title: Text("John Doe"),
                trailing: Text(
                  "Jun 12",
                ),
                subtitle: Text(
                  "25°F  :  256 bpm  : 200un ",
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
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
                trailing: Text(
                  "Jun 12",
                ),
                subtitle: Text(
                  "25°F  :  256 bpm  : 200un ",
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
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
                trailing: Text(
                  "Jun 12",
                ),
                subtitle: Text(
                  "25°F  :  256 bpm  : 200un ",
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
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
                trailing: Text(
                  "Jun 12",
                ),
                subtitle: Text(
                  "25°F  :  256 bpm  : 200un ",
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
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
                trailing: Text(
                  "Jun 12",
                ),
                subtitle: Text(
                  "25°F  :  256 bpm  : 200un ",
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
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
                trailing: Text(
                  "Jun 12",
                ),
                subtitle: Text(
                  "25°F  :  256 bpm  : 200un ",
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
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
                trailing: Text(
                  "Jun 12",
                ),
                subtitle: Text(
                  "25°F  :  256 bpm  : 200un ",
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ],
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
    );
  }
}
