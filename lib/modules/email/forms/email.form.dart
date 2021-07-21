import 'package:reactive_forms/reactive_forms.dart';

class EmailForm extends FormGroup {
  EmailForm()
      : super({
          subjectControlName: new FormControl<String>(),
          messageControlName: new FormControl<String>(),
        });

  static const String subjectControlName = "subject";
  static const String messageControlName = "message";
}
