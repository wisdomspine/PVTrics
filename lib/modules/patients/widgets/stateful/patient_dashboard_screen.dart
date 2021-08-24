import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:recase/recase.dart';

import 'package:vptrics/modules/core/app_dialogs.dart';
import 'package:vptrics/modules/data/widgets/stateful/data_screen.dart';
import 'package:vptrics/modules/devices/devices.service.dart';
import 'package:vptrics/modules/devices/devices_dialogs.dart';
import 'package:vptrics/modules/devices/models/device.model.dart';
import 'package:vptrics/modules/email/widgets/stateless/emails_screen.dart';
import 'package:vptrics/modules/notifications/services/snackbar.service.dart';
import 'package:vptrics/modules/patients/models/patient.model.dart';
import 'package:vptrics/modules/patients/patients.service.dart';
import 'package:vptrics/modules/patients/patients_dialogs.dart';
import 'package:vptrics/modules/patients/widgets/stateless/patient_dashboard_tab.dart';
import 'package:vptrics/modules/sms/widgets/stateful/sms_screen.dart';
import 'package:vptrics/shared_widgets/stateless/loading_screen.dart';
import 'package:vptrics/styles/app_icons.dart';

class PatientDashboardScreen extends StatefulWidget
    with GetItStatefulWidgetMixin {
  static const String route = "PatientDashboardScreen";

  final PatientDashboardScreenData data;
  PatientDashboardScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  _PatientDashboardScreenState createState() => _PatientDashboardScreenState();
}

class _PatientDashboardScreenState extends State<PatientDashboardScreen>
    with GetItStateMixin {
  bool _processing = false;
  Widget build(BuildContext context) {
    Patient? patient = watchOnly<PatientsService, Patient?>(
        (service) => service.getByRef(widget.data.ref));

    if (patient == null) {
      Future.delayed(Duration.zero, () {
        if (this.mounted) {
          Navigator.pop(context);
        }
      });
    }

    Device? attachedDevice = watchOnly<DevicesService, Device?>(
        (service) => service.deviceAttachedToPatient(widget.data.ref));
    return LoadingScreen(
      loading: _processing,
      child: Scaffold(
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
                        Navigator.pushNamed(
                          context,
                          EmailsScreen.route,
                          arguments: EmailsScreenData(ref: widget.data.ref),
                        );
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
                          arguments: SmsScreenData(ref: widget.data.ref),
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
                        if (patient != null) {
                          PatientsDialog.showPatientInfo(context, patient);
                        }
                      },
                      label: "Details",
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  if (patient != null) {
                    PatientsDialog.showPatientInfo(context, patient);
                  }
                },
                child: Center(
                  child: CircleAvatar(
                    radius: 56,
                    backgroundImage:
                        (patient != null) ? NetworkImage(patient.photo) : null,
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
                          arguments: DataScreenData(ref: widget.data.ref),
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
                            // delete patient
                            deletePatient();
                          }
                        });
                      },
                      label: "Delete",
                    ),
                  ),
                  SizedBox(),
                  Center(
                    child: PatientDashboardTab(
                      icon: Icon(
                        (attachedDevice == null)
                            ? AppIcons.attach
                            : AppIcons.detach,
                      ),
                      onPressed: () {
                        if (attachedDevice == null) {
                          attachDeviceToPatient();
                        } else {
                          removeDeviceFromPatient();
                        }
                      },
                      label: (attachedDevice == null)
                          ? "Attach to device"
                          : "Detach device",
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
                "${ReCase(patient?.name ?? "").titleCase}",
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                "${patient?.genderLabel}, ${patient?.years} years",
              ),
            ],
          ),
        ),
      ),
    );
  }

  deletePatient() {
    PatientsService patientsService = get<PatientsService>();
    setState(() {
      _processing = true;
    });
    patientsService
        .deletePatient(widget.data.ref)
        .then((value) {})
        .catchError((error) {
      _processing = false;
      setState(() {});
      String message = "Patient wasn't deleted";
      if (error is FirebaseException) {
        message = error.message ?? message;
      }
      SnackbarService.showText(context: context, message: message);
    });
  }

  attachDeviceToPatient() async {
    Device? device = await DevicesDialog.showDevices(context);
    if (device == null) return;
    bool proceed = true;
    if (device.patient != null) {
      proceed = (await AppDialogs.confirm(
            context,
            message:
                "This device is attached to another patient, proceeding with the intended action will detach it from the patient",
            acceptText: "Proceed",
          )) ??
          false;
    }

    if (!proceed) return;
    DevicesService deviceService = get<DevicesService>();
    setState(() {
      _processing = true;
    });
    deviceService
        .attachDeviceToPatient(device.ref, widget.data.ref)
        .then((value) {
      _processing = false;
      setState(() {});
    }).catchError((error) {
      _processing = false;
      setState(() {});
      String message = "Attachment failed";
      if (error is FirebaseException) {
        message = error.message ?? message;
      }
      SnackbarService.errorText(context: context, message: message);
    });
  }

  removeDeviceFromPatient() async {
    bool proceed = (await AppDialogs.confirm(
          context,
          message: "Proceed with detachment",
          acceptText: "Proceed",
        )) ??
        false;

    if (!proceed) return;
    DevicesService deviceService = get<DevicesService>();
    setState(() {
      _processing = true;
    });
    deviceService.removeDeviceFromPatient(widget.data.ref).then((value) {
      _processing = false;
      setState(() {});
    }).catchError((error) {
      _processing = false;
      setState(() {});
      String message = "Detachment failed";
      if (error is FirebaseException) {
        message = error.message ?? message;
      }
      SnackbarService.errorText(context: context, message: message);
    });
  }
}

class PatientDashboardScreenData {
  final DocumentReference ref;

  PatientDashboardScreenData({required this.ref});

  PatientDashboardScreenData copyWith({
    DocumentReference? ref,
  }) {
    return PatientDashboardScreenData(
      ref: ref ?? this.ref,
    );
  }
}
