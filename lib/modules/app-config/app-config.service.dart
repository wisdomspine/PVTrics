import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vptrics/modules/app-config/models/app-config.model.dart';

class AppConfigService extends ChangeNotifier {
  late AppConfig _config;
  StreamSubscription? _subscription;

  AppConfigService() {
    _init();
    GetIt.I<FirebaseAuth>().userChanges().listen((event) {
      _init();
    });
  }

  _init() {
    _subscription?.cancel();
    _subscription = GetIt.I<FirebaseFirestore>()
        .doc("config/production")
        .snapshots()
        .listen((snapshot) {
      this._config = AppConfig.fromMap(snapshot.data() ?? {});
      notifyListeners();
    });
  }

  AppConfig get config => _config;
}
