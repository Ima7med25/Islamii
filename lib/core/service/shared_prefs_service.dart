import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPrefsService {
  static late SharedPreferences pref;

  static Future<void> init() async {
    pref = await SharedPreferences.getInstance();
  }

  static Future<void> setData(String key, dynamic value) async {
    if (value is String) {
      await pref.setString(key, value);
    }
    if (value is int) {
      await pref.setInt(key, value);
    }
    if (value is bool) {
      await pref.setBool(key, value);
    }
    if (value is double) {
      await pref.setDouble(key, value);
    }
  }

  static dynamic getData(String key) {
    return pref.get(key);
  }

  static Future<void> removeData(String key) async {
    await pref.remove(key);
  }

  static Future<void> clear() async {
    await pref.clear();
  }
}
