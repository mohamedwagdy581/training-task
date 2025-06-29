import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveString({
    required String key,
    required String value,
  }) async {
    await _prefs.setString(key, value);
  }

  static String? getString({required String key}) {
    return _prefs.getString(key);
  }

  static Future<void> saveBool({
    required String key,
    required bool value,
  }) async {
    await _prefs.setBool(key, value);
  }

  static bool? getBool({required String key}) {
    return _prefs.getBool(key);
  }

  static Future<void> remove({required String key}) async {
    await _prefs.remove(key);
  }

  static Future<void> clear() async {
    await _prefs.clear();
  }
}
