import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:vptrics/modules/auth/forms/login.form.dart';

class LoginScreen extends StatefulWidget {
  static const String route = "LoginScreen";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginForm _loginForm = LoginForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      ReactiveTextField(
                        formControlName: LoginForm.emailControlName,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Email",
                          enabledBorder: (Theme.of(context)
                                  .inputDecorationTheme
                                  .enabledBorder as OutlineInputBorder)
                              .copyWith(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: (Theme.of(context)
                                  .inputDecorationTheme
                                  .focusedBorder as OutlineInputBorder)
                              .copyWith(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      ReactiveTextField(
                        formControlName: LoginForm.passwordControlName,
                        obscureText: true,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          hintText: "Password",
                          enabledBorder: (Theme.of(context)
                                  .inputDecorationTheme
                                  .enabledBorder as OutlineInputBorder)
                              .copyWith(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: (Theme.of(context)
                                  .inputDecorationTheme
                                  .focusedBorder as OutlineInputBorder)
                              .copyWith(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 52,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // TODO: Login
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
    );
  }
}
