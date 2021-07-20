import 'package:reactive_forms/reactive_forms.dart';

class LoginForm extends FormGroup {
  LoginForm()
      : super(
          {
            emailControlName: FormControl(),
            passwordControlName: FormControl(),
          },
        );

  static const String emailControlName = "email";
  static const String passwordControlName = "password";
}
