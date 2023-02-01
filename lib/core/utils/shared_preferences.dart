import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (value is String) {
      return await sharedPreferences.setString(
        key,
        value,
      );
    }

    if (value is int) {
      return await sharedPreferences.setInt(
        key,
        value,
      );
    }
    if (value is bool) {
      return await sharedPreferences.setBool(
        key,
        value,
      );
    }

    return await sharedPreferences.setDouble(
      key,
      value,
    );
  }

  static  getData({
    required String key,
  }) {
    return  sharedPreferences!.get(key);
  }
}
