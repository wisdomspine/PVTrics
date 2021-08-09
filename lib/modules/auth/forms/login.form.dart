import 'package:reactive_forms/reactive_forms.dart';

class LoginForm extends FormGroup {
  LoginForm()
      : super(
          {
            emailControlName: FormControl(validators: [
              Validators.required,
              Validators.email,
            ]),
            passwordControlName: FormControl(validators: [Validators.required]),
          },
        );

  static const String emailControlName = "email";
  static const String passwordControlName = "password";
}
