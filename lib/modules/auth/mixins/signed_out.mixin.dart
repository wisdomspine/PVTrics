import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:vptrics/modules/auth/widgets/stateful/login_screen.dart';

///
/// This mixin can be used by all routes/screen that wants to enable redirect on signout
class SignedOutMixin extends StatelessWidget with _SignedOutWidget, GetItMixin {
  SignedOutMixin() {
    registerStreamHandler<FirebaseAuth, User>(
        (FirebaseAuth auth) => auth.authStateChanges(),
        (context, newValue, cancel) async {
      if (newValue.data == null && await canRedirectOnSignedOut()) {
        // use has signed out and redirection is enabled
        Navigator.pushNamedAndRemoveUntil(
            context, LoginScreen.route, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  ///
  ///overload this method to determine if a redirect to login screen should happen on
  ///signedout or not.
  ///Ideally, this will return false on auth pages
  FutureOr<bool> canRedirectOnSignedOut() {
    return true;
  }
}

mixin _SignedOutWidget on Widget {}

///
/// This mixin can be used by all state of stateful widgets that wants to enable redirect on signout
class SignedOutStateMixin<T extends GetItStatefulWidgetMixin> extends State<T>
    with GetItStateMixin<T> {
  SignedOutStateMixin() {
    registerStreamHandler<FirebaseAuth, User?>(
        (FirebaseAuth auth) => auth.authStateChanges(),
        (context, newValue, cancel) async {
      if (newValue.data == null && await canRedirectOnSignedOut()) {
        // use has signed out and redirection is enabled
        Navigator.pushNamedAndRemoveUntil(
            context, LoginScreen.route, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  ///
  ///overload this method to determine if a redirect to login screen should happen on
  ///signedout or not.
  ///Ideally, this will return false on auth pages
  FutureOr<bool> canRedirectOnSignedOut() {
    return true;
  }
}
