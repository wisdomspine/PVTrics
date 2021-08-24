import 'dart:convert';

import 'package:vptrics/modules/metrics/models/patient_metrics.model.dart';
import 'package:vptrics/modules/patients/models/patient.model.dart';

class MetricsNotification {
  final PatientMetrics metrics;
  final Patient? patient;
  MetricsNotification({
    required this.metrics,
    this.patient,
  });

  MetricsNotification copyWith({
    PatientMetrics? metrics,
    Patient? patient,
  }) {
    return MetricsNotification(
      metrics: metrics ?? this.metrics,
      patient: patient ?? this.patient,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'metrics': metrics.toMap(),
      'patient': patient?.toMap(),
    };
  }

  factory MetricsNotification.fromMap(Map<String, dynamic> map) {
    return MetricsNotification(
      metrics: PatientMetrics.fromMap(map['metrics']),
      patient: Patient.fromMap(map['patient']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MetricsNotification.fromJson(String source) =>
      MetricsNotification.fromMap(json.decode(source));

  @override
  String toString() => 'Notification(metrics: $metrics, patient: $patient)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MetricsNotification &&
        other.metrics == metrics &&
        other.patient == patient;
  }

  @override
  int get hashCode => metrics.hashCode ^ patient.hashCode;
}
