import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Email {
  final String receipientEmail;
  final String receipientName;
  final String subject;
  final String message;
  final DateTime time;
  final bool isSent;
  final DocumentReference? ref;
  final DocumentReference? patientRef;
  Email({
    required this.receipientEmail,
    required this.receipientName,
    required this.subject,
    required this.message,
    required this.time,
    required this.isSent,
    this.ref,
    this.patientRef,
  });

  Email copyWith({
    String? receipientEmail,
    String? receipientName,
    String? subject,
    String? message,
    DateTime? time,
    bool? isSent,
    DocumentReference? ref,
    DocumentReference? patientRef,
  }) {
    return Email(
      receipientEmail: receipientEmail ?? this.receipientEmail,
      receipientName: receipientName ?? this.receipientName,
      subject: subject ?? this.subject,
      message: message ?? this.message,
      time: time ?? this.time,
      isSent: isSent ?? this.isSent,
      ref: ref ?? this.ref,
      patientRef: patientRef ?? this.patientRef,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'receipientEmail': receipientEmail,
      'receipientName': receipientName,
      'subject': subject,
      'message': message,
      'time': time.millisecondsSinceEpoch,
      'isSent': isSent,
      'ref': ref,
      'patientRef': patientRef,
    };
  }

  factory Email.fromMap(Map<String, dynamic> map) {
    return Email(
      receipientEmail: map['receipientEmail'],
      receipientName: map['receipientName'],
      subject: map['subject'],
      message: map['message'],
      time: map['time'],
      isSent: map['isSent'],
      ref: map['ref'],
      patientRef: map['patientRef'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Email.fromJson(String source) => Email.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Email(receipientEmail: $receipientEmail, receipientName: $receipientName, subject: $subject, message: $message, time: $time, isSent: $isSent, ref: $ref, patientRef: $patientRef)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Email &&
        other.receipientEmail == receipientEmail &&
        other.receipientName == receipientName &&
        other.subject == subject &&
        other.message == message &&
        other.time == time &&
        other.isSent == isSent &&
        other.ref == ref &&
        other.patientRef == patientRef;
  }

  @override
  int get hashCode {
    return receipientEmail.hashCode ^
        receipientName.hashCode ^
        subject.hashCode ^
        message.hashCode ^
        time.hashCode ^
        isSent.hashCode ^
        ref.hashCode ^
        patientRef.hashCode;
  }

  Map<String, dynamic> get firebaseObject {
    final map = toMap();
    map["time"] = Timestamp.now();
    map.remove("ref");
    return map;
  }
}
