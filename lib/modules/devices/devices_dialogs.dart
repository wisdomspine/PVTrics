import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:recase/recase.dart';
import 'package:vptrics/modules/devices/devices.service.dart';
import 'package:vptrics/modules/devices/models/device.model.dart';
import 'package:vptrics/styles/app_icons.dart';
import 'dart:math' as math;

import 'package:vptrics/styles/styles.dart';

class DevicesDialog {
  DevicesDialog() {
    throw Exception("[CoreDialogs] can't be instantiated");
  }

  static Future<Device?> showDevices(
    BuildContext context,
  ) {
    return showDialog<Device>(
      context: context,
      builder: (context) => Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...GetIt.I<DevicesService>().devices.map((device) {
              return ListTile(
                onTap: () {
                  // TOD: show all devices
                  Navigator.pop(context, device);
                },
                title: Text(
                  "${ReCase(device.name).titleCase}",
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      // fontWeight: FontWeight.bold,
                      ),
                ),
                trailing: Container(
                  transform: Matrix4.rotationZ(-math.pi / 4),
                  transformAlignment: Alignment.center,
                  child: Icon(
                    AppIcons.attach,
                    color: (device.patient != null) ? activeColor : null,
                  ),
                ),
              );
            }),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
