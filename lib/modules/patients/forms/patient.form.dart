import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:vptrics/modules/core/enums/gender.enum.dart';
import 'package:vptrics/modules/core/validation/app_validators.dart';
import 'package:vptrics/modules/patients/models/patient.model.dart';

class PatientForm extends FormGroup {
  final Patient? patient;
  PatientForm({this.patient})
      : super({
          firstnameControlName:
              FormControl<String>(value: patient?.firstname, validators: [
            Validators.required,
            AppValidators.notEmpty,
          ]),
          lastnameControlName:
              FormControl<String>(value: patient?.lastname, validators: [
            Validators.required,
            AppValidators.notEmpty,
          ]),
          dobControlName: FormControl<DateTime>(
            value: patient?.dob,
            validators: [Validators.required],
          ),
          genderControlName: FormControl<Gender>(
            value: patient?.gender,
            validators: [Validators.required],
          ),
          phoneControlName:
              FormControl<String>(value: patient?.phone, validators: [
            Validators.required,
            AppValidators.notEmpty,
          ], asyncValidators: [
            AppValidators.phone,
          ]),
          emailControlName:
              FormControl<String>(value: patient?.email, validators: [
            Validators.required,
            Validators.email,
          ]),
          addressControlName:
              FormControl<String>(value: patient?.address, validators: [
            Validators.required,
            AppValidators.notEmpty,
          ]),
          photoControlName: FormControl<XFile>(
            validators: patient == null ? [Validators.required] : [],
          ),
        });

  Patient get asPatient {
    return Patient(
      address: controls[addressControlName]?.value as String,
      dob: controls[dobControlName]?.value as DateTime,
      email: controls[emailControlName]?.value as String,
      firstname: controls[firstnameControlName]?.value as String,
      gender: controls[genderControlName]?.value as Gender,
      lastname: controls[lastnameControlName]?.value as String,
      phone: controls[phoneControlName]?.value as String,
      photo: patient?.photo ?? "",
    );
  }

  static const String firstnameControlName = "firstname";
  static const String lastnameControlName = "lastname";
  static const String dobControlName = "dob";
  static const String genderControlName = "gender";
  static const String phoneControlName = "phone";
  static const String emailControlName = "email";
  static const String addressControlName = "address";
  static const String photoControlName = "photo";
}
