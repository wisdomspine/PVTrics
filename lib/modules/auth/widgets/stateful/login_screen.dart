import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:vptrics/modules/auth/forms/login.form.dart';
import 'package:vptrics/modules/notifications/services/snackbar.service.dart';
import 'package:vptrics/modules/patients/widgets/stateless/patients_screen.dart';
import 'package:vptrics/shared_widgets/stateless/loading_screen.dart';

class LoginScreen extends StatefulWidget with GetItStatefulWidgetMixin {
  static const String route = "LoginScreen";
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with GetItStateMixin {
  final LoginForm _loginForm = LoginForm();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    final InputDecoration decoration = InputDecoration(
      hintText: "Email",
      enabledBorder: (Theme.of(context).inputDecorationTheme.enabledBorder
              as OutlineInputBorder)
          .copyWith(
        borderRadius: BorderRadius.circular(50),
      ),
      focusedBorder: (Theme.of(context).inputDecorationTheme.focusedBorder
              as OutlineInputBorder)
          .copyWith(
        borderRadius: BorderRadius.circular(50),
      ),
      focusedErrorBorder: (Theme.of(context)
              .inputDecorationTheme
              .focusedErrorBorder as OutlineInputBorder)
          .copyWith(
        borderRadius: BorderRadius.circular(50),
      ),
      errorBorder: (Theme.of(context).inputDecorationTheme.errorBorder
              as OutlineInputBorder)
          .copyWith(
        borderRadius: BorderRadius.circular(50),
      ),
    );
    return LoadingScreen(
      loading: _loading,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor.withOpacity(.8),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Theme.of(context).dividerColor.withOpacity(.15),
                    ),
                  ),
                  child: ReactiveForm(
                    formGroup: _loginForm,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Login",
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.headline5?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        ReactiveTextField(
                          formControlName: LoginForm.emailControlName,
                          keyboardType: TextInputType.emailAddress,
                          validationMessages: (control) => {
                            ValidationMessage.required: "Email is required",
                            ValidationMessage.email: "Invalid email address",
                          },
                          decoration: decoration.copyWith(hintText: "Email"),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        ReactiveTextField(
                          formControlName: LoginForm.passwordControlName,
                          obscureText: true,
                          obscuringCharacter: "*",
                          validationMessages: (control) => {
                            ValidationMessage.required: "Password is required"
                          },
                          decoration: decoration.copyWith(hintText: "Password"),
                        ),
                        SizedBox(
                          height: 52,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            login();
                          },
                          child: Text(
                            "Login",
                            style: Theme.of(context)
                                .accentTextTheme
                                .subtitle1
                                ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  login() {
    if (!_loginForm.valid) {
      setState(() {});
      return;
    }
    setState(() {
      _loading = true;
    });
    get<FirebaseAuth>()
        .signInWithEmailAndPassword(
      email: _loginForm.controls[LoginForm.emailControlName]?.value as String,
      password:
          _loginForm.controls[LoginForm.passwordControlName]?.value as String,
    )
        .then((value) {
      Navigator.pushNamedAndRemoveUntil(
          context, PatientsScreen.route, (route) => false);
    }).catchError((error) {
      setState(() {
        _loading = false;
      });
      String message = "Sorry, An error has occured";
      if (error is FirebaseAuthException) {
        message = error.message ?? message;
      }
      SnackbarService.errorText(context: context, message: message);
    });
  }
}
