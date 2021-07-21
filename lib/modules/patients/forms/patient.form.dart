import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:vptrics/modules/core/enums/gender.enum.dart';

class PatientForm extends FormGroup {
  PatientForm()
      : super({
          firstnameControlName: FormControl<String>(),
          lastnameControlName: FormControl<String>(),
          dobControlName: FormControl<DateTime>(),
          genderControlName: FormControl<Gender>(),
          phoneControlName: FormControl<String>(),
          emailControlName: FormControl<String>(),
          addressControlName: FormControl<String>(),
          photoControlName: FormControl<XFile>(),
        });

  static const String firstnameControlName = "firstname";
  static const String lastnameControlName = "lastname";
  static const String dobControlName = "dob";
  static const String genderControlName = "gender";
  static const String phoneControlName = "phone";
  static const String emailControlName = "email";
  static const String addressControlName = "address";
  static const String photoControlName = "photo";
}
