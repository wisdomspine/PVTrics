import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class PatientMetrics {
  final int pulse;
  final int temp;
  final DocumentReference? patientRef;
  final DateTime time;
  final bool read;
  final DocumentReference? ref;
  PatientMetrics({
    required this.pulse,
    required this.temp,
    required this.patientRef,
    required this.time,
    required this.read,
    required this.ref,
  });

  PatientMetrics copyWith({
    int? pulse,
    int? temp,
    DocumentReference? patientRef,
    DateTime? time,
    bool? read,
    DocumentReference? ref,
  }) {
    return PatientMetrics(
      pulse: pulse ?? this.pulse,
      temp: temp ?? this.temp,
      patientRef: patientRef ?? this.patientRef,
      time: time ?? this.time,
      read: read ?? this.read,
      ref: ref ?? this.ref,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pulse': pulse,
      'temp': temp,
      'patientRef': patientRef,
      'time': time.millisecondsSinceEpoch,
      'read': read,
      'ref': ref,
    };
  }

  factory PatientMetrics.fromMap(Map<String, dynamic> map) {
    return PatientMetrics(
      pulse: map['pulse'],
      temp: map['temp'],
      patientRef: map['patientRef'],
      time: map['time'],
      read: map['read'],
      ref: map['ref'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PatientMetrics.fromJson(String source) =>
      PatientMetrics.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PatientMetrics(pulse: $pulse, temp: $temp, patientRef: $patientRef, time: $time, read: $read, ref: $ref)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PatientMetrics &&
        other.pulse == pulse &&
        other.temp == temp &&
        other.patientRef == patientRef &&
        other.time == time &&
        other.read == read &&
        other.ref == ref;
  }

  @override
  int get hashCode {
    return pulse.hashCode ^
        temp.hashCode ^
        patientRef.hashCode ^
        time.hashCode ^
        read.hashCode ^
        ref.hashCode;
  }
}
