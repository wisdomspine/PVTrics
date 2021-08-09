import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:vptrics/modules/core/enums/gender.enum.dart' as app_gender;

class Patient {
  final String address;
  final DateTime dob;
  final String email;
  final String firstname;
  final app_gender.Gender? gender;
  final String lastname;
  final String phone;
  final String photo;
  final DocumentReference? ref;
  Patient({
    required this.address,
    required this.dob,
    required this.email,
    required this.firstname,
    required this.gender,
    required this.lastname,
    required this.phone,
    required this.photo,
    this.ref,
  });

  Patient copyWith({
    String? address,
    DateTime? dob,
    String? email,
    String? firstname,
    app_gender.Gender? gender,
    String? lastname,
    String? phone,
    String? photo,
    DocumentReference? ref,
  }) {
    return Patient(
      address: address ?? this.address,
      dob: dob ?? this.dob,
      email: email ?? this.email,
      firstname: firstname ?? this.firstname,
      gender: gender ?? this.gender,
      lastname: lastname ?? this.lastname,
      phone: phone ?? this.phone,
      photo: photo ?? this.photo,
      ref: ref ?? this.ref,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'dob': dob,
      'email': email,
      'firstname': firstname,
      'gender': app_gender.toString(gender),
      'lastname': lastname,
      'phone': phone,
      'photo': photo,
      'ref': ref,
    };
  }

  factory Patient.fromMap(Map<String, dynamic> map) {
    return Patient(
      address: map['address'],
      dob: map['dob'],
      email: map['email'],
      firstname: map['firstname'],
      gender: app_gender.fromString(map['gender']),
      lastname: map['lastname'],
      phone: map['phone'],
      photo: map['photo'],
      ref: map['ref'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Patient.fromJson(String source) =>
      Patient.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Patient(address: $address, dob: $dob, email: $email, firstname: $firstname, gender: $gender, lastname: $lastname, phone: $phone, photo: $photo, ref: $ref)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Patient &&
        other.address == address &&
        other.dob == dob &&
        other.email == email &&
        other.firstname == firstname &&
        other.gender == gender &&
        other.lastname == lastname &&
        other.phone == phone &&
        other.photo == photo &&
        other.ref == ref;
  }

  @override
  int get hashCode {
    return address.hashCode ^
        dob.hashCode ^
        email.hashCode ^
        firstname.hashCode ^
        gender.hashCode ^
        lastname.hashCode ^
        phone.hashCode ^
        photo.hashCode ^
        ref.hashCode;
  }

  String? get genderLabel {
    return app_gender.genderLabel(gender);
  }

  int? get years {
    DateTime now = DateTime.now();
    return (now.difference(dob).inDays / 365.25).floor();
  }

  String get name {
    return "$firstname $lastname";
  }

  Map<String, dynamic> get firebaseObject {
    final map = toMap();
    map["dob"] = Timestamp.fromDate(dob);
    map.remove("ref");
    return map;
  }
}
