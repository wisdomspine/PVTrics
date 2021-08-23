import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:vptrics/app_route.dart';
import 'package:vptrics/modules/core/services/app_info.service.dart';
import 'package:vptrics/modules/core/services/app_secure_storage.service.dart';
import 'package:vptrics/modules/devices/devices.service.dart';
import 'package:vptrics/modules/metrics/metrics.service.dart';
import 'package:vptrics/modules/patients/patients.service.dart';

/// A static  class with an init method to load dependencies
class AppLoader {
  AppLoader() {
    throw new Exception("[AppLoader] can't be instantiated");
  }
  static void init() {
    GetIt.I.registerSingleton(new AppRoute());
    GetIt.I.registerSingletonAsync<FirebaseApp>(() => Firebase.initializeApp());
    GetIt.I.registerSingletonWithDependencies<FirebaseAuth>(
        () => FirebaseAuth.instance,
        dependsOn: [FirebaseApp]);
    GetIt.I.registerSingletonWithDependencies<FirebaseFirestore>(
        () => FirebaseFirestore.instance,
        dependsOn: [FirebaseApp]);
    GetIt.I.registerSingletonWithDependencies<FirebaseStorage>(
        () => FirebaseStorage.instance,
        dependsOn: [FirebaseApp]);

    GetIt.I.registerSingleton(new AppSecureStorageService());
    GetIt.I.registerSingletonWithDependencies<DevicesService>(
      () => new DevicesService(),
      dependsOn: [FirebaseFirestore],
    );
    GetIt.I.registerSingletonWithDependencies<PatientsService>(
      () => new PatientsService(),
      dependsOn: [FirebaseFirestore],
    );
    GetIt.I.registerSingletonWithDependencies<MetricsService>(
      () => new MetricsService(),
      dependsOn: [FirebaseFirestore],
    );
    GetIt.I.registerSingleton(
      new AppInfoService(),
    );
  }
}
