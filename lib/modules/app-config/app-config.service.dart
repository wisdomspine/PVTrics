import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vptrics/modules/app-config/models/app-config.model.dart';

class AppConfigService extends ChangeNotifier {
  late AppConfig _config;

  AppConfigService() {
    _init();
  }

  _init() {
    GetIt.I<FirebaseFirestore>()
        .doc("config/production")
        .snapshots()
        .listen((snapshot) {
      this._config = AppConfig.fromMap(snapshot.data() ?? {});
      notifyListeners();
    });
  }

  AppConfig get config => _config;
}
