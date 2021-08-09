import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Device {
  final String name;
  final DocumentReference? patient;
  final DocumentReference ref;
  Device({
    required this.name,
    required this.patient,
    required this.ref,
  });

  Device copyWith({
    String? name,
    DocumentReference? patient,
    DocumentReference? ref,
  }) {
    return Device(
      name: name ?? this.name,
      patient: patient ?? this.patient,
      ref: ref ?? this.ref,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'patient': patient,
      'ref': ref,
    };
  }

  factory Device.fromMap(Map<String, dynamic> map) {
    return Device(
      name: map['name'],
      patient: map['patient'],
      ref: map['ref'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Device.fromJson(String source) => Device.fromMap(json.decode(source));

  @override
  String toString() => 'Device(name: $name, patient: $patient, ref: $ref)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Device &&
        other.name == name &&
        other.patient == patient &&
        other.ref == ref;
  }

  @override
  int get hashCode => name.hashCode ^ patient.hashCode ^ ref.hashCode;
}
