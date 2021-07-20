 import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppSecureStorageService {
  static const String appPrefix = "vptrics_1.0_";
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<String?> read(String key) {
    return _storage.read(key: _keyPath(key));
  }

  Future<void> set(String key, String value) async {
    return _storage.write(key: _keyPath(key), value: value);

  }

  Future<void> remove(String key) async {
    return _storage.delete(key: _keyPath(key));
  }

  String _keyPath(String key) {
    return "$appPrefix$key";
  }
}
