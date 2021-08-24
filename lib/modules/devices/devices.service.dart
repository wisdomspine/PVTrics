import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vptrics/modules/devices/models/device.model.dart';

class DevicesService extends ChangeNotifier {
  List<Device> _devices = [];
  StreamSubscription? _subscription;
  DevicesService() {
    _init();
    GetIt.I<FirebaseAuth>().userChanges().listen((event) {
      _init();
    });
  }

  _init() {
    _subscription?.cancel();
    _subscription = GetIt.I<FirebaseFirestore>()
        .collection("devices")
        .snapshots()
        .listen((snapshot) {
      _devices = snapshot.docs.map((doc) {
        Map<String, dynamic> map = doc.data();
        map["ref"] = doc.reference;
        return Device.fromMap(map);
      }).toList();

      notifyListeners();
    });
  }

  List<Device> get devices => _devices;
  int get total => _devices.length;

  Device? deviceAttachedToPatient(DocumentReference reference) {
    try {
      return this.devices.firstWhere(
            (device) => device.patient == reference,
          );
    } on StateError {
      return null;
    }
  }

  attachDeviceToPatient(
      DocumentReference deviceRef, DocumentReference patientRef) {
    return deviceRef.set({"patient": patientRef}, SetOptions(merge: true));
  }

  removeDeviceFromPatient(DocumentReference patientRef) {
    return GetIt.I<FirebaseFirestore>().runTransaction((transaction) async {
      devices.where((device) => device.patient == patientRef).forEach((device) {
        transaction = transaction.set(
          device.ref,
          {"patient": null},
          SetOptions(merge: true),
        );
      });
      return transaction;
    });
  }
}
