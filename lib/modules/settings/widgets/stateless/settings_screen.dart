import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:vptrics/modules/auth/widgets/stateless/act_on_signout.dart';
import 'package:vptrics/modules/core/app_dialogs.dart';
import 'package:vptrics/modules/devices/devices.service.dart';
import 'package:vptrics/modules/notifications/services/snackbar.service.dart';
import 'package:vptrics/modules/notifications/widgets/stateful/notifications_screen.dart';
import 'package:vptrics/modules/patients/widgets/stateless/patients_screen.dart';
import 'package:vptrics/shared_widgets/stateless/app_bottom_app_bar.dart';

class SettingsScreen extends StatelessWidget with GetItMixin {
  static const String route = "SettingsScreen";
  SettingsScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    int totalDevices = watchOnly<DevicesService, int>(
      (service) => service.total,
    );
    final Divider divider = Divider(
      color: Theme.of(context).cardColor,
      thickness: 1,
      height: 1,
    );
    return ActOnSignout(
      child: Scaffold(
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
                            // fontWeight: FontWeight.bold,
                            ),
                      ),
                      trailing: Text(
                        "$totalDevices",
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                    divider,
                    ListTile(
                      onTap: () {
                        AppDialogs.confirm(
                          context,
                          message: "Please, confirm you want to logout",
                          acceptText: "Logout",
                          acceptTextColor: Theme.of(context).errorColor,
                        ).then((value) {
                          if (value ?? false) {
                            get<FirebaseAuth>()
                                .signOut()
                                .then((value) {})
                                .catchError((error) {
                              String message = "Sorry, An error has occured";
                              if (error is FirebaseAuthException) {
                                message = error.message ?? message;
                              }
                              SnackbarService.errorText(
                                  context: context, message: message);
                            });
                          }
                        });
                      },
                      title: Text(
                        "Logout",
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                              // fontWeight: FontWeight.bold,
                              color: Theme.of(context).errorColor,
                            ),
                      ),
                    ),
                    divider,
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
              case AppBottomAppBarTab.notifications:
                Navigator.pushReplacementNamed(
                  context,
                  NotificationsScreen.route,
                );
                break;
              default:
            }
          },
          activeTab: AppBottomAppBarTab.settings,
        ),
      ),
    );
  }
}
