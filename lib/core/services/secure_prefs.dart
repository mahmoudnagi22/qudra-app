import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecurePrefs {
  static late FlutterSecureStorage _instance;

  static Future<void> init() async {
    _instance = const FlutterSecureStorage();
  }

  static Future<void> setString(String key, String value) async {
    await _instance.write(key: key, value: value);
  }

  static Future<String?> getString(String key) async {
    return await _instance.read(key: key);
  }

  static Future<void> setBool(String key, bool value) async {
    await _instance.write(key: key, value: value.toString());
  }

  static Future<bool> getBool(String key) async {
    final val = await _instance.read(key: key);
    return val == 'true';
  }

  static Future<void> remove(String key) async {
    await _instance.delete(key: key);
  }

  static Future<void> clear() async {
    await _instance.deleteAll();
  }
}
