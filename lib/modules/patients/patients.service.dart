import 'dart:async';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vptrics/modules/patients/models/patient.model.dart';

class PatientsService extends ChangeNotifier {
  List<Patient> _patients = [];
  StreamSubscription? _subscription;

  PatientsService() {
    _init();
    GetIt.I<FirebaseAuth>().userChanges().listen((event) {
      _init();
    });
  }

  _init() {
    _subscription?.cancel();
    _subscription = GetIt.I<FirebaseFirestore>()
        .collection("patients")
        .snapshots()
        .listen((querySnapshot) {
      this._patients = querySnapshot.docs.map((doc) {
        Map<String, dynamic> map = doc.data();
        map["ref"] = doc.reference;
        map["dob"] = (map["dob"] as Timestamp).toDate();
        return Patient.fromMap(map);
      }).toList();

      notifyListeners();
    });
  }

  List<Patient> get all => _patients;

  List<Patient> search(String? search) {
    search ??= "";
    search = search.trim().toLowerCase();
    RegExp reg = RegExp("$search", caseSensitive: false, multiLine: true);
    return all
        .where((patient) =>
            reg.hasMatch(patient.address.trim()) ||
            reg.hasMatch(patient.email.trim()) ||
            reg.hasMatch(patient.firstname.trim()) ||
            reg.hasMatch(patient.lastname.trim()) ||
            reg.hasMatch(patient.name.trim()))
        .toList();
  }

  Patient? getByRef(DocumentReference reference) {
    try {
      return this.all.firstWhere((patient) => patient.ref == reference);
    } on StateError {
      return null;
    }
  }

  Future<DocumentReference> writePatient({
    required Patient patient,
    Uint8List? photo,
  }) async {
    DocumentReference ref;
    if (patient.ref != null) {
      ref = GetIt.I<FirebaseFirestore>()
          .collection("patients")
          .doc((patient.ref as DocumentReference).id);
    } else {
      ref = GetIt.I<FirebaseFirestore>().collection("patients").doc();
    }
    if (photo != null) {
      patient = patient.copyWith(photo: await updatePhoto(photo, ref.id));
    }
    await ref.set(patient.firebaseObject);
    return ref;
  }

  Future<String> updatePhoto(Uint8List photo, String id) async {
    Reference ref = GetIt.I<FirebaseStorage>().ref("patients/$id/passport");
    await ref.putData(photo);
    return ref.getDownloadURL();
  }

  Future deletePatient(DocumentReference reference) async {
    final map = await GetIt.I<FirebaseFirestore>()
        .collection("metrics")
        .where("patient", isEqualTo: reference)
        .get();
    final patientMap = await GetIt.I<FirebaseFirestore>()
        .collection("devices")
        .where("patient", isEqualTo: reference)
        .get();
    return GetIt.I<FirebaseFirestore>().runTransaction((transaction) async {
      patientMap.docs.forEach((doc) {
        transaction = transaction.set(
          doc.reference,
          {"patient": null},
          SetOptions(merge: true),
        );
      });
      map.docs.forEach((doc) {
        transaction = transaction.delete(doc.reference);
      });

      return transaction.delete(reference);
    });
  }
}
