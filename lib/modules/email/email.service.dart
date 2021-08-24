import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vptrics/libs/mail/send_response.dart';
import 'package:vptrics/libs/mail/send_response_status.dart';
import 'package:vptrics/libs/mailgun/mailgun.dart';
import 'package:vptrics/modules/app-config/app-config.service.dart';
import 'package:vptrics/modules/app-config/models/app-config.model.dart';

import 'models/email.model.dart';

class EmailService extends ChangeNotifier {
  List<Email> _emails = [];
  StreamSubscription? _subscription;

  EmailService() {
    _init();
    GetIt.I<FirebaseAuth>().userChanges().listen((event) {
      _init();
    });
  }

  _init() {
    _subscription?.cancel();
    _subscription = GetIt.I<FirebaseFirestore>()
        .collection("emails")
        .orderBy("time", descending: true)
        .snapshots()
        .listen((querySnapshot) {
      this._emails = querySnapshot.docs.map((doc) {
        Map<String, dynamic> map = doc.data();
        map["ref"] = doc.reference;
        map["time"] = (map["time"] as Timestamp).toDate();
        return Email.fromMap(map);
      }).toList();

      notifyListeners();
    });
  }

  List<Email> get all => _emails;

  List<Email> forPatient(
    DocumentReference reference,
  ) {
    // print("$reference");
    return this.all.where((email) => email.patientRef == reference).toList();
  }

  Email? getByRef(DocumentReference reference) {
    try {
      return this.all.firstWhere((messages) => messages.ref == reference);
    } on StateError {
      return null;
    }
  }

  Future<DocumentReference> sendEmail(Email email) async {
    final AppConfig config = GetIt.I<AppConfigService>().config;
    final Mailgun mailer =
        Mailgun(domain: config.mailgunDomain, apiKey: config.mailgunKey);

    DocumentReference ref =
        email.ref ?? GetIt.I<FirebaseFirestore>().collection("emails").doc();

    if (email.ref == null) {
      await ref.set(email.firebaseObject);
    }

    SendResponse response = await mailer.send(
      from: config.mailSender,
      to: ["${email.receipientName} <${email.receipientEmail}>"],
      subject: email.subject,
      text: email.message,
    );

    await ref.set({"isSent": response.status != SendResponseStatus.FAIL},
        SetOptions(merge: true));
    return ref;
  }
}
