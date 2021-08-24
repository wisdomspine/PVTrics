import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vptrics/libs/bulk_sms.dart';
import 'package:vptrics/modules/app-config/app-config.service.dart';
import 'package:vptrics/modules/app-config/models/app-config.model.dart';

import 'models/sms.model.dart';

class SmsService extends ChangeNotifier {
  List<Sms> _sms = [];
  StreamSubscription? _subscription;

  SmsService() {
    _init();
    GetIt.I<FirebaseAuth>().userChanges().listen((event) {
      _init();
    });
  }

  _init() {
    _subscription?.cancel();
    _subscription = GetIt.I<FirebaseFirestore>()
        .collection("sms")
        .orderBy("time", descending: true)
        .snapshots()
        .listen((querySnapshot) {
      this._sms = querySnapshot.docs.map((doc) {
        Map<String, dynamic> map = doc.data();
        map["ref"] = doc.reference;
        map["time"] = (map["time"] as Timestamp).toDate();
        return Sms.fromMap(map);
      }).toList();

      notifyListeners();
    });
  }

  List<Sms> get all => _sms;

  List<Sms> forPatient(
    DocumentReference reference,
  ) {
    return this.all.where((sms) => sms.patientRef == reference).toList();
  }

  Sms? getByRef(DocumentReference reference) {
    try {
      return this.all.firstWhere((messages) => messages.ref == reference);
    } on StateError {
      return null;
    }
  }

  sendSms(Sms sms, String phone) async {
    final AppConfig config = GetIt.I<AppConfigService>().config;
    final BulkSms bulkSms = BulkSms(apiKey: config.smsKey);

    DocumentReference ref =
        sms.ref ?? GetIt.I<FirebaseFirestore>().collection("sms").doc();

    if (sms.ref == null) {
      await ref.set(sms.firebaseObject);
    }

    await bulkSms.sendMessage(
        message: sms.message, sender: config.smsSender, receipients: [phone]);
    ref.set({"isSent": true}, SetOptions(merge: true));
    return;
  }
}
