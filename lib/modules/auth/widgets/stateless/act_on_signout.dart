import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:vptrics/modules/auth/widgets/stateful/login_screen.dart';

class ActOnSignout extends StatelessWidget with GetItMixin {
  final bool? signout;
  final Widget child;
  ActOnSignout({Key? key, this.signout, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    registerStreamHandler<FirebaseAuth, User>(
        (FirebaseAuth auth) => auth.authStateChanges(),
        (context, newValue, cancel) async {
      if (newValue.data == null && (signout ?? true)) {
        // use has signed out and redirection is enabled
        Navigator.pushNamedAndRemoveUntil(
            context, LoginScreen.route, (route) => false);
      }
    });
    return child;
  }
}
