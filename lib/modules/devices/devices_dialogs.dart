import 'package:flutter/material.dart';
import 'package:vptrics/styles/app_icons.dart';
import 'dart:math' as math;

import 'package:vptrics/styles/styles.dart';

class DevicesDialog {
  DevicesDialog() {
    throw Exception("[CoreDialogs] can't be instantiated");
  }

  static Future<dynamic> showDevices(
    BuildContext context,
  ) {
    return showDialog<bool>(
      context: context,
      builder: (context) => Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () {
                // TOD: show all devices
                Navigator.pop(context);
              },
              title: Text(
                "Amigo 2022",
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    // fontWeight: FontWeight.bold,
                    ),
              ),
              trailing: Container(
                transform: Matrix4.rotationZ(-math.pi / 4),
                transformAlignment: Alignment.center,
                child: Icon(
                  AppIcons.attach,
                  color: activeColor,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                // TOD: show all devices
                Navigator.pop(context);
              },
              title: Text(
                "Amigo 2021",
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    // fontWeight: FontWeight.bold,
                    ),
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
          ],
        ),
      ),
    );
  }
}
