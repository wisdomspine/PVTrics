import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vptrics/modules/metrics/models/patient_metrics.model.dart';

class MetricsService extends ChangeNotifier {
  List<PatientMetrics> _metrices = [];

  MetricsService() {
    _init();
  }

  _init() {
    GetIt.I<FirebaseFirestore>()
        .collection("metrics")
        .orderBy("time", descending: true)
        .snapshots()
        .listen((querySnapshot) {
      this._metrices = querySnapshot.docs.map((doc) {
        Map<String, dynamic> map = doc.data();
        map["ref"] = doc.reference;
        map["time"] = (map["time"] as Timestamp).toDate();
        return PatientMetrics.fromMap(map);
      }).toList();

      notifyListeners();
    });
  }

  List<PatientMetrics> get all => _metrices;

  List<PatientMetrics> forPatient(
    DocumentReference reference, {
    Object? startDate,
    Object? endDate,
  }) {
    return this.all.where((metrics) {
      bool match = metrics.patientRef == reference;
      if (startDate != null && startDate is DateTime) {
        match = metrics.time.millisecondsSinceEpoch >=
            startDate.millisecondsSinceEpoch;
      }
      if (endDate != null && endDate is DateTime) {
        match = metrics.time.millisecondsSinceEpoch <=
            endDate.millisecondsSinceEpoch;
      }
      return match;
    }).toList();
  }

  PatientMetrics? getByRef(DocumentReference reference) {
    try {
      return this.all.firstWhere((metrics) => metrics.ref == reference);
    } on StateError {
      return null;
    }
  }

  Future<DocumentReference> markAsRead({required DocumentReference ref}) async {
    await ref.set({"read": true}, SetOptions(merge: true));
    return ref;
  }
}
