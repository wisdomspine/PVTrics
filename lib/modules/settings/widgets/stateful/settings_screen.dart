import 'package:flutter/material.dart';
import 'package:vptrics/modules/patients/widgets/stateful/patients_screen.dart';
import 'package:vptrics/shared_widgets/stateless/app_bottom_app_bar.dart';

class SettingsScreen extends StatefulWidget {
  static const String route = "SettingsScreen";
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.headline5?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          children: [
            SizedBox(
              height: 24,
            ),
            Card(
              color: Theme.of(context).cardColor.withOpacity(.8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  ListTile(
                    onTap: () {
                      // TOD: show all devices
                    },
                    title: Text(
                      "Devices",
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    trailing: Text(
                      "2",
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                  Divider(
                    color: Theme.of(context).cardColor,
                    thickness: 1,
                  ),
                  ListTile(
                    onTap: () {
                      // TOD: logout
                    },
                    title: Text(
                      "Logout",
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).errorColor,
                          ),
                    ),
                  ),
                  Divider(
                    color: Theme.of(context).cardColor,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: AppBottomAppBar(
        onTap: (tab) {
          switch (tab) {
            case AppBottomAppBarTab.patients:
              Navigator.pushReplacementNamed(
                context,
                PatientsScreen.route,
              );
              break;
            default:
          }
        },
        activeTab: AppBottomAppBarTab.settings,
      ),
    );
  }
}
