import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class Sms {
  final String message;
  final DocumentReference? patientRef;
  final DateTime time;
  final bool isSent;
  final DocumentReference? ref;
  Sms({
    required this.message,
    this.patientRef,
    required this.time,
    required this.isSent,
    this.ref,
  });

  Sms copyWith({
    String? message,
    DocumentReference? patientRef,
    DateTime? time,
    bool? isSent,
    DocumentReference? ref,
  }) {
    return Sms(
      message: message ?? this.message,
      patientRef: patientRef ?? this.patientRef,
      time: time ?? this.time,
      isSent: isSent ?? this.isSent,
      ref: ref ?? this.ref,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'patientRef': patientRef,
      'time': time.millisecondsSinceEpoch,
      'isSent': isSent,
      'ref': ref,
    };
  }

  factory Sms.fromMap(Map<String, dynamic> map) {
    return Sms(
      message: map['message'],
      patientRef: map['patientRef'],
      time: map['time'],
      isSent: map['isSent'],
      ref: map['ref'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Sms.fromJson(String source) => Sms.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Sms(message: $message, patientRef: $patientRef, time: $time, isSent: $isSent, ref: $ref)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Sms &&
        other.message == message &&
        other.patientRef == patientRef &&
        other.time == time &&
        other.isSent == isSent &&
        other.ref == ref;
  }

  @override
  int get hashCode {
    return message.hashCode ^
        patientRef.hashCode ^
        time.hashCode ^
        isSent.hashCode ^
        ref.hashCode;
  }

  Map<String, dynamic> get firebaseObject {
    final map = toMap();
    map["time"] = Timestamp.now();
    map.remove("ref");
    return map;
  }
}
