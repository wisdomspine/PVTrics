import 'package:flutter/material.dart';
import 'package:vptrics/modules/core/enums/gender.enum.dart';
import 'package:vptrics/modules/patients/widgets/stateful/create_patient_screen.dart';
import 'package:vptrics/styles/app_icons.dart';
import 'dart:math' as math;

import 'package:vptrics/styles/styles.dart';
import 'package:intl/intl.dart';

class PatientsDialog {
  PatientsDialog() {
    throw Exception("[PatientsDialog] can't be instantiated");
  }

  static Future<dynamic> showPatientInfo(
    BuildContext context,
  ) {
    return showDialog<bool>(
      context: context,
      builder: (context) => Dialog(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Center(
                      child: CircleAvatar(
                        radius: 56,
                        backgroundImage: AssetImage(
                          "assets/images/default_passport.jpg",
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      AppIcons.cancel,
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                )
              ],
            ),

            // details
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // firstname
                  Text("Firstname"),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "ThankGod",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  // lastname
                  Text("Lastname"),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Okwute",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 16,
                  ),

                  // dob
                  Text("Date of birth"),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    DateFormat.yMd().format(
                      DateTime.now(),
                    ),
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  // gender
                  Text("Gender"),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    genderLabel(Gender.male),
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 16,
                  ),

                  // phone
                  Text("Phone number"),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "+2348160606990",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 16,
                  ),

                  // email
                  Text("Email"),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "okwute@gmail.com",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  // address
                  Text("Address"),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "FULafia",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Create Patient
                  Navigator.popAndPushNamed(
                    context,
                    CreatePatientScreen.route,
                  );
                },
                child: Text(
                  "Edit",
                  style: Theme.of(context).accentTextTheme.subtitle1?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12),
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
