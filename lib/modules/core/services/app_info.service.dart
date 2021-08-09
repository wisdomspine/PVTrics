import 'package:get_it/get_it.dart';
import 'package:vptrics/modules/core/services/app_secure_storage.service.dart';

class AppInfoService {
  static const String _firstLaunchKey = "isFirstLaunch";

  Future<bool> get isFirstLaunch async {
    var value =
        await GetIt.I.get<AppSecureStorageService>().read(_firstLaunchKey);
    return value == null ? true : false;
  }

  Future<void> launched() {
    return GetIt.I
        .get<AppSecureStorageService>()
        .set(_firstLaunchKey, "first launch executed");
  }

  String get title => 'VPTrics';

  String get version => "1.0.0";
}
